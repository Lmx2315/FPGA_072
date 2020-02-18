//////////////////////////////////////////////////////////////////////
////                                                              ////
////                                                              ////
////  This file is part of the SDRAM Controller project           ////
////  http://www.opencores.org/cores/sdr_ctrl/                    ////
////                                                              ////
////  Description                                                 ////
////  SDRAM CTRL definitions.                                     ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
//   Version  :0.1 - Test Bench automation is improvised with     ////
//             seperate data,address,burst length fifo.           ////
//             Now user can create different write and            ////
//             read sequence                                      ////
//                                                                ////
////  Author(s):                                                  ////
////      - Dinesh Annayya, dinesha@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

// This testbench verify with SDRAM TOP

module tb_sdram;

parameter P_SYS  = 10;     //    200MHz
parameter P_SDR  = 20;     //    100MHz

// General
reg            RESETN;
reg            sdram_clk;
reg            sys_clk;

initial sys_clk = 0;
initial sdram_clk = 0;

always #(P_SYS/2) sys_clk = !sys_clk;
always #(P_SDR/2) sdram_clk = !sdram_clk;

parameter      dw              = 32;  // data width
parameter      tw              = 8;   // tag id width
parameter      bl              = 5;   // burst_lenght_width 

//-------------------------------------------
// WISH BONE Interface
//-------------------------------------------
//--------------------------------------
// Wish Bone Interface
// -------------------------------------      
wire             wb_stb_i           ;
wire            wb_ack_o           ;
wire  [25:0]     wb_addr_i          ;
wire             wb_we_i            ; // 1 - Write, 0 - Read
wire  [dw-1:0]   wb_dat_i           ;
wire  [dw/8-1:0] wb_sel_i           ; // Byte enable
wire  [dw-1:0]  wb_dat_o           ;
wire             wb_cyc_i           ;
wire   [2:0]     wb_cti_i           ;



//--------------------------------------------
// SDRAM I/F 
//--------------------------------------------

wire [15:0]           Dq                 ; // SDRAM Read/Write Data Bus
wire [1:0]            sdr_dqm            ; // SDRAM DATA Mask

wire [1:0]            sdr_ba             ; // SDRAM Bank Select
wire [12:0]           sdr_addr           ; // SDRAM ADRESS
wire                  sdr_init_done      ; // SDRAM Init Done 	 


reg reg_wr=0;
reg reg_rd=0;
reg [31:0] d=0;
reg [25:0] addr=0;

initial begin //{
 
  RESETN    = 1'h1;

 #100
  // Applying reset
  RESETN    = 1'h0;
  #10000;
  // Releasing reset
  RESETN    = 1'h1;
  #1000;
  
  #1000;
  wait(u_dut.sdr_init_done == 1);

  #1000;
  
  #200000
  d=32'hdeedbeef;
  addr=0;
  reg_wr=1;
  #20
  reg_wr=0;
  
  #2000
  addr=1;
  reg_rd=1;
  #20
  reg_rd=0;	
  
   #2000
  addr=0;
  reg_rd=1;
  #20
  reg_rd=0;
 
end  
  
// to fix the sdram interface timing issue
wire #(2.0) sdram_clk_d   = sdram_clk;

   sdrc_top #(.SDR_DW(16),.SDR_BW(2)) u_dut(

      // System 
          .cfg_sdr_width      (2'b01              ), // 16 BIT SDRAM

          .cfg_colbits        (2'b00              ), // 8 Bit Column Address

/* WISH BONE */
          .wb_rst_i           (!RESETN            ),
          .wb_clk_i           (sys_clk            ),

          .wb_stb_i           (wb_stb_i           ),
          .wb_ack_o           (wb_ack_o           ),
          .wb_addr_i          (wb_addr_i          ),
          .wb_we_i            (wb_we_i            ),
          .wb_dat_i           (wb_dat_i           ),
          .wb_sel_i           (wb_sel_i           ),
          .wb_dat_o           (wb_dat_o           ),
          .wb_cyc_i           (wb_cyc_i           ),
          .wb_cti_i           (wb_cti_i           ), 

/* Interface to SDRAMs */
          .sdram_clk          (sdram_clk          ),
          .sdram_resetn       (RESETN             ),
          .sdr_cs_n           (sdr_cs_n           ),
          .sdr_cke            (sdr_cke            ),
          .sdr_ras_n          (sdr_ras_n          ),
          .sdr_cas_n          (sdr_cas_n          ),
          .sdr_we_n           (sdr_we_n           ),
          .sdr_dqm            (sdr_dqm            ),
          .sdr_ba             (sdr_ba             ),
          .sdr_addr           (sdr_addr           ), 
          .sdr_dq             (Dq                 ),

    /* Parameters */
          .sdr_init_done      (sdr_init_done      ),
          .cfg_req_depth      (2'h3               ),	        //how many req. buffer should hold
          .cfg_sdr_en         (1'b1               ),
          .cfg_sdr_mode_reg   (13'h033            ),
          .cfg_sdr_tras_d     (4'h4               ),
          .cfg_sdr_trp_d      (4'h2               ),
          .cfg_sdr_trcd_d     (4'h2               ),
          .cfg_sdr_cas        (3'h3               ),
          .cfg_sdr_trcar_d    (4'h7               ),
          .cfg_sdr_twr_d      (4'h1               ),
          .cfg_sdr_rfsh       (12'h100            ), // reduced from 12'hC35
          .cfg_sdr_rfmax      (3'h6               )

);

mt48lc8m16a2 
s1
(
.Dq(Dq), 
.Addr(sdr_addr[11:0]), 
.Ba(sdr_ba), 
.Clk(sdram_clk_d), 
.Cke(sdr_cke), 
.Cs_n(sdr_cs_n), 
.Ras_n(sdr_ras_n), 
.Cas_n(sdr_cas_n), 
.We_n(sdr_we_n), 
.Dqm(sdr_dqm)
);

sdram_wr_rd 
swrd1 ( 	
.rst(~RESETN),
.clk(sys_clk),
.wr(reg_wr),
.rd(reg_rd),
.data_wr(d),
.data_rd(), 
.addr(addr),
.en(),

.wb_stb_i(wb_stb_i),
.wb_ack_o(wb_ack_o),
.wb_addr_i(wb_addr_i),
.wb_we_i(wb_we_i) , // 1 - Write, 0 - Read
.wb_dat_i(wb_dat_i),
.wb_sel_i(wb_sel_i), // Byte enable
.wb_dat_o(wb_dat_o),
.wb_cyc_i(wb_cyc_i),
.wb_cti_i(wb_cti_i) 
);
/////////////////////////////////////////////////////////////////////////
// Test Case
/////////////////////////////////////////////////////////////////////////



endmodule
