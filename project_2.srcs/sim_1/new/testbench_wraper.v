`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2021 00:06:33
// Design Name: 
// Module Name: testbench_wraper
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



module testbench_wraper();

reg clk = 0;
reg rst = 0;
reg [15:0] SW = 0;
wire [31:0] HEX;

wraper wraper_pro (.clk_i(clk),
                         .rst(rst),
                         .sw_i(SW),
                         .HEX(HEX));

always 
begin
    #5 clk = ~clk;
end

initial begin #5
    rst = 1; #202
    rst = 0;
    SW[15:0] = 16'b1001100000;
end

 
//-------------------------------------------------------

endmodule
