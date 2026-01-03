module mips_on_fpga(input  logic        fpgaClk, reset, 
           output logic        memwrite);
  logic clk;
  logic [31:0] writedata, dataadr; 
  logic [31:0] pc, instr, readdata;

  // clk divider, 0.1Hz
  counter #(
    .CNT_MAX(5_000_000) 
  ) counter_inst (
      .clk(fpgaClk),
      .reset(reset),
      .clk_div(clk)
  );
  
  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, dataadr, 
            writedata, readdata);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, memwrite, dataadr, writedata, readdata);
endmodule