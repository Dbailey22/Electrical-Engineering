`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 06:47:11 PM
// Design Name: 
// Module Name: wrapper
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


module wrapper(
    input clk,
    input [2:0]load,
    input rst,
    input [7:0] bin,
    output [7:0] cat,
    output [3:0] segan,
    output[2:0] compare
    );
    wire [1:0] Sel;
    wire connect;
    wire [3:0] muxConnect;
    wire [7:0] A,B;
    wire [15:0] S;
    wire [15:0] M;

    clkdiv(.clk(clk),.rst(rst),.terminalcount(199999),.clk_div(connect));
    counter(.clk(connect),.out(Sel));
    pipo one (.in(bin),.En(load[0]),.Rst(rst),.out(A));
    pipo two (.in(bin),.En(load[1]),.Rst(rst),.out(B));
    multi(.A(A),.B(B),.Multi(S));
    mux4_1(.I0(S[3:0]),.I1(S[7:4]),.I2(S[11:8]),.I3(S[15:12]),.Y(muxConnect),.sel(Sel));
    seg_decoder(.in(muxConnect),.rst(rst),.out(cat));
    encoder2_4(.in(Sel),.out(segan));
    PIPOsize #(.WIDTH(16))(.DataIn(S),.En(load[2]),.Rst(rst),.DataOut(M));
    compare(.A(S),.B(M),.LT(compare[0]),.EQ(compare[1]),.GT(compare[2]));
     
    
endmodule
