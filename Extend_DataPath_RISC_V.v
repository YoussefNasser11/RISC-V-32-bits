module Extend_DataPath_RISC_V 
 (
    Instr,Immsrc,Immext
);


input  wire [31:7] Instr;
input  wire [1:0]  Immsrc;
output reg  [31:0] Immext;

always@(*)
begin
    case(Immsrc)
// I−type
2'b00: Immext = {{20{Instr[31]}}, Instr[31:20]};
// S−type (stores)
2'b01: Immext = {{20{Instr[31]}}, Instr[31:25],Instr[11:7]};
// B−type (branches)
2'b10: Immext = {{20{Instr[31]}}, Instr[7],Instr[30:25], Instr[11:8], 1'b0};
// J−type (jal)
2'b11: Immext = {{12{Instr[31]}}, Instr[19:12],Instr[20], Instr[30:21], 1'b0};
default: Immext = 32'bx; // undefined
endcase
end

endmodule

    