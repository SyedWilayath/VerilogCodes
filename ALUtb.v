`timescale 1ns / 1ps  

module tb;
//Inputs
 reg[7:0] A,B;
 reg[3:0] ALU_Sel;

//Outputs
 wire[7:0] ALU_Out;
 wire CarryOut;

 // Verilog code for ALU
 integer i;
ALU testbench (
            A,B,  // ALU 8-bit Inputs                 
            ALU_Sel,// ALU operation Selection
            ALU_Out, // ALU 8-bit Output
            CarryOut // Carry Out 
     );
    initial begin
    // hold reset state for 100 ns.
      A = 8'b11110000;
      B = 8'b00001111;
      ALU_Sel = 8'd0;
      #10;
      for (i=0;i<=15;i=i+1)
      begin
       ALU_Sel = ALU_Sel + 8'h01;
       #10;
      end
      
      A = 8'd0;
      B = 8'd0;
      
    end
endmodule