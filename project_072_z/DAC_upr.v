`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:38 08/02/2016 
// Design Name: 
// Module Name:    DAC_upr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DAC_upr(
    input clk,
    input [16:0] data_in,
    input en,
	 input PLLLOCK,
    output d0,
    output d1,
    output d2,
    output d3,
    output d4,
    output d5,
    output d6,
    output d7,
    output d8,
    output d9,
    output d10,
    output d11,
    output d12,
    output d13,
	 output [15:0] data_o,
    output DIV1,
    output DIV0,
    output SLEEP,
    output MOD0,
    output MOD1,
    output ReSeT,
    input [7:0] upr,
    input en_upr
    );


reg [13:0] data_reg=0;
reg [16:0] z=0;
reg SLEEP_reg=0;
reg DIV1_reg =0;
reg DIV0_reg =0;
reg MOD0_reg =0;
reg MOD1_reg =0;
reg RST_reg  =0;

reg [31:0] sch_tst=0;


always @(posedge clk)
begin

if (sch_tst<100000000) 	sch_tst<=sch_tst+1; else 	sch_tst<=0;

//if (sch_tst==0) data_reg<=14'h0000; else if (sch_tst==50000000)  data_reg<=14'b11111111111111;

end


always @(posedge clk)
begin

		z<=data_in+ $signed(16'd32767);

	  data_reg<=z>>2;
	//data_reg<=14'b11111111111111;
	
	SLEEP_reg<=0;
	DIV1_reg <=0;
	DIV0_reg <=0;
	MOD0_reg <=0;
	MOD1_reg <=0;
	RST_reg  <=0;

end

assign DIV1  = DIV1_reg;
assign DIV0  = DIV0_reg;
assign MOD0  = MOD0_reg;
assign MOD1  = MOD1_reg;
assign ReSeT = RST_reg;

assign d0  = data_reg[ 0];
assign d1  = data_reg[ 1];
assign d2  = data_reg[ 2];
assign d3  = data_reg[ 3];
assign d4  = data_reg[ 4];
assign d5  = data_reg[ 5];
assign d6  = data_reg[ 6];
assign d7  = data_reg[ 7];
assign d8  = data_reg[ 8];
assign d9  = data_reg[ 9];
assign d10 = data_reg[10];
assign d11 = data_reg[11];
assign d12 = data_reg[12];
assign d13 = data_reg[13];
assign data_o = {1'h0,1'h0,data_reg};


endmodule
