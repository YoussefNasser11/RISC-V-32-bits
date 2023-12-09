`timescale 1ns/10ps
module RISC_V_Single_Core_Wrapper_tb();
 reg clk;
 reg reset;
 wire [31:0] WriteData, DataAdr;
 wire MemWrite;
  
 // instantiate device to be tested
 RISC_V_Single_Core_Wrapper dut(clk, reset, WriteData, DataAdr, MemWrite);
  
 // initialize test
 initial begin
 reset <= 1; #1; reset <= 0;
 end
 // generate clock to sequence tests
 initial begin
   clk =1;
   forever #0.5 clk = ~clk;
  end
  

  

endmodule
