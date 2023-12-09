module Instruction_Memory_RISC_V #(
    parameter W = 32
) (
    A,RD
);

input  wire  [31:0]   A    ;
output wire  [31:0]   RD   ;

//The ROM Memory has width = 32 bits and depth = 256 entries.
reg [31:0] ROM [0:255];

    // Initialize Instruction Memory with Assemebly code converted to machine code  , this is for simulation purpose later on we can modify and make it syntheisable. 
initial    
    begin
$readmemh("Assembly_Prog.txt", ROM);

 end

assign RD = ROM[A[31:2]]; // ROM[A[1:0]] is connected to GND.



endmodule
    
