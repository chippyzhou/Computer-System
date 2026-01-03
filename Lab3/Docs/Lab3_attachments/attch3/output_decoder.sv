// decoder with enable for output devices
module output_decoder (
  input  logic       IOWrite,   // IO write enable
  input  logic [3:0] IOAddr,      // IO address
  output logic       led_write_en,// LED write enable
  output logic       seg_write_en // seven segment LED write enable
);

  logic [1:0] dev_sel;  // device select signal

  // address decoder
  always_comb begin
    case (IOAddr)
      4'h0: dev_sel = 2'b01;  // ioaddres of LED
      4'h1: dev_sel = 2'b10;  // ioaddress of seven segment LED
      default: dev_sel = 2'b00;  // invalid address
    endcase
  end
  
  // output device select
  assign led_write_en = IOWrite & dev_sel[0];
  assign seg_write_en = IOWrite & dev_sel[1];

endmodule
