`timescale 1ns / 1ps

module timer_gen (
    input  logic clk_100m,  // Arty A7 기본 100MHz 클럭
    input  logic rst_n,     // 리셋 (Active Low 하드웨어 버튼 논리에 맞춤)
    output logic tick_1ms,  // 1ms 마다 1클럭 동안만 High가 되는 펄스
    output logic tick_100ms // 100ms 마다 1클럭 동안만 High가 되는 펄스
);

    // 100MHz 클럭에서 1ms를 만들려면 100,000번 카운트 필요
    // 100,000은 17비트가 필요하므로 [16:0]
    logic [16:0] cnt_1ms;

    // 1ms 펄스가 100번 모이면 100ms
    // 100은 7비트가 필요하므로 [6:0]
    logic [6:0] cnt_100ms;

    always_ff @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            cnt_1ms    <= '0;
            cnt_100ms  <= '0;
            tick_1ms   <= 1'b0;
            tick_100ms <= 1'b0;
        end else begin
            // 기본적으로 tick은 0으로 유지 (조건이 맞을 때 딱 1클럭만 1이 됨)
            tick_1ms   <= 1'b0;
            tick_100ms <= 1'b0;

            // 1ms 카운터 로직
            if (cnt_1ms == 17'd99_999) begin
                cnt_1ms  <= '0;
                tick_1ms <= 1'b1; // 1ms 도달 시 펄스 빵 쏴줌

                // 1ms 펄스가 터질 때마다 100ms 카운터 증가
                if (cnt_100ms == 7'd99) begin
                    cnt_100ms  <= '0;
                    tick_100ms <= 1'b1; // 100ms 도달 시 펄스 빵 쏴줌
                end else begin
                    cnt_100ms <= cnt_100ms + 1'b1;
                end
            end else begin
                cnt_1ms <= cnt_1ms + 1'b1;
            end
        end
    end

endmodule