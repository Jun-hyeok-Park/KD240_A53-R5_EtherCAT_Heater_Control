`timescale 1ns / 1ps

module heater_core (
    input  logic        clk_100m,
    input  logic        rst_n,

    // AXI register input
    input  logic [31:0] ctrl_reg,
    input  logic [31:0] target_temp,
    input  logic [31:0] kp,
    input  logic [31:0] ki,

    // A53 actual control mode input
    // control_mode[0] = 0 : PL internal PI/FSM control
    // control_mode[0] = 1 : A53 C PI/FSM control
    input  logic [31:0] control_mode,
    input  logic [31:0] ps_u_ctrl,
    input  logic [31:0] ps_error,
    input  logic [31:0] ps_state_word,

    // AXI read output
    output logic [31:0] current_t,
    output logic [31:0] error,
    output logic [31:0] u_ctrl,
    output logic [31:0] state_word,
    output logic [31:0] duty_cnt_dbg,
    output logic [31:0] noise_dbg,
    output logic [31:0] version
);

    // --------------------------------------------------
    // Constants
    // --------------------------------------------------
    localparam logic [31:0] VERSION_VALUE = 32'h20260518;
    localparam logic [31:0] FLOAT_0_0     = 32'h00000000;

    assign version = VERSION_VALUE;

    // --------------------------------------------------
    // Control command decode
    // ctrl_reg bit definition
    //   bit0 : RUN level
    //   bit1 : STOP pulse
    //   bit2 : RESET pulse
    //   bit8 : sensor noise enable
    // --------------------------------------------------
    logic run_level_d;
    logic cmd_run_pulse;
    logic cmd_stop_pulse;
    logic cmd_reset_pulse;

    always_ff @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            run_level_d <= 1'b0;
        end else begin
            run_level_d <= ctrl_reg[0];
        end
    end

    assign cmd_run_pulse   =  ctrl_reg[0] & ~run_level_d;
    assign cmd_stop_pulse  =  ctrl_reg[1];
    assign cmd_reset_pulse =  ctrl_reg[2];

    // --------------------------------------------------
    // Timer
    // --------------------------------------------------
    logic tick_1ms;
    logic tick_100ms;

    timer_gen u_timer_gen (
        .clk_100m    (clk_100m),
        .rst_n       (rst_n),
        .tick_1ms    (tick_1ms),
        .tick_100ms  (tick_100ms)
    );

    // --------------------------------------------------
    // Internal signals
    // --------------------------------------------------
    logic        use_ps_control;

    logic        pl_run_enable;

    logic [31:0] plant_current_t;
    logic [31:0] sensed_temp;
    logic [31:0] sensed_temp_noisy;

    logic [31:0] pl_error;
    logic [31:0] pl_u_ctrl;
    logic [31:0] pl_state_word;

    logic [31:0] selected_u_ctrl;
    logic [31:0] effective_u_ctrl;
    logic        selected_output_enable;

    logic        pi_done;
    logic        pi_busy;

    logic        pwm_out_unused;

    // --------------------------------------------------
    // Control mode mux
    // --------------------------------------------------
    assign use_ps_control = control_mode[0];

    /*
     * CONTROL_MODE
     *   0 : Existing PL PI/FSM control
     *   1 : A53 C PI/FSM control
     */
    assign selected_u_ctrl =
        (use_ps_control) ? ps_u_ctrl : pl_u_ctrl;

    /*
     * Output enable source
     *   A53 mode : ctrl_reg[0] RUN level
     *   PL mode  : PL FSM run_enable
     */
    assign selected_output_enable =
        (use_ps_control) ? ctrl_reg[0] : pl_run_enable;

    /*
     * Actual heater input.
     * STOP/IDLE must force the heater input to 0.0, but the virtual plant
     * must continue updating so the temperature can naturally cool down.
     */
    assign effective_u_ctrl =
        (selected_output_enable) ? selected_u_ctrl : FLOAT_0_0;

    /*
     * AXI readback values.
     * u_ctrl is the actual output applied to the plant/PWM, not merely the
     * controller's internal selected output. Therefore STOP/IDLE reads 0.0.
     */
    assign u_ctrl = effective_u_ctrl;

    assign error =
        (use_ps_control) ? ps_error : pl_error;

    assign state_word =
        (use_ps_control) ? ps_state_word : pl_state_word;

    // --------------------------------------------------
    // System FSM for PL internal control mode
    // --------------------------------------------------
    system_fsm u_system_fsm (
        .clk_100m         (clk_100m),
        .rst_n            (rst_n),
        .tick_100ms       (tick_100ms),

        .cmd_run_pulse    (cmd_run_pulse),
        .cmd_stop_pulse   (cmd_stop_pulse),
        .cmd_reset_pulse  (cmd_reset_pulse),

        .current_t        (plant_current_t),
        .err              (pl_error),

        .run_enable       (pl_run_enable),
        .state_word       (pl_state_word)
    );

    // --------------------------------------------------
    // PI Controller for PL internal control mode
    // --------------------------------------------------
    pi_controller u_pi_controller (
        .clk_100m    (clk_100m),
        .rst_n       (rst_n),
        .soft_reset  (cmd_reset_pulse),

        .tick_100ms  (tick_100ms),
        .run_enable  (pl_run_enable),

        .target_t    (target_temp),
        .current_t   (sensed_temp_noisy),
        .kp          (kp),
        .ki          (ki),

        .u_out       (pl_u_ctrl),
        .err_out     (pl_error),
        .ctrl_done   (pi_done),
        .busy        (pi_busy)
    );

    // --------------------------------------------------
    // Virtual Plant
    // --------------------------------------------------
    virtual_plant u_virtual_plant (
        .clk_100m    (clk_100m),
        .rst_n       (rst_n),
        .soft_reset  (cmd_reset_pulse),

        .tick_100ms  (tick_100ms),

        /*
         * The plant model must always update.
         * If STOP/IDLE, effective_u_ctrl becomes 0.0 and the temperature
         * naturally decays toward ambient instead of freezing.
         */
        .run_enable  (1'b1),

        .u_in        (effective_u_ctrl),
        .current_t   (plant_current_t)
    );

    // --------------------------------------------------
    // Sensor Delay
    // --------------------------------------------------
    sensor_delay_float #(
        .DELAY_SAMPLES (5)
    ) u_sensor_delay (
        .clk_100m    (clk_100m),
        .rst_n       (rst_n),
        .soft_reset  (cmd_reset_pulse),

        .tick_100ms  (tick_100ms),

        .temp_in     (plant_current_t),
        .temp_out    (sensed_temp)
    );

    // --------------------------------------------------
    // Sensor Noise
    // --------------------------------------------------
    sensor_noise_float u_sensor_noise (
        .clk_100m      (clk_100m),
        .rst_n         (rst_n),
        .soft_reset    (cmd_reset_pulse),

        .tick_100ms    (tick_100ms),

        .noise_enable  (ctrl_reg[8]),

        .temp_in       (sensed_temp),
        .temp_out      (sensed_temp_noisy),

        .noise_dbg     (noise_dbg)
    );

    // --------------------------------------------------
    // PWM Generator
    // --------------------------------------------------
    pwm_gen_float u_pwm_gen (
        .clk_100m      (clk_100m),
        .rst_n         (rst_n),

        /*
         * PWM must reflect the actual output applied to the heater.
         * Therefore STOP/IDLE reads duty = 0.
         */
        .u_in_float    (effective_u_ctrl),

        .pwm_out       (pwm_out_unused),
        .duty_cnt_dbg  (duty_cnt_dbg)
    );

    // --------------------------------------------------
    // AXI read current temperature
    // --------------------------------------------------
    assign current_t = sensed_temp_noisy;

endmodule
