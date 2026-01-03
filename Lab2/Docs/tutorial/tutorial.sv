`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tutorial
//////////////////////////////////////////////////////////////////////////////////
module tutorial(
     input  logic [7:0] swt,
     output logic [7:0] led
    );
    assign led[0] = // TODO
    assign led[1] = // TODO
    assign led[3] = // TODO
    assign led[2] = led[1] | led[3];
    assign led[7:4] = // TODO
endmodule
