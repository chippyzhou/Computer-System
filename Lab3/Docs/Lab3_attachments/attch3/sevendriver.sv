// 7 segment LED driver
module sevendriver (input logic fpgaClk,
                    input logic reset,
                    input logic [31:0] DispReg,
                    output logic [7:0] SLED,
                    output logic [3:0] AN);
  logic [18:0]  DispCount;     // Simple counter to go through all options
                               // The counter is large to allow enough time
                               // for each LED to fully light up. 
                               // we could probably increase it a bit further

  always_ff @ (posedge fpgaClk, posedge reset)
     if (reset) DispCount <= 0;
     else       DispCount <= DispCount + 1;

  // Simple Way to determine the outputs, use a combinational process
  // Use the MSB of the Disp count so that each digit lights up for
  // 1.3ms  == 2^19bit * 10ns / 4 
  logic [7:0] DispDigit;
  always_comb  // combinational process
    begin
      case (DispCount[18:17])
        2'b00:   begin AN = 4'b1110; DispDigit = DispReg[7:0];   end   // LSB
        2'b01:   begin AN = 4'b1101; DispDigit = DispReg[15:8];  end   // 2nd digit
        // TODO: Add more digits


      endcase  
    end
   assign SLED = ~DispDigit;
endmodule