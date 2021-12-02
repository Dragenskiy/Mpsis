`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2021 23:52:37
// Design Name: 
// Module Name: mem64_32
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



module mem64_32(
input [7:0] adr,
input clk,
output [31:0] rd
    );
    
    reg [31:0] RAM [0:255];
    initial $readmemb ("file.mem",RAM);
     assign  rd = RAM [adr];
     
    
endmodule

