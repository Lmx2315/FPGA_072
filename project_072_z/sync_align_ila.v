//-----------------------------------------------------------------------------
//
// Title       : sync_align
// Design      : arria5_tst1
// Author      : imk
// Company     : nasa
//
//-----------------------------------------------------------------------------
//
// File        : c:\Work_murmansk\Quartus\b072\project\simulation\activehdl\arria5_tst1\src\sync_align.v
// Generated   : Thu Jun 21 17:13:28 2018
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
//{module {sync_align}}
module sync_align_ila (
	 dout,
	 txdatak,
	 clk,
	 sstatus,
	 sysref,
	 data
);

parameter N=16;	   
parameter k=2; 
parameter K_m=16;


output wire [N-1:0] dout;
output wire [k-1:0] txdatak;
input wire clk;
input wire  sstatus;  
input wire  sysref;
input wire [N-1:0] data;

  

reg [N-1:0] data_reg=0;   
reg [N-1:0] data_last=0; 
reg [k-1:0] datak_reg=0;  

reg [7:0] step_faza=0;
reg [7:0] sch_lmfc=0; 
reg flag_lmfc=0;	 
reg flag_lmfc_pred=0;
reg [7:0] ILA_faza=0;
reg flag_SYNC_N=0;

reg [2:0] flag_frnt_SYNC_n=0; 
reg [2:0] front_sysref=0;

wire [N-1:0] wire_data_temp0;
wire [N-1:0] wire_data_temp1;
wire [N-1:0] wire_data_temp2;
wire [N-1:0] wire_data_temp3;
wire [N-1:0] wire_data_temp4;
wire [N-1:0] wire_data_temp5;
wire [N-1:0] wire_data_temp6;
wire [N-1:0] wire_data_temp7;
wire [N-1:0] wire_data_temp8;
wire [N-1:0] wire_data_temp9;


