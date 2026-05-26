`timescale 1ns / 1ps

module pwm_gen_float (
    input  logic        clk_100m,
    input  logic        rst_n,

    // IEEE754 float, 0.0 ~ 1.0
    input  logic [31:0] u_in_float,

    output logic        pwm_out,

    // 디버깅용: 현재 duty count
    output logic [31:0] duty_cnt_dbg
);

    // 1kHz PWM: 100MHz / 1000Hz = 100,000 clocks
    localparam int unsigned MAX_CNT = 100_000;

    logic [16:0] clk_cnt;
    logic [31:0] duty_cnt;

    // --------------------------------------------------
    // IEEE754 float 0.0~1.0 값을 duty count로 변환
    //
    // float value = mantissa * 2^(exp - 127 - 23)
    // duty = value * MAX_CNT
    // --------------------------------------------------
    function automatic [31:0] float01_to_duty (
        input logic [31:0] f
    );
        logic        sign;
        logic [7:0]  exp;
        logic [22:0] frac;
        logic [23:0] mant;
        logic [47:0] prod;
        int          shift;
        logic [31:0] result;
    begin
        sign = f[31];
        exp  = f[30:23];
        frac = f[22:0];

        // 음수, 0, subnormal은 duty 0으로 처리
        if (sign || exp == 8'd0) begin
            result = 32'd0;
        end

        // exp >= 127이면 값이 1.0 이상일 수 있으므로 100%로 clamp
        // 1.0 = 0x3F800000, exp = 127
        else if (exp >= 8'd127) begin
            result = MAX_CNT;
        end

        else begin
            // normalized float mantissa = 1.frac
            mant = {1'b1, frac};

            // duty = mant * MAX_CNT >> (150 - exp)
            // 150 = 127 + 23
            prod  = mant * MAX_CNT;
            shift = 150 - exp;

            if (shift >= 48) begin
                result = 32'd0;
            end else begin
                result = prod >> shift;

                if (result > MAX_CNT)
                    result = MAX_CNT;
            end
        end

        float01_to_duty = result;
    end
    endfunction

    always_ff @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            clk_cnt      <= '0;
            duty_cnt     <= '0;
            duty_cnt_dbg <= '0;
            pwm_out      <= 1'b0;
        end else begin

            // PWM period counter
            if (clk_cnt == MAX_CNT - 1) begin
                clk_cnt <= '0;

                // 주기 시작점에서만 duty 갱신
                duty_cnt     <= float01_to_duty(u_in_float);
                duty_cnt_dbg <= float01_to_duty(u_in_float);
            end else begin
                clk_cnt <= clk_cnt + 1'b1;
            end

            // PWM output
            if (clk_cnt < duty_cnt)
                pwm_out <= 1'b1;
            else
                pwm_out <= 1'b0;
        end
    end

endmodule