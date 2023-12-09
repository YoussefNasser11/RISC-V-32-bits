module ADDER_DataPath_RISC_V  (
    X,Y,Z
);
input  [31:0] X,Y;
output [31:0] Z;

assign Z = X + Y;
    
endmodule