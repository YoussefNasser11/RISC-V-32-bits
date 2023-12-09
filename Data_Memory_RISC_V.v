module Data_Memory_RISC_V (
    CLK,WE,A,WD,RD
);

input                 CLK   ,  WE   ;
input  wire [31:0]   A     ,  WD   ;

output wire  [31:0]   RD           ;

reg [31:0] RAM [0:255];

always @(posedge CLK ) 
begin
    if (WE) 
    begin
        RAM[A[31:2]] <= WD; // word aligned
    end
end

assign RD = RAM[A[31:2]]; // word aligned

endmodule
    
