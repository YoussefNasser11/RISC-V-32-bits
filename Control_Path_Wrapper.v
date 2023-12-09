module Control_Path_Wrapper  (
    op,funct3,funct7,Zero,ResultSrc,MemWrite,PCSrc2,ALUSrc ,RegWrite, Jump,ImmSrc,ALUControl_op
);



input   [6:0] op;
input   [2:0] funct3;
input         funct7;
input         Zero;
output wire [1:0] ResultSrc;
output wire       MemWrite;
output wire [1:0] PCSrc2;  
output wire       ALUSrc ;  
output wire       RegWrite, Jump;
output wire [1:0] ImmSrc;            
output wire [1:0] ALUControl_op; 
  

wire  [1:0] ALUOp;
wire  Branch;
wire Jalr;

 Main_DECODER_ControlPath_RISC_V Controller1_D( op,ResultSrc,MemWrite,Branch,
 ALUSrc,RegWrite,Jump,ImmSrc,ALUOp);
    


 ALU_DECODER_ControlPath_RISC_V  Controller2_D( funct3 , funct7 , ALUOp , ALUControl_op);
 


  assign PCSrc = ((Branch & funct3[0]) & !Zero ) |((Branch & !funct3[0]) & Zero) | Jump  ;
  assign Jalr  = (op == 7'b1100111) ? 1 : 0 ;
  assign PCSrc2 = {Jalr,PCSrc};

endmodule



