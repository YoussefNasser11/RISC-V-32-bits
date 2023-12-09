module MUX2X1_DataPath_RISC_V (
    X1,X2,S,Y
);

input  wire [31:0]   X1,X2;
input    S ;
output [31:0]   Y  ;

assign Y = S ? X2 : X1 ;



endmodule
    
