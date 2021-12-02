`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2021 00:02:32
// Design Name: 
// Module Name: ALU
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

 
`define ALU_ADD  5'b00000
`define ALU_SUB  5'b01000
`define ALU_SLL  5'b00001
`define ALU_SLT  5'b00010
`define ALU_SLTU 5'b00011
`define ALU_XOR  5'b00100
`define ALU_SRL  5'b00101
`define ALU_SRA  5'b01101
`define ALU_OR   5'b00110
`define ALU_AND  5'b00111
`define ALU_BEQ  5'b11000
`define ALU_BNQ  5'b11001
`define ALU_BLT  5'b11100
`define ALU_BGE  5'b11101
`define ALU_BLTU 5'b11110
`define ALU_BGEU 5'b11111

module ALU(
input [5:0] operator_i,
input[31:0] operand_a_i,
input[31:0] operand_b_i,
output reg [31:0] result_o,
output reg comparison_result_o
    );

always @(*)
        case(operator_i)
            `ALU_ADD: begin
            result_o =  operand_a_i + operand_b_i;
            comparison_result_o = 0;
            end
            
            `ALU_SUB: begin
            result_o =  operand_a_i + ~operand_b_i  + 1;
            comparison_result_o = 0;
            end

            `ALU_SLL: begin
            result_o =  operand_a_i >> operand_b_i;
            comparison_result_o = 0;
            end
    
            `ALU_SLT: begin
            result_o = $signed( operand_a_i) <$signed(operand_b_i);
            comparison_result_o = 0;
            end

            `ALU_SLTU: begin
            result_o =  operand_a_i < operand_b_i;
            comparison_result_o = 0;
            end
            
            `ALU_XOR: begin
            result_o =  operand_a_i ^ operand_b_i;
            comparison_result_o = 0;
            end

            `ALU_SRL: begin
            result_o =  operand_a_i >> operand_b_i;
            comparison_result_o = 0;
            end
       
            `ALU_SRA: begin
            result_o = ( operand_a_i >>> operand_b_i);
            comparison_result_o = 0;
            end

            `ALU_OR: begin
            result_o  =  operand_a_i | operand_b_i;
            comparison_result_o = 0;
            end
       
            `ALU_AND: begin
            result_o =  operand_a_i & operand_b_i;
            comparison_result_o = 0;
            end

            `ALU_BEQ: begin
            result_o = ( operand_a_i == operand_b_i);
            comparison_result_o = result_o;
            end
       
            `ALU_BNQ: begin
            result_o = ( operand_a_i != operand_b_i);
            comparison_result_o = result_o;
            end

            `ALU_BLT: begin
            result_o = ( $signed( operand_a_i) < $signed(operand_b_i) );
            comparison_result_o = result_o;
            end
       
            `ALU_BGE: begin
            result_o = ( $signed( operand_a_i) >= $signed(operand_b_i) );
            comparison_result_o = result_o;
            end

            `ALU_BLTU: begin
            result_o = (  operand_a_i < operand_b_i );
            comparison_result_o = result_o;
            end
       
            `ALU_BGEU: begin
            result_o = (  operand_a_i >= operand_b_i );
            comparison_result_o = result_o;
            end
endcase
endmodule