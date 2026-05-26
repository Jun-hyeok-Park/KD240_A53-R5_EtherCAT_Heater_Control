`timescale 1ns / 1ps

module heater_core_dummy (
    input  logic        clk,
    input  logic        rst_n,

    input  logic [31:0] ctrl_reg,
    input  logic [31:0] target_temp,
    input  logic [31:0] kp,
    input  logic [31:0] ki,

    output logic [31:0] current_t,
    output logic [31:0] error,
    output logic [31:0] u_ctrl,
    output logic [31:0] state_word,
    output logic [31:0] version
);

    localparam logic [31:0] VERSION_VALUE = 32'h20260515;

    // 100 MHz 기준 100 ms = 10,000,000 cycles
    localparam int CNT_100MS_MAX = 10_000_000 - 1;

    logic [23:0] tick_cnt;
    logic        tick_100ms;

    logic [31:0] temp_counter;

    wire run_enable;
    wire reset_cmd;

    assign run_enable = ctrl_reg[0];
    assign reset_cmd  = ctrl_reg[2];

    assign version = VERSION_VALUE;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tick_cnt   <= '0;
            tick_100ms <= 1'b0;
        end else begin
            tick_100ms <= 1'b0;

            if (tick_cnt == CNT_100MS_MAX[23:0]) begin
                tick_cnt   <= '0;
                tick_100ms <= 1'b1;
            end else begin
                tick_cnt <= tick_cnt + 1'b1;
            end
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            temp_counter <= 32'd0;
            current_t    <= 32'd0;
            error        <= 32'd0;
            u_ctrl       <= 32'd0;
            state_word   <= 32'd0;
        end else if (reset_cmd) begin
            temp_counter <= 32'd0;
            current_t    <= 32'd0;
            error        <= 32'd0;
            u_ctrl       <= 32'd0;
            state_word   <= 32'd0;
        end else begin
            if (run_enable) begin
                state_word <= 32'd1;          // RUN
                u_ctrl     <= 32'h3F000000;   // 0.5f dummy duty
                error      <= target_temp;    // dummy value

                if (tick_100ms) begin
                    temp_counter <= temp_counter + 1'b1;
                    current_t    <= temp_counter;
                end
            end else begin
                state_word <= 32'd0;          // IDLE
                u_ctrl     <= 32'd0;
            end
        end
    end

endmodule