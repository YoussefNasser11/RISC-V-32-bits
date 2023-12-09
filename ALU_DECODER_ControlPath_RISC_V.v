

module ALU_DECODER_ControlPath_RISC_V 

(input wire [2:0] funct3,
                   input wire funct7b5,
                   input wire [1:0] ALUOp,
                   output reg [1:0] ALUControl_op);
  
  always @(*)
    case(ALUOp)
      2'b00: ALUControl_op = 2'b00; // addition for lw and sw
      2'b01: ALUControl_op = 2'b01; // subtraction to compare for beq
      default: case(funct3) // R–type or I–type ALU
        3'b000: if (funct7b5)
                   ALUControl_op = 2'b01;    // sub
                else ALUControl_op = 2'b00;  // add, addi
        3'b110: ALUControl_op = 2'b11;       // or, ori
        3'b111: ALUControl_op = 2'b10;       // and, andi
        default: ALUControl_op = 2'bxx;      // ???
      endcase
    endcase
endmodule


