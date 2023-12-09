module MUX3X1_Enhahnced_DataPath_RISC_V  (
    X1,X2,X3,S,Y
);

input  wire [31:0]   X1,X2,X3;
input   [1:0] S ;
output [31:0]   Y  ;

assign Y = S[1] ? X3 : (S[0]? X2 : X1) ;



endmodule
    
