`timescale 1ns / 1ps

module system_fsm (
    input  logic        clk_100m,
    input  logic        rst_n,

    input  logic        tick_100ms,

    input  logic        cmd_run_pulse,
    input  logic        cmd_stop_pulse,
    input  logic        cmd_reset_pulse,

    input  logic [31:0] current_t,  // Float
    input  logic [31:0] err,        // Float

    output logic        run_enable,
    output logic [31:0] state_word
);

    localparam logic [31:0] FLOAT_1_0   = 32'h3F800000; // 1.0
    localparam logic [31:0] FLOAT_150_0 = 32'h43160000; // 150.0

    typedef enum logic [1:0] {
        ST_IDLE   = 2'd0,
        ST_RUN    = 2'd1,
        ST_STABLE = 2'd2,
        ST_FAULT  = 2'd3
    } sys_state_t;

    sys_state_t state;

    // 100ms tick 기준 5초 = 50번
    logic [5:0] stable_cnt;

    logic [31:0] abs_err;
    logic        err_within_1deg;
    logic        temp_fault;

    always_comb begin
        // float abs(error)
        abs_err = {1'b0, err[30:0]};

        // abs(err) <= 1.0
        err_within_1deg = (abs_err[30:0] <= FLOAT_1_0[30:0]);

        // current_t < 0 또는 current_t > 150.0이면 fault
        temp_fault = current_t[31] ||
                     ((!current_t[31]) && (current_t[30:0] > FLOAT_150_0[30:0]));
    end

    always_comb begin
        case (state)
            ST_IDLE:   state_word = 32'd0;
            ST_RUN:    state_word = 32'd1;
            ST_STABLE: state_word = 32'd2;
            ST_FAULT:  state_word = 32'd3;
            default:   state_word = 32'd0;
        endcase
    end

    always_comb begin
        run_enable = (state == ST_RUN) || (state == ST_STABLE);
    end

    always_ff @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            state      <= ST_IDLE;
            stable_cnt <= 6'd0;
        end else begin

            if (cmd_reset_pulse) begin
                state      <= ST_IDLE;
                stable_cnt <= 6'd0;
            end else begin
                case (state)

                    ST_IDLE: begin
                        stable_cnt <= 6'd0;

                        if (cmd_run_pulse) begin
                            state <= ST_RUN;
                        end
                    end

                    ST_RUN: begin
                        if (cmd_stop_pulse) begin
                            state      <= ST_IDLE;
                            stable_cnt <= 6'd0;
                        end else if (temp_fault) begin
                            state      <= ST_FAULT;
                            stable_cnt <= 6'd0;
                        end else if (tick_100ms) begin
                            if (err_within_1deg) begin
                                if (stable_cnt >= 6'd49) begin
                                    state <= ST_STABLE;
                                end else begin
                                    stable_cnt <= stable_cnt + 1'b1;
                                end
                            end else begin
                                stable_cnt <= 6'd0;
                            end
                        end
                    end

                    ST_STABLE: begin
                        if (cmd_stop_pulse) begin
                            state      <= ST_IDLE;
                            stable_cnt <= 6'd0;
                        end else if (temp_fault) begin
                            state      <= ST_FAULT;
                            stable_cnt <= 6'd0;
                        end else if (tick_100ms) begin
                            if (!err_within_1deg) begin
                                state      <= ST_RUN;
                                stable_cnt <= 6'd0;
                            end
                        end
                    end

                    ST_FAULT: begin
                        // reset 명령 전까지 유지
                        stable_cnt <= 6'd0;
                    end

                    default: begin
                        state      <= ST_IDLE;
                        stable_cnt <= 6'd0;
                    end

                endcase
            end
        end
    end

endmodule