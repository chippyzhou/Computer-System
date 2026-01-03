module counter #(
    parameter CNT_MAX = 50_000_000    // 100MHz时钟，计数0.5秒
)(
    input  logic clk,
    input  logic reset,
    output logic clk_div             // 输出1Hz的方波
);
    
    logic [31:0] count;

    always_ff @(posedge clk) begin
        if (reset) begin
            count <= '0;
            clk_div <= '0;
        end
        else if (count >= CNT_MAX - 1) begin
            count <= '0;
            clk_div <= ~clk_div;    // 翻转输出，产生方波
        end
        else begin
            count <= count + 1;
        end
    end

endmodule