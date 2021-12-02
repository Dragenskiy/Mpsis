`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2021 23:55:53
// Design Name: 
// Module Name: wraper
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
//это процессор
module wraper(
    input clk_i,
    input rst,
    input [31:0] in,
	output [31:0] out	
);

reg [7:0]   PC = 0;
reg [31:0]  register_file_WD3; 

wire [31:0] instruction;
wire [31:0] rd1;
wire [31:0] rd2;
wire [31:0] alu_result;
wire        alu_flag;


assign out = rd1;
											
mem64_32 mem (.adr(PC),.clk(clk_i),.rd(instruction));

rf regfile (
                       .write_enable(instruction[29]|instruction[28]),
                       .A1(instruction[22:18]),
                       .A2(instruction[17:13]),
                       .A3(instruction[4:0]),
                       .clk(clk_i),
                       .reset(rst),
                       .WD3(register_file_WD3),
                       .RD1(rd1),
                       .RD2(rd2));
							  
ALU alu(.operator_i(instruction[27:23]),
                      .operand_a_i(rd1),
                      .operand_b_i(rd2),
                      .result_o(alu_result),
                      .comparison_result_o(alu_flag));

always @(*) begin
    case (instruction[29:28])
        2'd1: register_file_WD3 <= in[31:0];
        2'd2: register_file_WD3 <= {{9{instruction[27]}},instruction[27:5]};
        2'd3: register_file_WD3 <= alu_result;
       // default: register_file_WD3 <= 0;
    endcase
end      
                      
always @(posedge clk_i or posedge rst) begin
        if (rst)
            PC <= 0;
        else begin
            case ((alu_flag&instruction[30])|instruction[31])
                1'b0: PC <= PC + 1;
                1'b1: PC <= PC + {instruction[12:5]};
            endcase
	    end
	    
end
                    
endmodule