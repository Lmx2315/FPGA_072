 module nco_faza (clk,step,rst,y,x,faza, qwadrant,out_v,upr);
  input  clk;  
  input step; 
  input rst;
  input  [31:0] upr;
  output [1 :0] qwadrant;
  output [16:0] y;
  output [16:0] x;
  output [16:0] faza;
  output [15:0] out_v; 
  
  parameter Fclk = 96000000;
  
  reg [31:0] A = 0;  // accumulator	
  reg [31:0] step_reg=1000000;//1 MHz output,
  reg [16:0] y_reg=0;
  reg [16:0] x_reg=17'd19000; 
  reg [16:0] faza_reg=0;   
  reg [16:0] delta_reg=0; 
  reg [16:0] alfa_reg=0;	 
  reg [29:0] gamma_reg=0;
  reg sign_reg=0;
  reg [1:0] qwad_reg1=0;
  reg [1:0] qwad_reg2=0; 
  reg [1:0] qwad_reg3=0;  
  reg [1:0] qwad_reg4=0;
  reg [1:0] qwad_reg5=0;  
  reg [1:0] qwad_reg6=0;
  reg [1:0] qwad_reg7=0; 
  reg [1:0] qwad_reg8=0;	
  reg [1:0] qwad_reg9=0;  
  reg [1:0] qwad_regA=0;

  always @ (posedge clk)  
	  
  if (rst) A<=0;
  
  else
	  
begin
   step_reg<=upr;
/*	
if (upr==8'h30)  step_reg = 30000000;  else
if (upr==8'h31)  step_reg = 31000000; else
if (upr==8'h32)  step_reg = 32000000; else
if (upr==8'h33)  step_reg = 33000000; else
if (upr==8'h34)  step_reg = 34000000; else
if (upr==8'h35)  step_reg = 35000000; else
if (upr==8'h36)  step_reg = 36000000; else
if (upr==8'h37)  step_reg = 37000000; else
if (upr==8'h38)  step_reg = 38000000; else
if (upr==8'h39)  step_reg = 39000000; else
if (upr==8'h3a)  step_reg = 40000000; else  step_reg = 5000000;
*/ 
	
    A <= A + step_reg * 64'h100000000 / Fclk;  // 1 MHz output, 150 MHz clock 	 
	
	delta_reg <=  A[31:15];
	
	if ((delta_reg<32768)) 						      begin alfa_reg<= delta_reg;			qwad_reg1<=0;end
	if ((delta_reg>32767)&&(delta_reg<65535 )) 	begin alfa_reg<= 65534 - delta_reg; qwad_reg1<=1;end
	if ((delta_reg>65534)&&(delta_reg<98303 )) 	begin alfa_reg<= delta_reg -  65534;qwad_reg1<=2;end
	if ((delta_reg>98302)&&(delta_reg<131072)) 	begin alfa_reg<= 131071 - delta_reg;qwad_reg1<=3;end
		
	gamma_reg<=	(alfa_reg*18'd22872)>>15;  
	qwad_reg2 <=qwad_reg1;	
	qwad_reg3 <=qwad_reg2;	 
	qwad_reg4 <=qwad_reg3; 
	qwad_reg5 <=qwad_reg4; 
	qwad_reg6 <=qwad_reg5;
	qwad_reg7 <=qwad_reg6;
	qwad_reg8 <=qwad_reg7;		 
	qwad_reg9 <=qwad_reg8; 
	qwad_regA <=qwad_reg9;
	
end

assign out_v = alfa_reg;	
//assign faza= {1'h0,1'h0,delta_reg[16:2]};	  
assign faza={1'h0,1'h0,gamma_reg[14:0]};	  
//assign faza=0;
assign y = y_reg;
assign x = x_reg;	
assign qwadrant = qwad_reg9;

endmodule