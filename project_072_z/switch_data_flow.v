//-----------------------------------------------------------------------------
//
// Title       : switch_data_flow
// Design      : list1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\Z1\list1\src\switch_data_flow.v
// Generated   : Fri Nov 30 11:37:27 2018
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {switch_data_flow}}
module switch_data_flow (
	output wire [15:0] spi_out,
	output wire [15:0] uart_out,
	output wire fifo_full_uart,
	output wire fifo0_wr,
	output wire fifo0_rd,
	output wire fifo1_wr,
	output wire fifo1_rd,
	output wire fifo2_wr,
	output wire fifo2_rd,
	output wire fifo3_wr,
	output wire fifo3_rd,
	input wire clk,
	input wire [15:0] data0,
	input wire [15:0] data1,
	input wire [15:0] data2,
	input wire [15:0] data3,
	input wire fifo0_full,
	input wire fifo1_full,
	input wire fifo2_full,
	input wire fifo3_full,
	input wire [7:0] upr,
	input wire rst,	
	input wire fifo_wr_spi,
	input wire uart_fifo_wr_en,
	input wire uart_fifo_rd_en,
	input wire spi_clr_fifo
);

assign   spi_out      =(upr==8'h10)?data0:(upr==8'h11)?data1:(upr==8'h12)?data2:(upr==8'h13)?data3:16'h1000;
assign 	uart_out     =(upr==0)?data0:(upr==1)?data1:(upr==2)?data2:(upr==3)?data3:16'h1000;
assign  fifo_full_uart=(upr==0)?fifo0_full:(upr==1)?fifo1_full:(upr==2)?fifo2_full:(upr==3)?fifo3_full:0; 

assign  fifo0_wr=(upr==0)?uart_fifo_wr_en:(upr==8'h10)?fifo_wr_spi:0;
assign  fifo1_wr=(upr==1)?uart_fifo_wr_en:(upr==8'h11)?fifo_wr_spi:0;
assign  fifo2_wr=(upr==2)?uart_fifo_wr_en:(upr==8'h12)?fifo_wr_spi:0;
assign  fifo3_wr=(upr==3)?uart_fifo_wr_en:(upr==8'h13)?fifo_wr_spi:0;

assign  fifo0_rd=(upr==0)?uart_fifo_rd_en:(upr==8'h10)?spi_clr_fifo:0;
assign  fifo1_rd=(upr==1)?uart_fifo_rd_en:(upr==8'h11)?spi_clr_fifo:0;
assign  fifo2_rd=(upr==2)?uart_fifo_rd_en:(upr==8'h12)?spi_clr_fifo:0;
assign  fifo3_rd=(upr==3)?uart_fifo_rd_en:(upr==8'h13)?spi_clr_fifo:0;

endmodule
