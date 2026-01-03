module mips_on_fpga(input  logic        fpgaClk, reset,
           input  logic [7:0]  SWITCH,
           output logic        memwrite,
           output logic [7:0] LED, SLED,
           output logic [3:0] AN);
  logic clk;
  logic [31:0] writedata, dataadr; 
  logic [31:0] pc, instr, readdata;

  // Memory Mapped I/O Signals
  logic        IsIO;      // 1: if Address is in I/O range 0x00007ff0 to 0x0007fff
  logic        IsIOWrite;     // 1: There is a valid IO Write
  logic        IsDMWrite; // 1: if MemWrite and not IsIO, write to data memory
  logic  [3:0] IOAddr;        // IO Address we use 4 bits

  logic [31:0] DMReadData;  // Data read from data Memory
  logic [31:0] IOReadData; // Data read from I/O devices

  logic        led_write_en;  // enble singnal for LED output register
  logic        seg_write_en;  // enble singnal for seven segment LED output register
  logic [31:0] DispReg;       // output register for seven segment LED display

  // divider clock from 100MHz fpgaClk
  counter #(
    .CNT_MAX(500_000) // 100MHz / 500_000 / 2 = 100Hz
  ) counter_inst (
      .clk(fpgaClk),
      .reset(reset),
      .clk_div(clk)
  );
  
  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, dataadr, 
            writedata, readdata);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, IsDMWrite, dataadr, writedata, DMReadData);

  // Memory Mapped I/O
  assign IsIO = (dataadr[31:4] == 28'h00007ff) ? 1'b1 : 1'b0; // 1: when address
                                                     // falls into I/O  address range
  assign IOAddr      =     ; //TODO: The LSB 4 bits of the Address is assigned to IOAddr

  assign IsIOWrite   =  memwrite &   ; // TODO: Is 1 when there is a SW instruction on IO address 
  assign IsDMWrite   =  memwrite &   ; // TODO: Is 1 when there is a SW instruction on DataMem address

  assign readdata   = IsIO ?   :   ;   // TODO: Mux selects DataMemory or I/O 
  assign IOReadData = (IOAddr == 4'h2) ?  {24'b0, SWITCH} : 32'h0; // read input device according to IOAddr
 
  // output device decoder
  output_decoder decoder_inst (
    .IOWrite(IsIOWrite),
    .IOAddr(IOAddr),
    .led_write_en(led_write_en),
    .seg_write_en(seg_write_en)
  );
  
  // LED output regisiter
  flopre #(8) led_reg(
    .clk(clk),
    .reset(reset),
    .en(led_write_en),
    .d(writedata[7:0]),
    .q(LED)
  );

  // sevent segment LED output regisiter
  flopre #(32) seg_reg(
    .clk(clk),
    .reset(reset),
    .en(seg_write_en),
    .d(writedata),
    .q(DispReg)
  );
    
  // seven segment LED driver
  sevendriver sevendriver_inst (
    .fpgaClk(fpgaClk),
    .reset(reset),
    .DispReg(DispReg),
    .SLED(SLED),
    .AN(AN)
  );

endmodule