assign wire_data_temp0 = {ILA_faza,ILA_faza,ILA_faza,ILA_faza}; // data
assign wire_data_temp1 = {8'h7c,data[23:16],8'h7c,data[7:0]};
assign wire_data_temp2 = {8'h7c,data[23:0]};
assign wire_data_temp3 = {data[31:16],8'h7c,data[7:0]};
assign wire_data_temp4 = {8'hfc,data[23:16],8'hfc,data[7:0]};
assign wire_data_temp5 = {8'hfc,data[23:0]};
assign wire_data_temp6 = {data[31:16],8'hfc,data[7:0]};
assign wire_data_temp7 = {8'd188,8'd188,8'd188,8'd188}; //	K
assign wire_data_temp8 = {8'h00,8'h1c,8'h00,8'h1c};		//  R	
assign wire_data_temp9 = {8'h7c,8'h00,8'h7c,8'h00};     //  A

always @(posedge clk) front_sysref<={front_sysref[1:0],sysref};
always @(posedge clk) flag_frnt_SYNC_n<={flag_frnt_SYNC_n[1:0],sstatus};

always @(posedge clk)
	if (sstatus==0)
		begin
			step_faza<=0;
			ILA_faza <=100;	  //100
			
			data_reg<=wire_data_temp7;//	K
			datak_reg<=4'b1111;	
		
		end	else 
				begin 
				
				if ((step_faza==0)&&(sch_lmfc!=(K_m-1)))
					begin
						data_reg<=wire_data_temp7; //	K
						datak_reg<=4'b1111;	
					end else	
			//---------------------------------------------------	
			    if ((step_faza==0)&&(sch_lmfc==(K_m-1))&&(ILA_faza==100))
					begin
						step_faza<=5;
						data_reg <=wire_data_temp8; // R	
						data_last<=wire_data_temp8;
						datak_reg<=4'b0101;
					end else 
			//---------------------------------------------------		
			//....................ILA...........................		
				if ((step_faza==0)&&(sch_lmfc==(K_m-1))&&(ILA_faza==0))
					begin
						ILA_faza <=1;
						step_faza<=1;
						data_reg <=wire_data_temp8; // R	
						data_last<=wire_data_temp8;
						datak_reg<=4'b0101;
					end else
					
				 if ((step_faza==1)&&(ILA_faza<(K_m-1))&&(ILA_faza>0))
					 begin
						ILA_faza<=ILA_faza+1;
						data_reg<=wire_data_temp0; // data
						datak_reg<=4'b0000;						 
					 end else
				
				 if  ((step_faza==1)&&(ILA_faza==(K_m-1)))
					 begin
						ILA_faza <=0;
						step_faza<=2;
						data_reg <=wire_data_temp9;  // A
						datak_reg<=4'b1010;						 
					 end else
			//---------------------------	
				 if ((step_faza==2)&&(ILA_faza==0))
					begin
						ILA_faza <=1;
						data_reg <=wire_data_temp8; // R
						datak_reg<=4'b0101;
					end else
					
				 if ((step_faza==2)&&(ILA_faza<(K_m-1))&&(ILA_faza>0))		 //	Configuration DATA must tut bit
					 begin
						ILA_faza<=ILA_faza+1;
						data_reg<=wire_data_temp0; // data
						datak_reg<=4'b0000;						 
					 end else
				
				 if  ((step_faza==2)&&(ILA_faza==(K_m-1)))
					 begin
						ILA_faza<=0;
						step_faza<=3;
						data_reg<=wire_data_temp9;  // A
						datak_reg<=4'b1010;						 
					 end else
			//---------------------------		 
				 if ((step_faza==3)&&(ILA_faza==0))
					begin
						ILA_faza<=1;
						data_reg<=wire_data_temp8; // R
						datak_reg<=4'b0101;
					end else
					
				 if ((step_faza==3)&&(ILA_faza<(K_m-1))&&(ILA_faza>0))		 //	Configuration DATA must tut bit
					 begin
						ILA_faza<=ILA_faza+1;
						data_reg<=wire_data_temp0; // data
						datak_reg<=4'b0000;						 
					 end else
				
				 if  ((step_faza==3)&&(ILA_faza==(K_m-1)))
					 begin
						ILA_faza <=0;
						step_faza<=4;
						data_reg <=wire_data_temp9;  // A
						datak_reg<=4'b1010;						 
					 end else
				//---------------------------
				
				 if ((step_faza==4)&&(ILA_faza==0))
					begin
						ILA_faza <=1;
						data_reg <=wire_data_temp8; // R
						datak_reg<=4'b0101;
					end else
					
				 if ((step_faza==4)&&(ILA_faza<(K_m-1))&&(ILA_faza>0))		 //	Configuration DATA must tut bit
					 begin
						ILA_faza<=ILA_faza+1;
						data_reg<=wire_data_temp0; // data
						datak_reg<=4'b0000;						 
					 end else
				
				 if  ((step_faza==4)&&(ILA_faza==(K_m-1)))
					 begin
						ILA_faza <=0;
						step_faza<=5;
						data_reg <=wire_data_temp9;  // A
						datak_reg<=4'b1010;						 
					 end else 
			//----------------DATA transmit step----------------------------------------------
				 if  ((step_faza==5)&&(sch_lmfc==(K_m-2)))	 //   (K_m-1)
				 	 begin
						   data_last<=data;
						   if ((data_last[31:24]==data[31:24])&&(data_last[15:8]==data[15:8]))
							  begin 
								  data_reg<=wire_data_temp1;
								  datak_reg<=4'b1010;
							  end else
						   if (data_last[31:24]==data[31:24])
							  begin 
								  data_reg<=wire_data_temp2;
								  datak_reg<=4'b1000;
							  end else 
						     if (data_last[15:8]==data[15:8])
							  begin 
								  data_reg<=wire_data_temp3;
								  datak_reg<=4'b0010;
							  end else
						      begin
								data_reg<=data;
								datak_reg<=0; 
						      end						
					  end else
				   if  (step_faza==5)
					   begin
						   data_last<=data;
						   if ((data_last[31:24]==data[31:24])&&(data_last[15:8]==data[15:8]))
							  begin 
								  data_reg<=wire_data_temp4;
								  datak_reg<=4'b1010;
							  end else
						   if (data_last[31:24]==data[31:24])
							  begin 
								  data_reg<=wire_data_temp5;
								  datak_reg<=4'b1000;
							  end else 
						     if (data_last[15:8]==data[15:8])
							  begin 
								  data_reg<=wire_data_temp6;
								  datak_reg<=4'b0010;
							  end else
						      begin
								data_reg<=data;
								datak_reg<=0; 
						      end	
					   end else	
					 //-----------------TEST------------------------------------------------  
					   if  (step_faza==6)
					   begin
						data_reg<=data; // 
						datak_reg<=4'b0000;
					   end
					   
					
				end
					
		 
//  /R/=/K28.0/=0x1C
//   K character (0xBC)		
//-------------------------LMFC------------------------------------------		
always @(posedge clk)
	if (front_sysref==3'b011)  sch_lmfc<=0; else
	begin
		if (sch_lmfc!=(K_m-1)) sch_lmfc<=sch_lmfc+1; else   sch_lmfc<=0;		
	end
always @(posedge clk) if (sch_lmfc==0)	flag_lmfc<=1; else 	flag_lmfc<=0;	
	
//-----------------------------------------------------------------------
	
		assign 	dout=data_reg;
		assign 	txdatak=datak_reg;

endmodule

// 	K.28.0   1c
//  K.28.3   7c
//  K.28.4	 9c
//  K.28.5	 bc
//  K.28.7	 fc
