`timescale 1ns / 1ps

module virtual_plant (
    input  logic        clk_100m,
    input  logic        rst_n,
    input  logic        soft_reset,

    input  logic        tick_100ms,
    input  logic        run_enable,
    input  logic [31:0] u_in,
    output logic [31:0] current_t
);

    // --------------------------------------------------
    // 플랜트 상수, IEEE754 Float
    //
    // Plant 식:
    // T[k+1] = 0.9875 * T[k] + 1.5 * u_delay[k] + 0.3125
    // --------------------------------------------------
    localparam logic [31:0] FLOAT_0_9875 = 32'h3F7CCCCD;
    localparam logic [31:0] FLOAT_1_5    = 32'h3FC00000;
    localparam logic [31:0] FLOAT_0_3125 = 32'h3EA00000;
    localparam logic [31:0] FLOAT_25_0   = 32'h41C80000;
    localparam logic [31:0] FLOAT_0_0    = 32'h00000000;

    // 입력 지연 버퍼: 5-sample delay
    logic [31:0] u_delay [0:4];

    integer i;

    // --------------------------------------------------
    // FSM 상태
    // --------------------------------------------------
    typedef enum logic [3:0] {
        IDLE,
        MULT_START,
        MULT_WAIT,
        ADD1_START,
        ADD1_WAIT,
        ADD2_START,
        ADD2_WAIT
    } state_t;

    state_t state;

    // --------------------------------------------------
    // Floating-point multiplier #1
    // 0.9875 * current_t
    // --------------------------------------------------
    logic        mult1_valid;
    logic [31:0] mult1_a;
    logic [31:0] mult1_b;
    logic        mult1_done;
    logic [31:0] mult1_res;

    // --------------------------------------------------
    // Floating-point multiplier #2
    // 1.5 * u_delay[4]
    // --------------------------------------------------
    logic        mult2_valid;
    logic [31:0] mult2_a;
    logic [31:0] mult2_b;
    logic        mult2_done;
    logic [31:0] mult2_res;

    // --------------------------------------------------
    // Floating-point adder
    // --------------------------------------------------
    logic        add_valid;
    logic [31:0] add_a;
    logic [31:0] add_b;
    logic        add_done;
    logic [31:0] add_res;

    // 중간 결과 저장
    logic [31:0] temp_mult1;
    logic [31:0] temp_mult2;
    logic [31:0] temp_add1;

    // 곱셈 결과 수신 flag
    // 두 multiplier 결과가 같은 클럭에 안 나와도 안전하게 받기 위함
    logic mult1_got;
    logic mult2_got;

    // --------------------------------------------------
    // Floating-Point IP instantiation
    // --------------------------------------------------
    fp_mult u_mult1 (
        .aclk                  (clk_100m),

        .s_axis_a_tvalid       (mult1_valid),
        .s_axis_a_tdata        (mult1_a),

        .s_axis_b_tvalid       (mult1_valid),
        .s_axis_b_tdata        (mult1_b),

        .m_axis_result_tvalid  (mult1_done),
        .m_axis_result_tdata   (mult1_res),
        .m_axis_result_tready  (1'b1)
    );

    fp_mult u_mult2 (
        .aclk                  (clk_100m),

        .s_axis_a_tvalid       (mult2_valid),
        .s_axis_a_tdata        (mult2_a),

        .s_axis_b_tvalid       (mult2_valid),
        .s_axis_b_tdata        (mult2_b),

        .m_axis_result_tvalid  (mult2_done),
        .m_axis_result_tdata   (mult2_res),
        .m_axis_result_tready  (1'b1)
    );

    fp_add u_add (
        .aclk                  (clk_100m),

        .s_axis_a_tvalid       (add_valid),
        .s_axis_a_tdata        (add_a),

        .s_axis_b_tvalid       (add_valid),
        .s_axis_b_tdata        (add_b),

        .m_axis_result_tvalid  (add_done),
        .m_axis_result_tdata   (add_res),
        .m_axis_result_tready  (1'b1)
    );

    // --------------------------------------------------
    // Main FSM
    // --------------------------------------------------
    always_ff @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            state     <= IDLE;
            current_t <= FLOAT_25_0;

            mult1_valid <= 1'b0;
            mult2_valid <= 1'b0;
            add_valid   <= 1'b0;

            mult1_a <= 32'd0;
            mult1_b <= 32'd0;
            mult2_a <= 32'd0;
            mult2_b <= 32'd0;
            add_a   <= 32'd0;
            add_b   <= 32'd0;

            temp_mult1 <= 32'd0;
            temp_mult2 <= 32'd0;
            temp_add1  <= 32'd0;

            mult1_got <= 1'b0;
            mult2_got <= 1'b0;

            for (i = 0; i < 5; i = i + 1) begin
                u_delay[i] <= FLOAT_0_0;
            end
        end

        // --------------------------------------------------
        // 소프트 RESET
        //
        // PC에서 CMD_RESET이 들어왔을 때 cmd_reset_pulse를 연결.
        // 현재 온도, delay buffer, FSM, IP valid 신호를 모두 초기화.
        // --------------------------------------------------
        else if (soft_reset) begin
            state     <= IDLE;
            current_t <= FLOAT_25_0;

            mult1_valid <= 1'b0;
            mult2_valid <= 1'b0;
            add_valid   <= 1'b0;

            mult1_a <= 32'd0;
            mult1_b <= 32'd0;
            mult2_a <= 32'd0;
            mult2_b <= 32'd0;
            add_a   <= 32'd0;
            add_b   <= 32'd0;

            temp_mult1 <= 32'd0;
            temp_mult2 <= 32'd0;
            temp_add1  <= 32'd0;

            mult1_got <= 1'b0;
            mult2_got <= 1'b0;

            for (i = 0; i < 5; i = i + 1) begin
                u_delay[i] <= FLOAT_0_0;
            end
        end

        else begin
            // valid는 기본적으로 0.
            // 각 START 상태에서만 1클럭 pulse로 올림.
            mult1_valid <= 1'b0;
            mult2_valid <= 1'b0;
            add_valid   <= 1'b0;

            case (state)

                IDLE: begin
                    mult1_got <= 1'b0;
                    mult2_got <= 1'b0;

                    if (tick_100ms && run_enable) begin
                        // 5-sample delay shift
                        u_delay[4] <= u_delay[3];
                        u_delay[3] <= u_delay[2];
                        u_delay[2] <= u_delay[1];
                        u_delay[1] <= u_delay[0];
                        u_delay[0] <= u_in;

                        state <= MULT_START;
                    end
                end

                // --------------------------------------------------
                // 1단계: 곱셈 2개 시작
                // --------------------------------------------------
                MULT_START: begin
                    mult1_got <= 1'b0;
                    mult2_got <= 1'b0;

                    mult1_valid <= 1'b1;
                    mult1_a     <= FLOAT_0_9875;
                    mult1_b     <= current_t;

                    mult2_valid <= 1'b1;
                    mult2_a     <= FLOAT_1_5;
                    mult2_b     <= u_delay[4];

                    state <= MULT_WAIT;
                end

                // --------------------------------------------------
                // 두 곱셈 결과 대기
                // 결과가 같은 클럭에 안 나와도 각각 저장
                // --------------------------------------------------
                MULT_WAIT: begin
                    if (mult1_done) begin
                        temp_mult1 <= mult1_res;
                        mult1_got  <= 1'b1;
                    end

                    if (mult2_done) begin
                        temp_mult2 <= mult2_res;
                        mult2_got  <= 1'b1;
                    end

                    if ((mult1_got || mult1_done) &&
                        (mult2_got || mult2_done)) begin
                        state <= ADD1_START;
                    end
                end

                // --------------------------------------------------
                // 2단계: temp_mult1 + temp_mult2
                // --------------------------------------------------
                ADD1_START: begin
                    add_valid <= 1'b1;
                    add_a     <= temp_mult1;
                    add_b     <= temp_mult2;
                    state     <= ADD1_WAIT;
                end

                ADD1_WAIT: begin
                    if (add_done) begin
                        temp_add1 <= add_res;
                        state     <= ADD2_START;
                    end
                end

                // --------------------------------------------------
                // 3단계: temp_add1 + 0.3125
                // --------------------------------------------------
                ADD2_START: begin
                    add_valid <= 1'b1;
                    add_a     <= temp_add1;
                    add_b     <= FLOAT_0_3125;
                    state     <= ADD2_WAIT;
                end

                ADD2_WAIT: begin
                    if (add_done) begin
                        current_t <= add_res;
                        state     <= IDLE;
                    end
                end

                default: begin
                    state <= IDLE;
                end

            endcase
        end
    end

endmodule