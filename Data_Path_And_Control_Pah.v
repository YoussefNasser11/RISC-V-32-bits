module Data_Path_And_Control_Pah  (
    CLK,RST,PC,Instr,MemWrite,ALUResult, WriteData,ReadData
);


input          CLK,RST;
output  [31:0] PC;
input   [31:0] Instr;
output         MemWrite;
output  [31:0] ALUResult, WriteData;
input   [31:0] ReadData;



wire     ALUSrc;   // lui 
wire    RegWrite, Jump, Zero;
wire [1:0] ResultSrc;
wire  [1:0] ImmSrc , PCSrc2 ;               // lui
wire  [1:0] ALUControl_op;


Control_Path_Wrapper  DUT1(Instr[6:0], Instr[14:12], Instr[30], Zero,ResultSrc, 
MemWrite, PCSrc2,ALUSrc,  RegWrite, Jump,ImmSrc, ALUControl_op);

Data_Path_Wrapper  DUT2(CLK,RST,ResultSrc,PCSrc2,ALUSrc,Jump,RegWrite,ImmSrc,
ALUControl_op,Zero,PC,Instr,ALUResult,WriteData,ReadData);





endmodule



