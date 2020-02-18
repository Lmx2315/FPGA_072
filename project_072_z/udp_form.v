//-----------------------------------------------------------------------------

//

// Title       : udp_form

// Design      : list

// Author      : Microsoft

// Company     : Microsoft

//

//-----------------------------------------------------------------------------

//

// File        : d:\My_Designs\project\list\src\udp_form.v

// Generated   : Wed Jan 30 09:08:28 2019

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

//{module {udp_form}}

module udp_form ( clk,en ,data_tx ,tx_mod ,tx_sop ,tx_eop ,tx_err ,tx_wren ,tx_crc_fwd ,tx_uflow ,tx_rdy ,tx_septy ,tx_a_full ,tx_a_empty );

 

output [31:0] data_tx ;

wire [31:0] data_tx ;

output [1:0] tx_mod ;

wire [1:0] tx_mod ;

output tx_sop ;

wire tx_sop ;

output tx_eop ;

wire tx_eop ;

output tx_err ;

wire tx_err ;

output tx_wren ;

wire tx_wren ;

output tx_crc_fwd ;

wire tx_crc_fwd ;

 

 

input en ;

wire en;

input clk ;

wire clk ;

input tx_uflow ;

wire tx_uflow ;

input tx_rdy ;

wire tx_rdy ;

input tx_septy ;

wire tx_septy ;

input tx_a_full ;

wire tx_a_full ;

input tx_a_empty ;

wire tx_a_empty ;

 

 

reg [31:0] data_reg=0;

reg [1:0] tx_mod_reg=0;

reg tx_sop_reg=0;

reg tx_eop_reg=0;

reg tx_err_reg=0;

reg tx_wren_reg=0;

reg tx_crc_fwd_reg=0;

 

reg [7:0] step=0;             

reg [31:0] temp_data=0;             

reg [31:0] sch=0;

reg [ 7:0] z=0;   

reg flag_start=0;  

reg enable=0;


 

assign data_tx   =temp_data;

assign tx_mod    =tx_mod_reg;

assign tx_sop    =tx_sop_reg;

assign tx_eop    =tx_eop_reg;

assign tx_err    =tx_err_reg;

assign tx_wren   =tx_wren_reg;

assign tx_crc_fwd=tx_crc_fwd_reg;


always @(posedge clk) 
if (sch!=50000000) 
	begin 
	sch<=sch+1; 
	flag_start<=0; 
	end 
	else 
			begin 
			flag_start<=1; 
			sch<=0; 
			end  
 

always @(posedge clk)
begin

if ((flag_start==1)&&(en)) enable<=1; else

if (tx_rdy&enable)

begin              
  //data_reg<=temp_data;
             

   if (step==0)

     begin
     tx_wren_reg<=1;
     tx_sop_reg<=1;//start of packet
           step<=1;
      temp_data<={8'h55,8'h55,8'h55,8'h55};
     end        else

   if (step==1)
        begin
        tx_sop_reg<=0;
         temp_data<={8'h55,8'h55,8'h55,8'hd5};
              step<=2;             
        end else

                if (step==2)

                               begin

                               temp_data<={8'h00,8'h10,8'ha4,8'h7b};

                               step<=3;             

                               end else              

                if (step==3)

                               begin

                               temp_data<={8'hea,8'h80,8'h00,8'h12};

                               step<=4;             

                               end else

                if (step==4)

                               begin

                               temp_data<={8'h34,8'h56,8'h78,8'h90};

                               step<=5;             

                               end else

                if (step==5)

                               begin

                               temp_data<={8'h08,8'h00,8'h45,8'h00};

                               step<=6;             

                               end else

                if (step==6)

                               begin

                               temp_data<={8'h00,8'h2e,8'hb3,8'hfe};

                               step<=7;             

                               end else

                if (step==7)

                               begin

                               temp_data<={8'h00,8'h00,8'h80,8'h11};

                               step<=8;             

                               end else 

                if (step==8)

                               begin

                               temp_data<={8'h05,8'h40,8'hc0,8'ha8};

                               step<=9;             

                               end else

                if (step==9)

                               begin

                               temp_data<={8'h00,8'h2c,8'hc0,8'ha8};

                               step<=10;          

                               end else

                if (step==10)

                               begin

                               temp_data<={8'h00,8'h04,8'h04,8'h00};

                               step<=11;          

                               end else

                if (step==11)

                               begin

                               temp_data<={8'h04,8'h00,8'h00,8'h1a};

                               step<=12;          

                               end else

                if (step==12)

                               begin

                               temp_data<={8'h2d,8'he8,8'h00,8'h01};

                               step<=13;          

                               end else

                if (step==13)

                               begin

                               temp_data<={8'h02,8'h03,8'h04,8'h05};

                               step<=14;          

                               end else

                if (step==14)

                               begin

                               temp_data<={8'h06,8'h07,8'h08,8'h09};

                               step<=15;          

                               end else                              

                if (step==15)

                               begin

                               temp_data<={8'h0a,8'h0b,8'h0c,8'h0d};

                               step<=16;          

                               end else

                if (step==16)

                               begin

                               temp_data<={8'h0e,8'h0f,8'h10,8'h11};

                               step<=17;          

                               end else

                if (step==17)

                               begin

                               temp_data<={8'hb3,8'h31,8'h88,8'h1b};

                               step<=18;

                               tx_eop_reg<=1;//end of packet

                               end else                              

                if (step==18)

                               begin

                               tx_eop_reg<=0;//end of packet

                               tx_wren_reg<=0;

                               step<=0;   
										 
										 enable<=0;

                               end                       

		end 

end

 

endmodule