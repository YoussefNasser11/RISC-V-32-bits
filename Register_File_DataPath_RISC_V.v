module Register_File_DP
 (
    CLK,WE3,A1,A2,A3,WD3,RD1,RD2
);

input  CLK,WE3;
input   wire [4:0]   A1,A2,A3;
input   wire [31:0] WD3;
output  wire [31:0] RD1,RD2;         


reg [31:0] Register_File [0:255];

// three ported register file
// read two ports combinationally (A1/RD1, A2/RD2)
// write third port on rising edge of clock (A3/WD3/WE3)
// register 0 hardwired to 0

always @(posedge CLK) 
begin
    if (WE3) 
    begin
        Register_File[A3] <= WD3;
    end
end

assign RD1 = (A1 != 0) ? Register_File[A1] : 0;
assign RD2 = (A2 != 0) ? Register_File[A2] : 0;


endmodule
    
