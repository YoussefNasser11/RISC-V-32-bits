module Data_Path_Wrapper  (
        CLK,RESET,ResultSrc,PCSrc2,ALUSrc,Jump,RegWrite,ImmSrc,ALUControl,
        Zero,PC,Instr,ALUResult,WriteData,ReadData

);

input CLK, RESET,RegWrite;
input [1:0] ResultSrc;
input [1:0] ImmSrc;
input [1:0]  ALUControl;
input ALUSrc,Jump;
input  [1:0] PCSrc2;
output Zero;
output [31:0] PC,Instr,ALUResult,WriteData,ReadData;

wire [31:0] PCNext, PCPlus4, PCTarget;
wire [31:0] ImmExt;
wire [31:0] SrcA, SrcB;
wire [31:0] Result;
wire [31:0] Write_Selector;

// next PC logic
Rester_DataPath_RISC_V  RESET_D(CLK,RESET,PCNext,PC);
ADDER_DataPath_RISC_V  ADDER1_D(PC,32'd4,PCPlus4);
ADDER_DataPath_RISC_V  ADDER2_D(PC,ImmExt,PCTarget);
MUX3X1_Enhahnced_DataPath_RISC_V  MUX1_D(PCPlus4, PCTarget, Result ,PCSrc2, PCNext);
MUX2X1_DataPath_RISC_V  MUX2_jump(Result, PCPlus4, Jump, Write_Selector);

// register file logic
Register_File_DP  RegFile_D(CLK, RegWrite, Instr[19:15], Instr[24:20],Instr[11:7], Write_Selector, SrcA, WriteData);


Extend_DataPath_RISC_V  Ext_D(Instr[31:7], ImmSrc, ImmExt);

// ALU logic

MUX2X1_DataPath_RISC_V  MUX2_DB(WriteData, ImmExt, ALUSrc, SrcB);
ALU_DataPath_RISC_V  ALU_D(SrcA,SrcB,ALUControl,Zero,ALUResult);
MUX3X1_Enhahnced_DataPath_RISC_V  Result_MUX_D( ALUResult, ReadData, PCPlus4,
ResultSrc, Result);


endmodule



