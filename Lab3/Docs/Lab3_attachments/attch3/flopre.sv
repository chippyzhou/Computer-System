// flipflop with enable and reset
module flopre #(parameter WIDTH = 8)
            (input  logic  clk, reset, en,
              input  logic [WIDTH-1:0] d, 
              output logic [WIDTH-1:0] q);

  always_ff @(posedge clk, posedge reset)
    // TODO: add reset and enable functionality


endmodule