`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2021 16:35:31
// Design Name: 
// Module Name: testbench
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

module testbench();

reg clk = 0;
reg rst = 0;
reg [31:0] SW = 0;
wire [31:0] out;

wraper wraper_pro (.clk_i(clk),
                         .rst(rst),
                         .in(SW),
                         .out(out));

always 
begin
    
    #5 clk = ~clk;
end

initial begin
    rst = 1; #4 
    rst = 0;
    SW[31:0] = 32'b0001100000;
end

 endmodule