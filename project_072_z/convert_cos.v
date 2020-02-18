//-----------------------------------------------------------------------------
//
// Title       : convert_cos
// Design      : mur1
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : convert_cos.v
// Generated   : Wed Aug  3 11:51:18 2016
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
//{module {convert_cos}}
module convert_cos ( clk ,sin_a ,qwadrant ,sin ,cos ,cos_a );

output [16:0] sin ;
wire [16:0] sin ;
output  [16:0] cos ;
wire [16:0] cos ;

input clk ;
wire clk ;
input [16:0] sin_a ;
wire  [16:0] sin_a ;
input [1:0] qwadrant ;
wire  [1:0] qwadrant ;
input [16:0] cos_a ;
wire signed [16:0] cos_a ;	

 reg signed [17:0] sin_reg=0;
 reg signed [17:0] cos_reg=0;  
 
 reg signed [17:0] sin_reg2=0;
 reg signed [17:0] cos_reg2=0;
		  
always @(posedge clk)
	
begin

if (qwadrant==0)  begin sin_reg<=sin_a; 		cos_reg<=cos_a;end 
if (qwadrant==1)  begin sin_reg<=sin_a*(-1); 	cos_reg<=cos_a;end
if (qwadrant==2)  begin sin_reg<=sin_a*(-1); 	cos_reg<=cos_a*(-1);end
if (qwadrant==3)  begin sin_reg<=sin_a; 		cos_reg<=cos_a*(-1);end	
	
sin_reg2<=sin_reg>>>1;
cos_reg2<=cos_reg>>>1;
	
end

assign 	cos = cos_reg2;
assign  sin = sin_reg2;

endmodule
