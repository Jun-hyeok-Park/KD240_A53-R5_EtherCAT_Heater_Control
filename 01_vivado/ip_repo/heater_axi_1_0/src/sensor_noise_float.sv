`timescale 1ns / 1ps

module sensor_noise_float (
    input  logic        clk_100m,
    input  logic        rst_n,
    input  logic        soft_reset,

    input  logic        tick_100ms,

    // 1이면 노이즈 적용, 0이면 temp_in 그대로 통과
    input  logic        noise_enable,

    // 지연 적용된 센서 온도
    input  logic [31:0] temp_in,

    // 노이즈가 더해진 센서 온도
    output logic [31:0] temp_out,

    // 디버깅용: 현재 더한 노이즈 값
    output logic [31:0] noise_dbg
);

    // --------------------------------------------------
    // Float constants
    // --------------------------------------------------
    localparam logic [31:0] FLOAT_25_0 = 32'h41C80000; // 25.0
    localparam logic [31:0] FLOAT_0_0  = 32'h00000000; // 0.0

    // --------------------------------------------------
    // LFSR pseudo random generator
    //
    // 진짜 랜덤은 아니고 FPGA 내부에서 쓰기 쉬운 pseudo-random.
    // 센서 노이즈 모델링 용도로는 충분함.
    // --------------------------------------------------
    logic [15:0] lfsr;

    // --------------------------------------------------
    // Noise table
    //
    // 범위: 약 -0.5°C ~ +0.5°C
    // 평균이 대략 0이 되도록 대칭 구성
    // --------------------------------------------------
    function automatic logic [31:0] noise_lut(input logic [3:0] idx);
        begin
            case (idx)
                4'h0: noise_lut = 32'hBF000000; // -0.5000
                4'h1: noise_lut = 32'hBEE00000; // -0.4375
                4'h2: noise_lut = 32'hBEC00000; // -0.3750
                4'h3: noise_lut = 32'hBEA00000; // -0.3125
                4'h4: noise_lut = 32'hBE800000; // -0.2500
                4'h5: noise_lut = 32'hBE400000; // -0.1875
                4'h6: noise_lut = 32'hBE000000; // -0.1250
                4'h7: noise_lut = 32'hBD800000; // -0.0625

                4'h8: noise_lut = 32'h3D800000; // +0.0625
                4'h9: noise_lut = 32'h3E000000; // +0.1250
                4'hA: noise_lut = 32'h3E400000; // +0.1875
                4'hB: noise_lut = 32'h3E800000; // +0.2500
                4'hC: noise_lut = 32'h3EA00000; // +0.3125
                4'hD: noise_lut = 32'h3EC00000; // +0.3750
                4'hE: noise_lut = 32'h3EE00000; // +0.4375
                4'hF: noise_lut = 32'h3F000000; // +0.5000

                default: noise_lut = FLOAT_0_0;
            endcase
        end
    endfunction

    // --------------------------------------------------
    // Floating point adder
    //
    // temp_out = temp_in + noise
    // --------------------------------------------------
    logic        add_valid;
    logic [31:0] add_a;
    logic [31:0] add_b;
    logic        add_done;
    logic [31:0] add_res;

    fp_add u_add_noise (
        .aclk(clk_100m),

        .s_axis_a_tvalid(add_valid),
        .s_axis_a_tdata(add_a),

        .s_axis_b_tvalid(add_valid),
        .s_axis_b_tdata(add_b),

        .m_axis_result_tvalid(add_done),
        .m_axis_result_tdata(add_res),
        .m_axis_result_tready(1'b1)
    );

    typedef enum logic [1:0] {
        S_IDLE,
        S_ADD_START,
        S_ADD_WAIT
    } state_t;

    state_t state;

    logic [31:0] noise_float;

    always_ff @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            state       <= S_IDLE;
            lfsr        <= 16'hACE1;

            temp_out    <= FLOAT_25_0;
            noise_dbg   <= FLOAT_0_0;
            noise_float <= FLOAT_0_0;

            add_valid   <= 1'b0;
            add_a       <= 32'd0;
            add_b       <= 32'd0;
        end

        else if (soft_reset) begin
            state       <= S_IDLE;
            lfsr        <= 16'hACE1;

            temp_out    <= FLOAT_25_0;
            noise_dbg   <= FLOAT_0_0;
            noise_float <= FLOAT_0_0;

            add_valid   <= 1'b0;
            add_a       <= 32'd0;
            add_b       <= 32'd0;
        end

        else begin
            add_valid <= 1'b0;

            case (state)

                S_IDLE: begin
                    if (tick_100ms) begin
                        // LFSR 업데이트
                        lfsr <= {
                            lfsr[14:0],
                            lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10]
                        };

                        if (noise_enable) begin
                            noise_float <= noise_lut(lfsr[3:0]);
                        end else begin
                            noise_float <= FLOAT_0_0;
                        end

                        state <= S_ADD_START;
                    end
                end

                S_ADD_START: begin
                    add_valid <= 1'b1;
                    add_a     <= temp_in;
                    add_b     <= noise_float;

                    state <= S_ADD_WAIT;
                end

                S_ADD_WAIT: begin
                    if (add_done) begin
                        temp_out  <= add_res;
                        noise_dbg <= noise_float;

                        state <= S_IDLE;
                    end
                end

                default: begin
                    state <= S_IDLE;
                end

            endcase
        end
    end

endmodule