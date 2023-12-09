module Main_DECODER_ControlPath_RISC_V  (input wire [6:0] op,
                    output reg [1:0] ResultSrc,
                    output reg MemWrite,
                    output reg Branch, ALUSrc,
                    output reg RegWrite, Jump,
                    output reg [1:0] ImmSrc,
                    output reg [1:0] ALUControl_op);

always @(*)
                    begin
                    case(op)
                 // RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUControl_op_Jump
7'b0000011: begin RegWrite = 1'b1; ImmSrc = 2'b00; ALUSrc = 1'b1;  MemWrite = 1'b0; ResultSrc = 2'b01; Branch = 1'b0; ALUControl_op = 2'b00; Jump = 1'b0; end   // lw
7'b0100011: begin RegWrite = 1'b0; ImmSrc = 2'b01; ALUSrc = 1'b1;  MemWrite = 1'b1; ResultSrc = 2'b00; Branch = 1'b0; ALUControl_op = 2'b00; Jump = 1'b0; end   // sw
7'b0110011: begin RegWrite = 1'b1; ImmSrc = 2'bxx; ALUSrc = 1'b0;  MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b0; ALUControl_op = 2'b10; Jump = 1'b0; end   // R–type
7'b1100011: begin RegWrite = 1'b0; ImmSrc = 2'b10; ALUSrc = 1'b0;  MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b1; ALUControl_op = 2'b01; Jump = 1'b0; end   // B-type
7'b0010011: begin RegWrite = 1'b1; ImmSrc = 2'b00; ALUSrc = 1'b1;  MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b0; ALUControl_op = 2'b10; Jump = 1'b0; end   // I–type ALU
7'b1100111: begin RegWrite = 1'b1; ImmSrc = 2'b00; ALUSrc = 1'b1;  MemWrite = 1'b0; ResultSrc = 2'b00; Branch = 1'b0; ALUControl_op = 2'b00; Jump = 1'b1; end   // jalr
7'b1101111: begin RegWrite = 1'b1; ImmSrc = 2'b11; ALUSrc = 1'b0;  MemWrite = 1'b0; ResultSrc = 2'b10; Branch = 1'b0; ALUControl_op = 2'b00; Jump = 1'b1; end   // jal
default:    begin RegWrite = 1'bx; ImmSrc = 2'bxx; ALUSrc = 1'bx;  MemWrite = 1'bx; ResultSrc = 2'bxx; Branch = 1'bx; ALUControl_op = 2'bxx; Jump = 1'bx; end     // ??? 
                    
endcase    
                    end

endmodule



