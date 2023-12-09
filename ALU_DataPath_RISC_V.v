module ALU_DataPath_RISC_V  (
    SrcA,SrcB,ALUControl_OP,Zero,ALUResult
);

input  wire [31:0]   SrcA,SrcB     ;
input  wire [1:0]     ALUControl_OP ;
output reg  [31:0]   ALUResult     ;
output reg            Zero;

wire [31:0] condinvb, sum;
// Subtraction Operation to detect +ve and -ve
  assign condinvb = ALUControl_OP[0] ? ~SrcB : SrcB;   
  assign sum = SrcA + condinvb + ALUControl_OP[0];  

// ALU Implmenetation

always @(*) 
 begin

    case (ALUControl_OP)

        2'b00:  ALUResult = sum    ;   // Addition      
        2'b01:  ALUResult = sum    ;   // Subtracion   
        2'b10:  ALUResult = SrcA & SrcB    ;   // Anding       
        2'b11:  ALUResult = SrcA | SrcB    ;   // Oring          
  
        default: ALUResult = 32'bx      ;   // reset result  

    endcase
    // Calculate Zero and Sign flag 
    Zero = ALUResult ? 1'b0 : 1'b1;

    
end

endmodule


