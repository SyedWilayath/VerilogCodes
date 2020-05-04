module ALU(
           input [7:0] A,B,  //Inputs 8-bit                 
           input [3:0] ALU_Sel,// Selection of operation
           output [7:0] ALU_Out, // Output 8-bit
           output CarryOut // Carry output
    );
    reg [7:0] ALU_Result;
    wire [8:0] Overflow;
    assign ALU_Out = ALU_Result; // ALU output
    assign Overflow = {1'b0,A} + {1'b0,B}; //To find the overflow 
										   //(8th bit) after operation.
    assign CarryOut = Overflow[8]; // output  carry
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition of 8 bit numbers
           ALU_Result = A + B ; 
        4'b0001: // Subtraction of 8 bit numbers
           ALU_Result = A - B ;
        4'b0010: // Multiplication of 8 bit numbers
           ALU_Result = A * B;
        4'b0011: // Division of 8 bit numbers
           ALU_Result = A/B;
        4'b0100: // Logical shift left
           ALU_Result = A<<1;
         4'b0101: // Logical shift right
           ALU_Result = A>>1;
         4'b0110: // Rotate left
           ALU_Result = {A[6:0],A[7]};
         4'b0111: // Rotate right
           ALU_Result = {A[0],A[7:1]};
          4'b1000: //  Logical and 
           ALU_Result = A & B;
          4'b1001: //  Logical or
           ALU_Result = A | B;
          4'b1010: //  Logical xor 
           ALU_Result = A ^ B;
          4'b1011: //  Logical nor
           ALU_Result = ~(A | B);
          4'b1100: // Logical nand 
           ALU_Result = ~(A & B);
          4'b1101: // Logical xnor
           ALU_Result = ~(A ^ B);
          4'b1110: // Greater comparison
           ALU_Result = (A>B)?8'd1:8'd0 ;
          4'b1111: // Equal comparison   
            ALU_Result = (A==B)?8'd1:8'd0 ;
          endcase
     end
endmodule