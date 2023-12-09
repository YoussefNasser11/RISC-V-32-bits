module Rester_DataPath_RISC_V  (
    CLK,RESET,D,Q
);

input  CLK,RESET;

input      [31:0] D;
output reg [31:0] Q;

always @(posedge CLK or posedge RESET) 
begin
    if (RESET)    
    Q <= 32'b0;
    else
    Q <= D;    
end
    
endmodule