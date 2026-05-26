`timescale 1ns / 1ps

module sensor_delay_float #(
    parameter int DELAY_SAMPLES = 5
)(
    input  logic        clk_100m,
    input  logic        rst_n,
    input  logic        soft_reset,

    input  logic        tick_100ms,

    input  logic [31:0] temp_in,    // 실제 Plant 온도 current_temp
    output logic [31:0] temp_out    // 지연된 센서 온도 sensed_temp
);

    // Float 25.0 = 0x41C80000
    localparam logic [31:0] FLOAT_25_0 = 32'h41C80000;

    generate
        if (DELAY_SAMPLES == 0) begin : GEN_NO_SENSOR_DELAY

            // 센서 지연 없음
            always_comb begin
                temp_out = temp_in;
            end

        end else begin : GEN_SENSOR_DELAY

            logic [31:0] delay_buf [0:DELAY_SAMPLES-1];
            integer i;

            always_ff @(posedge clk_100m or negedge rst_n) begin
                if (!rst_n) begin
                    temp_out <= FLOAT_25_0;

                    for (i = 0; i < DELAY_SAMPLES; i = i + 1) begin
                        delay_buf[i] <= FLOAT_25_0;
                    end
                end else if (soft_reset) begin
                    temp_out <= FLOAT_25_0;

                    for (i = 0; i < DELAY_SAMPLES; i = i + 1) begin
                        delay_buf[i] <= FLOAT_25_0;
                    end
                end else if (tick_100ms) begin
                    // 100ms마다 센서값 shift
                    delay_buf[0] <= temp_in;

                    for (i = 1; i < DELAY_SAMPLES; i = i + 1) begin
                        delay_buf[i] <= delay_buf[i-1];
                    end

                    // DELAY_SAMPLES 만큼 지난 온도를 제어기에 전달
                    temp_out <= delay_buf[DELAY_SAMPLES-1];
                end
            end

        end
    endgenerate

endmodule