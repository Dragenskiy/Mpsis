`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2021 00:04:17
// Design Name: 
// Module Name: rf
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


module rf(
input write_enable,
input [4:0]A1,
input  [4:0]A2,
input  [4:0]A3,
input clk,
input reset,
input [31:0]WD3 ,
output [31:0]RD1,
output [31:0]RD2
    );
    
    reg [31:0]  RAM [0:255];
    assign RD1 = (A1 == 5'b00000) ? 32'b0 : RAM[A1];
    assign RD2 = (A2 == 5'b00000) ? 32'b0 : RAM[A2];
    
    integer i;
    always @(posedge clk or posedge reset)  begin 
       if (reset ) begin
        for (i = 0; i < 32; i = i + 1) begin
    
    RAM[i]<= 32'b0;
    end
    end
    else begin 
    if (write_enable) begin 
        if (A3 == 0)
            RAM[A3] <= 0;
        else 
            RAM[A3] = WD3;
    end
    end
    end
endmodule
