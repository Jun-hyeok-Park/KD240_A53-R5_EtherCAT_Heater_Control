`timescale 1ns / 1ps

module pi_controller (
    input  logic        clk_100m,
    input  logic        rst_n,
    input  logic        soft_reset,

    input  logic        tick_100ms,
    input  logic        run_enable,

    input  logic [31:0] target_t,   // Float
    input  logic [31:0] current_t,  // Float
    input  logic [31:0] kp,         // Float
    input  logic [31:0] ki,         // Float

    output logic [31:0] u_out,      // Float, 0.0 ~ 1.0
    output logic [31:0] err_out,    // Float
    output logic        ctrl_done,  // PI 계산 완료 1클럭 펄스
    output logic        busy        // PI 계산 중
);

    localparam logic [31:0] FLOAT_1_0 = 32'h3F800000; // 1.0
    localparam logic [31:0] FLOAT_0_0 = 32'h00000000; // 0.0

    logic [31:0] i_term;
    logic [31:0] err;
    logic [31:0] p_term;
    logic [31:0] i_add;
    logic [31:0] i_raw;
    logic [31:0] u_raw;

    typedef enum logic [3:0] {
        IDLE,
        CALC_ERR,  WAIT_ERR,
        CALC_MULT, WAIT_MULT,
        CALC_I,    WAIT_I,
        CLAMP_I,
        CALC_U,    WAIT_U,
        CLAMP_U
    } state_t;

    state_t state;

    // Floating point IP control
    logic        add_valid;
    logic [31:0] add_a, add_b;
    logic        add_done;
    logic [31:0] add_res;

    logic        mult1_valid;
    logic [31:0] mult1_a, mult1_b;
    logic        mult1_done;
    logic [31:0] mult1_res;

    logic        mult2_valid;
    logic [31:0] mult2_a, mult2_b;
    logic        mult2_done;
    logic [31:0] mult2_res;

    // 곱셈 결과 수신 flag
    logic mult1_got;
    logic mult2_got;

    fp_add u_add (
        .aclk(clk_100m),

        .s_axis_a_tvalid(add_valid),
        .s_axis_a_tdata(add_a),

        .s_axis_b_tvalid(add_valid),
        .s_axis_b_tdata(add_b),

        .m_axis_result_tvalid(add_done),
        .m_axis_result_tdata(add_res),
        .m_axis_result_tready(1'b1)
    );

    fp_mult u_mult1 (
        .aclk(clk_100m),

        .s_axis_a_tvalid(mult1_valid),
        .s_axis_a_tdata(mult1_a),

        .s_axis_b_tvalid(mult1_valid),
        .s_axis_b_tdata(mult1_b),

        .m_axis_result_tvalid(mult1_done),
        .m_axis_result_tdata(mult1_res),
        .m_axis_result_tready(1'b1)
    );

    fp_mult u_mult2 (
        .aclk(clk_100m),

        .s_axis_a_tvalid(mult2_valid),
        .s_axis_a_tdata(mult2_a),

        .s_axis_b_tvalid(mult2_valid),
        .s_axis_b_tdata(mult2_b),

        .m_axis_result_tvalid(mult2_done),
        .m_axis_result_tdata(mult2_res),
        .m_axis_result_tready(1'b1)
    );

    // --------------------------------------------------
    // 내부 상태 초기화 task
    // always_ff 내부에서 반복되는 reset 코드를 줄이기 위한 task
    // --------------------------------------------------
    task automatic reset_pi_regs;
    begin
        state       <= IDLE;

        i_term      <= FLOAT_0_0;
        err         <= FLOAT_0_0;
        err_out     <= FLOAT_0_0;
        p_term      <= FLOAT_0_0;
        i_add       <= FLOAT_0_0;
        i_raw       <= FLOAT_0_0;
        u_raw       <= FLOAT_0_0;
        u_out       <= FLOAT_0_0;

        add_valid   <= 1'b0;
        mult1_valid <= 1'b0;
        mult2_valid <= 1'b0;

        add_a       <= 32'd0;
        add_b       <= 32'd0;
        mult1_a     <= 32'd0;
        mult1_b     <= 32'd0;
        mult2_a     <= 32'd0;
        mult2_b     <= 32'd0;

        mult1_got   <= 1'b0;
        mult2_got   <= 1'b0;

        ctrl_done   <= 1'b0;
        busy        <= 1'b0;
    end
    endtask

    always_ff @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            reset_pi_regs();
        end

        else if (soft_reset) begin
            reset_pi_regs();
        end

        else begin
            // 기본값: valid/done pulse는 1클럭짜리
            add_valid   <= 1'b0;
            mult1_valid <= 1'b0;
            mult2_valid <= 1'b0;
            ctrl_done   <= 1'b0;

            // STOP이면 즉시 PI 내부 상태 초기화
            if (!run_enable) begin
                state       <= IDLE;

                i_term      <= FLOAT_0_0;
                err         <= FLOAT_0_0;
                err_out     <= FLOAT_0_0;
                p_term      <= FLOAT_0_0;
                i_add       <= FLOAT_0_0;
                i_raw       <= FLOAT_0_0;
                u_raw       <= FLOAT_0_0;
                u_out       <= FLOAT_0_0;

                add_valid   <= 1'b0;
                mult1_valid <= 1'b0;
                mult2_valid <= 1'b0;

                mult1_got   <= 1'b0;
                mult2_got   <= 1'b0;

                ctrl_done   <= 1'b0;
                busy        <= 1'b0;
            end

            else begin
                case (state)

                    IDLE: begin
                        busy <= 1'b0;

                        if (tick_100ms) begin
                            busy  <= 1'b1;
                            state <= CALC_ERR;
                        end
                    end

                    // e = target_t - current_t
                    // float 뺄셈은 current_t의 sign bit를 뒤집어서 add IP에 넣음
                    CALC_ERR: begin
                        add_valid <= 1'b1;
                        add_a     <= target_t;
                        add_b     <= {~current_t[31], current_t[30:0]};
                        state     <= WAIT_ERR;
                    end

                    WAIT_ERR: begin
                        if (add_done) begin
                            err     <= add_res;
                            err_out <= add_res;
                            state   <= CALC_MULT;
                        end
                    end

                    // P = Kp * e
                    // I_add = Ki * e
                    CALC_MULT: begin
                        mult1_got <= 1'b0;
                        mult2_got <= 1'b0;

                        mult1_valid <= 1'b1;
                        mult1_a     <= kp;
                        mult1_b     <= err;

                        mult2_valid <= 1'b1;
                        mult2_a     <= ki;
                        mult2_b     <= err;

                        state <= WAIT_MULT;
                    end

                    WAIT_MULT: begin
                        if (mult1_done) begin
                            p_term    <= mult1_res;
                            mult1_got <= 1'b1;
                        end

                        if (mult2_done) begin
                            i_add     <= mult2_res;
                            mult2_got <= 1'b1;
                        end

                        // 두 곱셈 결과가 모두 들어왔을 때 다음 단계로 진행
                        if ((mult1_got || mult1_done) &&
                            (mult2_got || mult2_done)) begin
                            state <= CALC_I;
                        end
                    end

                    // I_raw = I_term + I_add
                    CALC_I: begin
                        add_valid <= 1'b1;
                        add_a     <= i_term;
                        add_b     <= i_add;
                        state     <= WAIT_I;
                    end

                    WAIT_I: begin
                        if (add_done) begin
                            i_raw <= add_res;
                            state <= CLAMP_I;
                        end
                    end

                    // I_term clamp: -1.0 ~ +1.0
                    CLAMP_I: begin
                        if (i_raw[30:0] > FLOAT_1_0[30:0]) begin
                            i_term <= {i_raw[31], FLOAT_1_0[30:0]};
                        end else begin
                            i_term <= i_raw;
                        end

                        state <= CALC_U;
                    end

                    // u_raw = P + I_term
                    CALC_U: begin
                        add_valid <= 1'b1;
                        add_a     <= p_term;
                        add_b     <= i_term;
                        state     <= WAIT_U;
                    end

                    WAIT_U: begin
                        if (add_done) begin
                            u_raw <= add_res;
                            state <= CLAMP_U;
                        end
                    end

                    // u_out clamp: 0.0 ~ 1.0
                    CLAMP_U: begin
                        if (u_raw[31]) begin
                            u_out <= FLOAT_0_0;
                        end else if (u_raw[30:0] > FLOAT_1_0[30:0]) begin
                            u_out <= FLOAT_1_0;
                        end else begin
                            u_out <= u_raw;
                        end

                        ctrl_done <= 1'b1;
                        busy      <= 1'b0;
                        state     <= IDLE;
                    end

                    default: begin
                        state <= IDLE;
                        busy  <= 1'b0;
                    end

                endcase
            end
        end
    end

endmodule