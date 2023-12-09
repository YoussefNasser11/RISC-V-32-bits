// RISC_V_32_bits Single_Core_Wrapper
// Author: Eng. Youssef Nasser
// Project: Simple D-FF
// Issued to: Egypt Make Electronics
module RISC_V_Single_Core_Wrapper 
  (
    CLK,RST,WriteData , DataAdr,MemWrite
);

input         CLK,RST;
output  [31:0] WriteData, DataAdr;
output         MemWrite;

wire [31:0] PC, Instr, ReadData;

Data_Path_And_Control_Pah DUT_A(CLK, RST, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);




Data_Memory_RISC_V DUT_B(CLK, MemWrite, DataAdr, WriteData, ReadData);


Instruction_Memory_RISC_V DUT_CPC(PC, Instr);

endmodule



