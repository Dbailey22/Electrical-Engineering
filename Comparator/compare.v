`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 06:45:34 PM
// Design Name: 
// Module Name: compare
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module compare(
   input [15:0] A,
    input [15:0]B,
    output LT,
    output EQ,
    output GT
    );
    assign LT = (A<B);
    assign EQ = (A==B);
    assign GT = (A>B);
endmodule
