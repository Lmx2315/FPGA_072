
//synthesis_resources = arriav_io_ibuf 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on


module top_module(

		input wire clk_100MHZ,
		
//		input wire si570_clk,
		
		input wire REF3,
		
		input wire SYSREF0,
		
		input wire SYSREF5,

		input wire SYSREF6,	
	
	   input wire FPGA_SYNC1,
			
//		input wire FPGA_SYNC2,
	
//		input wire FPGA_SYNC3,
			
//--------------------------------

output wire UPR_AT4_05,
output wire UPR_AT4_1,
output wire UPR_AT4_2,
output wire UPR_AT4_4,
output wire UPR_AT4_8,
output wire UPR_AT4_16,
	  
output wire UPR_AT1_05,
output wire UPR_AT1_1,
output wire UPR_AT1_2,
output wire UPR_AT1_4,
output wire UPR_AT1_8,
output wire UPR_AT1_16,
	  
output wire UPR_AT2_05,
output wire UPR_AT2_1,
output wire UPR_AT2_2,
output wire UPR_AT2_4,
output wire UPR_AT2_8,
output wire UPR_AT2_16,
	  
output wire UPR_AT3_05,
output wire UPR_AT3_1,
output wire UPR_AT3_2,
output wire UPR_AT3_4,
output wire UPR_AT3_8,
output wire UPR_AT3_16,
	  
output wire UPR_SWITCH1,
output wire UPR_SWITCH2,
output wire UPR_SWITCH3,
output wire UPR_SWITCH4,
	  
input wire KAN1_KONTROL,
input wire KAN2_KONTROL,
input wire KAN3_KONTROL,
input wire KAN4_KONTROL,
	  
input wire IZL1_KONTROL,
input wire IZL2_KONTROL,
input wire IZL3_KONTROL,
input wire IZL4_KONTROL,
	  
output wire LMK_STATUS_LD1_FPGA_3V3,
output wire LMK_STATUS_LD2_FPGA_3V3,
	  
input wire LMK_STATUS_LD1_3V3,
input wire LMK_STATUS_LD2_3V3,
	  
output wire D1_ALARM_FPGA,
output wire D2_ALARM_FPGA,
	  
output wire EN_2V5_VDA,
output wire REZERV1,
output wire FPGA_IND1,
output wire FPGA_IND2,
	  
input wire SYS_REF,
	  
input wire ADDR0,
input wire ADDR1,
input wire ADDR2,
input wire ADDR3,
 
input wire CS_ADC1,
input wire CS_ADC2,
input wire CS_DAC1,
input wire CS_DAC2,
input wire CS_LMK,
input wire CS_FPGA1,
input wire CS_FPGA2,
	  
//------------------------------------------------------
	
input wire UART6_TX, //uart6 mk
output wire UART6_RX,
	 
input wire UART1_TX, //uart1 mk
output wire UART1_RX,
	 
input wire TX_FTDI_1, //FTDI1 mk
output wire RX_FTDI_1,
	 
input wire TX_FTDI_2, //FTDI2 mk
output wire RX_FTDI_2,
	 
output wire BOOT1,
output wire BOOT0,
	 
input wire BOOT_MK_FTDI,
input wire RESET_MK_FTDI,
	 
	 
input wire MR_RESET_MK_FPGA, 	// сигнал ресет для МК
output wire RESET_MK,
input wire BOOT_MK_FPGA, 		// сигнал , буут для МК
output wire CLK_FOR_MK_3V3,     // clk на МК 
	  
output wire TNC_MK_1HZ, //1 сек к mk
output wire INT1_FPGA,
	  	  
input   wire WDATA_MK0, //шина 8 бит с МК
output  wire WDATA_MK1, //шина 8 бит с МК
output  wire WDATA_MK2, //шина 8 бит с МК
output  wire WDATA_MK3, //шина 8 бит с МК
output  wire WDATA_MK4, //шина 8 бит с МК
output  wire WDATA_MK5, //шина 8 бит с МК
output  wire WDATA_MK6, //шина 8 бит с МК
output  wire WDATA_MK7, //шина 8 бит с МК

output wire OK_BUS,
input  wire WR_BUS,
input  wire RD_BUS,
	  
//--------------------------
input  wire SPI4_SCK_MK,  //SPI , слейв ПЛИС  (скоростной интерфейс для команд реального времени
input  wire SPI4_NSS_MK,  //передача идёт пачкой по 51 байт
input  wire SPI4_MOSI_MK,
output wire SPI4_MISO_MK,
	  
	  
 input wire SPI3_SCK,  //SPI где слейв ПЛИС
 input wire SPI3_CS,
output wire SPI3_MISO,
 input wire SPI3_MOSI,
	  
output wire SPI2_NSS_MK, 
	  
//-----------GTX---------------

	
    input wire RX_GTP,
   output wire TX_GTP,

    input wire RX2_GTP,
   output wire TX2_GTP,

//	  input wire FPGA_F48MHZ,
//	  input wire DCLK6,
//	  input wire DCLK5,
//	  input wire DCLK0,
//-----------------------  

	 output wire D2_RX0,
	 output wire D2_RX1,

	 output wire D1_RX0,
	 output wire D1_RX1, 
	 
//-----------------------	 

	  input wire A2_TX0,
	  input wire A2_TX1,
      input wire A2_TX3,	  
	  input wire A2_TX2,
	  
	  input wire A1_TX3, // - рабочий
	  input wire A1_TX2,
	  input wire A1_TX1,
	  input wire A1_TX0,
	  
//-----------DAC---------------
	  
output wire DAC_SYNC, //Сигнал идёт наружу кассеты к АЦ
	  
 input wire D2_SYNCB,
 input wire D1_SYNCB,
  
output wire D1_RESETB,
output wire D1_SCLK,
output wire D1_SDIO,
 input wire D1_SDO,
output wire D1_SDENB,
output wire D1_SLEEP,
input  wire D1_SYNC_N_AB,
input  wire D1_SYNC_N_CD,
output wire D1_TXENABLE,	 
 input wire D1_ALARM,
	 
output wire D2_RESETB,
output wire D2_SCLK,
output wire D2_SDIO,
 input wire D2_SDO,
output wire D2_SDENB,
output wire D2_SLEEP,
 input wire D2_SYNC_N_AB,
 input wire D2_SYNC_N_CD,
output wire D2_TXENABLE,
 input wire D2_ALARM,
	  
//-----------ADC---------------

	input wire A1_OVRA_1V8,
	input wire A1_OVRB_1V8,
   output wire A1_CTRL2_1V8,
   output wire A1_CTRL1_1V8,
   output wire A1_PWRDOWN_1V8, 
   output wire A1_RESET_1V8,
   output wire A1_SCLK_1V8,
   output wire A1_SDATA_1V8,
    input wire A1_SDOUT_1V8,
   output wire A1_SEN_1V8,
   output wire A1_STBY_1V8,
		  
    input wire A2_OVRA_1V8,
    input wire A2_OVRB_1V8,
   output wire A2_CTRL2_1V8,
   output wire A2_CTRL1_1V8,
   output wire A2_PWRDOWN_1V8, 
   output wire A2_RESET_1V8,
   output wire A2_SCLK_1V8,
   output wire A2_SDATA_1V8,
    input wire A2_SDOUT_1V8,
   output wire A2_SEN_1V8,
   output wire A2_STBY_1V8,
  
   output wire A1_SNC,
   output wire A2_SNC,  
	  
//-----------LMK---------------
	  output wire LMK_SEL0_3V3,
	  output wire LMK_SEL1_3V3,
	   input wire LMK_RESET_3V3,//SPI readback from LMK
	  output wire LMK_SCK_3V3,
	  output wire LMK_SDIO_3V3,
	  output wire LMK_CS_3V3,
	  output wire LMK_SYNC_3V3,

//--------------------------
	  output wire RNE1_RS422,
	  output wire DE1RX_RS422,
	  output wire RX1_RS422,
	  input  wire TX1_RS422,
	  
//--------------------------
	  
	  output wire FLASH_CLK_3V3,     //ноги управления резервной flash
	  output wire FLASH_MOSI_3V3,
	  output wire FLASH_CS_3V3,
	  input  wire FLASH_MISO_3V3,
	  input  wire CS_FLASH_FPGA, 		// сигнал чипсилекта с МК на флеш через ПЛИС
	  
	  output wire DE_MISO_LVDS_3V3,  //ноги управления буфером SPI
	  output wire SYNC_DA2,  			//sync для источника питания 
	 
	  input  wire CE_MO,
	  input  wire CLK_MO,
	  input  wire D_MOSI,
	  output wire D_MISO,
	  
	  output wire SEL_ETALON_3V3,
//------------SFP----------------	  
	  inout  wire SDATA1_I2C,
	  output wire SCLK1_I2C,
	  input  wire SFP1_TX_FAULT,
	  input  wire SFP1_PRESENT,
	  input  wire SFP1_LOS,
	  output wire RATE1_SELECTION,
	  output wire SFP1_TX_DISABLE,

	  inout  wire SDATA2_I2C,
	  output wire SCLK2_I2C,
	  input  wire SFP2_TX_FAULT,
	  input  wire SFP2_PRESENT,
	  input  wire SFP2_LOS,
	  output wire RATE2_SELECTION,
	  output wire SFP2_TX_DISABLE,

//-------------------------------
//sdram
	 output wire A1,
	 output wire A2,
	 output wire A3,
	 output wire A4,
	 output wire A5,
	 output wire A6,
	 output wire A7,
	 output wire A8,
	 output wire A9,
	 output wire A10,
	 output wire A12,
	 output wire A13,
	 
	 output wire SA10,
	 output wire A18,
	 output wire A19,
	 output wire ABE0,
	 output wire SWE,
	 output wire SCAS,
	 output wire SRAS,
	 output wire SMS,
	 output wire ABE1,
	 output wire CLK_OUT,
	 output wire SCKE,
	 
	 inout wire D0,
	 inout wire D1,
	 inout wire D2,
	 inout wire D3,
	 inout wire D4,
	 inout wire D5,
	 inout wire D6,
	 inout wire D7,
	 inout wire D8,
	 inout wire D9,
	 inout wire D10,
	 inout wire D11,
	 inout wire D12,
	 inout wire D13,
	 inout wire D14,
	 inout wire D15,	 
	 
//-------------------------------	  
     output wire FPGA_LED1_3V3,
     output wire T_TEST1,
	 output wire T_TEST2
     );
	  
	  wire xA1_PWRDOWN_upr_MK;
	  
	  wire xA2_PWRDOWN_upr_MK;	
	  
	  wire RX_GTP_o;
		 
	  wire reset_all;
	  
  	  wire signal_wire0 ;
	  wire signal_wire1 ;
	
	  wire [15:0] rx_parallel_data_out ;
	  wire [1:0]  rx_ctrldetect;
	  
	  wire xCE_MO;
	  wire xCLK_MO;
	  wire xD_MOSI;
	  wire xD_MISO;
	  wire xFPGA_SYNC1;
	  wire clk_hclk;
	  wire fboutclk;
	  wire [69:0] zreconfig_to_xcvr;
	  wire zreconfig_from_xcvr;
      wire clk_100MHZ_glob;
      wire clk_100MHz_eth;
	  wire clk_50MHz;
	  wire clk_50MHz_n;

	  wire clk360_locked;
	  wire reset_240;
	  wire locked_120_1;
	  wire locked_120_2;
	  wire locked_dac1;
	  wire locked_dac2;
	  wire clk_125_90;
	  wire clk_240_adc1;
	  wire clk_240_adc2;
	  wire clk_120_adc1;
	  wire clk_120_adc2;
	  wire clk_48_1;
	  wire clk_48_2;

pll_0002 
pll_1(
		.refclk   (REF3),   //  refclk.clk
		.rst      (reset_all),      //   reset.reset
		.outclk_0 (clk_125), // outclk0.clk
		.outclk_1 (clk_125_n), // outclk1.clk
		.outclk_2 (clk_125_90), // outclk2.clk
		.locked   (locked_125)    //  locked.export
	);


pll_240_120_0002 
pll240_120_ADC1 
(
		.refclk   (clk_125),   //  refclk.clk
		.rst      (reset_125),      //   reset.reset
		.outclk_0 (clk_240_adc1), // outclk0.clk
		.outclk_1 (clk_120_adc1), // outclk1.clk
		.locked   (locked_120_1)    //  locked.export
);

pll_240_120_0002 
pll240_120_ADC2 
(
		.refclk   (clk_125),   //  refclk.clk
		.rst      (reset_125),      //   reset.reset
		.outclk_0 (clk_240_adc2), // outclk0.clk
		.outclk_1 (clk_120_adc2), // outclk1.clk
		.locked   (locked_120_2)    //  locked.export
);

pll_96_48 
pll_96_dac1 
(
		.refclk   (clk_125),   		//  refclk.clk
		.rst      (reset_125),      //   reset.reset
		.outclk_0 (clk_96_dac1), 	// outclk0.clk
		.outclk_1 (clk_48_1), 		// outclk0.clk		
		.locked   (locked_dac1)    	//  locked.export
);

pll_96_48 
pll_96_dac2 
(
		.refclk   (clk_125),   		//  refclk.clk
		.rst      (reset_125),      //   reset.reset
		.outclk_0 (clk_96_dac2), 	// outclk0.clk
	   .outclk_1 (clk_48_2), 		// outclk0.clk
		.locked   (locked_dac2)    	//  locked.export
);

pll_125_0002
pll_125_eth0
(
		.refclk   (clk_125),   //  refclk.clk
		.rst      (reset_125),      //   reset.reset
		.outclk_0 (clk_125_eth0), // outclk0.clk
		.locked   (locked_eth0)    //  locked.export
);

pll_125_0002
pll_125_eth1
(
		.refclk   (clk_125),   //  refclk.clk
		.rst      (reset_125),      //   reset.reset
		.outclk_0 (clk_125_eth1), // outclk0.clk
		.locked   (locked_eth1)    //  locked.export
);

wire clk_125;
wire clk_125_n;
wire locked_125;
wire reset_125;
wire clk_125_eth0;
wire clk_125_eth1;

/*
pll100_0002 
pll100_inst (
		.refclk   (clk_100MHZ),   //  refclk.clk
		.rst      (0),      //   reset.reset
		.outclk_0 (clk_100MHZ_glob), // outclk0.clk
		.locked   (clk100_locked)    //  locked.export
	);
*/	

wire reset_100eth;

rst rst3(clk_125,reset_all);
rst rst6(clk_240_adc1,reset_240);
rst rst7(clk_125,reset_125);
rst rst8(clk_100MHz_eth,reset_100eth);
	
bufi3	bufi3_inst1 (
	.datain  ( { CE_MO, CLK_MO, D_MOSI} ),
	.dataout ( {xCE_MO,xCLK_MO,xD_MOSI} )
	);
	  
buf_out1	buf_out1_inst3 (
	.datain ( xD_MISO ),
	.dataout ( D_MISO )
	);

test_led tst_led2(clk_125 ,xT_TEST3);

wire   xKAN1_KONTROL;
wire   xKAN2_KONTROL;
wire   xKAN3_KONTROL;
wire   xKAN4_KONTROL;
	  
wire   xIZL1_KONTROL;
wire   xIZL2_KONTROL;
wire   xIZL3_KONTROL;
wire   xIZL4_KONTROL;
		  
wire   xLMK_STATUS_LD1_3V3;
wire   xLMK_STATUS_LD2_3V3;
	  
wire   xD1_ALARM_FPGA;
wire   xD2_ALARM_FPGA;
	
wire   xSYS_REF;
	  
wire   xADDR0;
wire   xADDR1;
wire   xADDR2;
wire   xADDR3;
	  
wire   xCS_ADC1;
wire   xCS_ADC2;
wire   xCS_DAC1;
wire   xCS_DAC2;
wire   xCS_LMK;
wire   xCS_FPGA1;
wire   xCS_FPGA2;

wire rzrv1;
wire rzrv2;

bufout2	bufout2_1 (
	.datain ( {
	xD1_ALARM_FPGA,
	xD2_ALARM_FPGA} ),
	.dataout ( {
	D1_ALARM_FPGA,
	D2_ALARM_FPGA} )
	);

bufin24	buf_in24_inst1 (
	.datain ( 
	  {KAN1_KONTROL,
	   KAN2_KONTROL,
	   KAN3_KONTROL,
	   KAN4_KONTROL,
	  
	   IZL1_KONTROL,
	   IZL2_KONTROL,
	   IZL3_KONTROL,
	   IZL4_KONTROL,
		  
	   LMK_STATUS_LD1_3V3,
	   LMK_STATUS_LD2_3V3,
	  
	   1'h0,
	   1'h0,
	
	   SYS_REF,
	  
	   ADDR0,
	   ADDR1,
	   ADDR2,
	   ADDR3,
	  
	   CS_ADC1,
	   CS_ADC2,
	   CS_DAC1,
	   CS_DAC2,
	   CS_LMK,
	   CS_FPGA1,
	   CS_FPGA2} ),
		
	.dataout ( 
	  {xKAN1_KONTROL,
	   xKAN2_KONTROL,
	   xKAN3_KONTROL,
	   xKAN4_KONTROL,
	  
	   xIZL1_KONTROL,
	   xIZL2_KONTROL,
	   xIZL3_KONTROL,
	   xIZL4_KONTROL,
		  
	   xLMK_STATUS_LD1_3V3,
	   xLMK_STATUS_LD2_3V3,
	  
	   rzrv1,
	   rzrv1,
	
	   xSYS_REF,
	  
	   xADDR0,
	   xADDR1,
	   xADDR2,
	   xADDR3,
	  
	   xCS_ADC1,
	   xCS_ADC2,
	   xCS_DAC1,
	   xCS_DAC2,
	   xCS_LMK,
	   xCS_FPGA1,
	   xCS_FPGA2
		} )
	);

	
wire xUPR_AT4_05;
wire xUPR_AT4_1;
wire xUPR_AT4_2;
wire xUPR_AT4_4;
wire xUPR_AT4_8;
wire xUPR_AT4_16;
	  
wire xUPR_AT1_05;
wire xUPR_AT1_1;
wire xUPR_AT1_2;
wire xUPR_AT1_4;
wire xUPR_AT1_8;
wire xUPR_AT1_16;
	  
wire xUPR_AT2_05;
wire xUPR_AT2_1;
wire xUPR_AT2_2;
wire xUPR_AT2_4;
wire xUPR_AT2_8;
wire xUPR_AT2_16;
	  
wire xUPR_AT3_05;
wire xUPR_AT3_1;
wire xUPR_AT3_2;
wire xUPR_AT3_4;
wire xUPR_AT3_8;
wire xUPR_AT3_16;
	  
wire xUPR_SWITCH1;
wire xUPR_SWITCH2;
wire xUPR_SWITCH3;
wire xUPR_SWITCH4;
	   
wire xLMK_STATUS_LD1_FPGA_3V3;
wire xLMK_STATUS_LD2_FPGA_3V3;
	  
wire xEN_2V5_VDA;
wire xREZERV1;
wire xFPGA_IND1;
wire xFPGA_IND2;
	
buf34_out	buf34_out_inst (
	.datain (  
	 {xUPR_AT4_05,
	  xUPR_AT4_1,
      xUPR_AT4_2,
      xUPR_AT4_4,
	  xUPR_AT4_8,
	  xUPR_AT4_16,
	  
	  xUPR_AT1_05,
	  xUPR_AT1_1,
	  xUPR_AT1_2,
	  xUPR_AT1_4,
	  xUPR_AT1_8,
	  xUPR_AT1_16,
	  
	  xUPR_AT2_05,
	  xUPR_AT2_1,
	  xUPR_AT2_2,
	  xUPR_AT2_4,
	  xUPR_AT2_8,
	  xUPR_AT2_16,
	  
	  xUPR_AT3_05,
	  xUPR_AT3_1,
	  xUPR_AT3_2,
	  xUPR_AT3_4,
	  xUPR_AT3_8,
	  xUPR_AT3_16,
	  
	  xUPR_SWITCH1,
	  xUPR_SWITCH2,
	  xUPR_SWITCH3,
	  xUPR_SWITCH4,
	   
	  xLMK_STATUS_LD1_FPGA_3V3,
	  xLMK_STATUS_LD2_FPGA_3V3,
	  
	  xEN_2V5_VDA,
	  xREZERV1,
	  xFPGA_IND1,
	  xFPGA_IND2} 
	  ),
	.dataout (  
	{ UPR_AT4_05,
	  UPR_AT4_1,
     UPR_AT4_2,
     UPR_AT4_4,
	  UPR_AT4_8,
	  UPR_AT4_16,
	  
	  UPR_AT1_05,
	  UPR_AT1_1,
	  UPR_AT1_2,
	  UPR_AT1_4,
	  UPR_AT1_8,
	  UPR_AT1_16,
	  
	  UPR_AT2_05,
	  UPR_AT2_1,
	  UPR_AT2_2,
	  UPR_AT2_4,
	  UPR_AT2_8,
	  UPR_AT2_16,
	  
	  UPR_AT3_05,
	  UPR_AT3_1,
	  UPR_AT3_2,
	  UPR_AT3_4,
	  UPR_AT3_8,
	  UPR_AT3_16,
	  
	  UPR_SWITCH1,
	  UPR_SWITCH2,
	  UPR_SWITCH3,
	  UPR_SWITCH4,
	   
	  LMK_STATUS_LD1_FPGA_3V3,
	  LMK_STATUS_LD2_FPGA_3V3,
	  
	  EN_2V5_VDA,
	  REZERV1,
	  FPGA_IND1,
	  FPGA_IND2} )
	);
	
wire xUART6_TX; 
wire xUART1_TX; 	 
wire xTX_FTDI_1;	 
wire xTX_FTDI_2; 	 
wire xBOOT_MK_FTDI;
wire xRESET_MK_FTDI;	  
wire xMR_RESET_MK_FPGA; 
wire xBOOT_MK_FPGA; 
		 
wire xWDATA_MK0;
wire xWDATA_MK1; 
wire xWDATA_MK2; 
wire xWDATA_MK3; 
wire xWDATA_MK4; 
wire xWDATA_MK5; 
wire xWDATA_MK6;
wire xWDATA_MK7; 

wire xOK_BUS;
wire xWR_BUS;
wire xRD_BUS;
	
assign 	xUART6_TX 	  		=UART6_TX;
assign  xUART1_TX 	  		=UART1_TX;
assign  xTX_FTDI_1	  		=TX_FTDI_1;
assign  xTX_FTDI_2	  		=TX_FTDI_2;
assign  xBOOT_MK_FTDI 		=BOOT_MK_FTDI;
assign  xRESET_MK_FTDI		=RESET_MK_FTDI;
assign  xMR_RESET_MK_FPGA	=MR_RESET_MK_FPGA;
assign  xBOOT_MK_FPGA		=BOOT_MK_FPGA;

assign 	OK_BUS		 =xOK_BUS;
assign 	xWR_BUS		 =WR_BUS;
assign 	xRD_BUS		 =RD_BUS;

assign xWDATA_MK0    =WDATA_MK0; //<----

assign  WDATA_MK2	 =xWDATA_MK2;//----> прерывание от UDP2

wire xUART6_RX;
wire xUART1_RX;
wire xRX_FTDI_1;
wire xRX_FTDI_2;	 
wire xBOOT1;
wire xBOOT0;
wire xRESET_MK;
wire xCLK_FOR_MK_3V3;
wire xTNC_MK_1HZ;
wire xINT1_FPGA;	
	
bufout10	bufout10_inst (
	.datain (  
	{xUART6_RX,
	 xUART1_RX,
	 xRX_FTDI_1,
	 xRX_FTDI_2,	 
	 xBOOT1,
	 xBOOT0,
	 xRESET_MK,
	 xCLK_FOR_MK_3V3,
	 xTNC_MK_1HZ,
	 xINT1_FPGA }
	 ),
	.dataout ( 
	{UART6_RX,
	 UART1_RX,
	 RX_FTDI_1,
	 RX_FTDI_2,	 
	 BOOT1,
	 BOOT0,
	 RESET_MK,
	 CLK_FOR_MK_3V3,
	 TNC_MK_1HZ,
	 INT1_FPGA}
	 )
	);
	
	
wire xSPI4_SCK_MK;
wire xSPI4_NSS_MK;
wire xSPI4_MOSI_MK;
wire xSPI3_SCK;
wire xSPI3_CS;
wire xSPI3_MISO;
wire xSPI2_NSS_MK;
	
/*	 
bufout4	bufout4_1 (
	.datain ( 
	{xSPI4_SCK_MK,
	 xSPI4_NSS_MK,
	 xSPI4_MOSI_MK,
	 xSPI3_MISO} ),
	.dataout ( 
	{SPI4_SCK_MK,
	 SPI4_NSS_MK,
	 SPI4_MOSI_MK,
  	 SPI3_MISO}
	 )
	);
*/
 bufi3	bufi3_1 (
	.datain ( 
	{SPI3_MOSI,
	 SPI3_SCK,
	 SPI3_CS
	 } ),
	.dataout ( 
	{xSPI3_MOSI,
	 xSPI3_SCK,
	 xSPI3_CS}
	 )
	);
	
buf_out1	buf_out1_1 (
	.datain ( xSPI2_NSS_MK ),
	.dataout ( SPI2_NSS_MK )
	);
	
	
 wire xSPI4_MISO_MK;
 wire xSPI3_MOSI;
	
bufi1	bufi1_inst1 (
	.datain ( SPI4_MISO_MK ),
	.dataout ( xSPI4_MISO_MK )
	);
	
	
	
wire xDAC_SYNC;
wire xD1_RESETB;
wire xD1_SCLK;
wire xD1_SDO;
wire xD1_SDENB;
wire xD1_SLEEP;
wire xD1_SYNC_N_AB;
wire xD1_SYNC_N_CD;
wire xD1_TXENABLE; 
wire xD2_RESETB;
wire xD2_SCLK;
wire xD2_SDO;
wire xD2_SDENB;
wire xD2_SLEEP;
wire xD2_SYNC_N_AB;
wire xD2_SYNC_N_CD;
wire xD2_TXENABLE;

wire xD1_SLEEP_upr_MK;
wire xD2_SLEEP_upr_MK;

wire xD1_RESETB_upr_MK;
wire xD2_RESETB_upr_MK;

//--------------DAC1----------------
assign xD1_RESETB = xD1_RESETB_upr_MK;
assign xD1_SLEEP  = xD1_SLEEP_upr_MK; 
assign xD1_TXENABLE=1;
//----------------------------------
//--------------DAC2----------------
assign xD2_RESETB = xD2_RESETB_upr_MK;
assign xD2_SLEEP  = xD2_SLEEP_upr_MK; 
assign xD2_TXENABLE=1;
//----------------------------------

bufi4	buf4_1 (
	.datain ( {
	D1_SYNC_N_AB,
	D1_SYNC_N_CD,
	D2_SYNC_N_AB,
	D2_SYNC_N_CD}),
	.dataout (  {
	xD1_SYNC_N_AB,
	xD1_SYNC_N_CD,
	xD2_SYNC_N_AB,
	xD2_SYNC_N_CD})
	);
	
bufout11	bufout11_1 (
	.datain ( 
	{ xDAC_SYNC,
	  xD1_RESETB,
	  xD1_SCLK,
	  xD1_SDENB,
	  xD1_SLEEP,
	  xD1_TXENABLE,	 
	  xD2_RESETB,
	  xD2_SCLK,
	  xD2_SDENB,
	  xD2_SLEEP,
	  xD2_TXENABLE} ),
	.dataout ( 
	{ DAC_SYNC,
	  D1_RESETB,
	  D1_SCLK,
	  D1_SDENB,
	  D1_SLEEP,
	  D1_TXENABLE,	 
	  D2_RESETB,
	  D2_SCLK,
	  D2_SDENB,
	  D2_SLEEP,
	  D2_TXENABLE}
	  )
	);	
	
	
bufi1	bufi_d1_sdo (
	.datain ( D1_SDO ),
	.dataout ( xD1_SDO )
	);
	
bufi1	bufi_d2_sdo (
	.datain ( D2_SDO ),
	.dataout ( xD2_SDO )
	);	
	
	
wire xD2_SYNCB;	  
wire xD1_SYNCB;
wire xD1_SDIO;
wire xD1_ALARM;
wire xD2_SDIO;
wire xD2_ALARM;
	  
bufi4	bufi4_inst1 (
	.datain ( 
	  {D2_SYNCB,	  
	   D1_SYNCB,
	   D1_ALARM,
	   D2_ALARM} ),
	.dataout ( 
	  {xD2_SYNCB,	  
	   xD1_SYNCB,
	   xD1_ALARM,
	   xD2_ALARM} )
	);
	
	
	
bufout3	
	bufout3_inst1 (
	.datain ( 
				{xD1_SDIO,
				xD2_SDIO,
				xLMK_SDIO_3V3}),
	.dataout (
				{D1_SDIO,
				D2_SDIO,
				LMK_SDIO_3V3})
				);

	
	
wire xA1_OVRA_1V8;
wire xA1_OVRB_1V8;
wire xA1_SDOUT_1V8;
wire xA2_OVRA_1V8;
wire xA2_OVRB_1V8;
wire xA2_SDOUT_1V8;
	
	bufi6	bufi6_inst2 (
	.datain ( 
	{A1_OVRA_1V8,
	 A1_OVRB_1V8,
	 A1_SDOUT_1V8,
	 A2_OVRA_1V8,
	 A2_OVRB_1V8,
    A2_SDOUT_1V8} ),
	.dataout (
{	xA1_OVRA_1V8,
	xA1_OVRB_1V8,
	xA1_SDOUT_1V8,
	xA2_OVRA_1V8,
	xA2_OVRB_1V8,
   xA2_SDOUT_1V8} )
	);
	
wire xA1_CTRL2_1V8;
wire xA1_CTRL1_1V8;
wire xA1_PWRDOWN_1V8; 
wire xA1_RESET_1V8;
wire xA1_SCLK_1V8;
wire xA1_SDATA_1V8;
wire xA1_SEN_1V8;
wire xA1_STBY_1V8;
wire xA2_CTRL2_1V8;
wire xA2_CTRL1_1V8;
wire xA2_PWRDOWN_1V8; 
wire xA2_RESET_1V8;
wire xA2_SCLK_1V8;
wire xA2_SDATA_1V8;
wire xA2_SEN_1V8;
wire xA2_STBY_1V8;
wire xA1_SNC;
wire xA2_SNC;

bufout16	bufout16_inst (
	.datain ( 
	{ xA1_CTRL2_1V8,
	  xA1_CTRL1_1V8,
	  xA1_PWRDOWN_1V8, 
	  xA1_RESET_1V8,
	  xA1_SCLK_1V8,
	  xA1_SDATA_1V8,
	  xA1_SEN_1V8,
	  xA1_STBY_1V8,
	  xA2_CTRL2_1V8,
	  xA2_CTRL1_1V8,
	  xA2_PWRDOWN_1V8, 
	  xA2_RESET_1V8,
	  xA2_SCLK_1V8,
	  xA2_SDATA_1V8,
	  xA2_SEN_1V8,
	  xA2_STBY_1V8} ),
	.dataout ( 
	{ A1_CTRL2_1V8,
	  A1_CTRL1_1V8,
	  A1_PWRDOWN_1V8, 
	  A1_RESET_1V8,
	  A1_SCLK_1V8,
	  A1_SDATA_1V8,
	  A1_SEN_1V8,
	  A1_STBY_1V8,
	  A2_CTRL2_1V8,
	  A2_CTRL1_1V8,
	  A2_PWRDOWN_1V8, 
	  A2_RESET_1V8,
	  A2_SCLK_1V8,
	  A2_SDATA_1V8,
	  A2_SEN_1V8,
	  A2_STBY_1V8} )
	);
	
buf_out1	buf_out1_inst1 (
	.datain ( xA1_SNC ),
	.dataout ( A1_SNC )
	);
	
	
buf_out1	buf_out1_inst2 (
	.datain ( xA2_SNC ),
	.dataout ( A2_SNC )
	);
	
	
	  wire xLMK_SEL0_3V3;
	  wire xLMK_SEL1_3V3;
	  wire xLMK_RESET_3V3;
	  wire xLMK_SCK_3V3;
	  wire xLMK_CS_3V3;
	  wire xLMK_SYNC_3V3;
	  wire xRNE1_RS422;
	  wire xDE1RX_RS422;
	  wire xRX1_RS422;
	  wire xFLASH_CLK_3V3;  
	  wire xFLASH_MOSI_3V3;
	  wire xFLASH_CS_3V3;
	  wire xDE_MISO_LVDS_3V3;  
	  wire xSYNC_DA2;
	  wire xSEL_ETALON_3V3;
      wire xFPGA_LED1_3V3;
      wire xT_TEST1;
	  wire xT_TEST2;
	  wire xT_TEST3;
	   
	  wire xLMK_SDIO_3V3; 
		
		
//----------------------------SPI LMK---------------------------------------------------	   
	   assign xLMK_SCK_3V3 =xSPI3_SCK;
	   assign xLMK_CS_3V3  =xCS_LMK;
	   assign xLMK_SDIO_3V3=xSPI3_MOSI;
	
		
	bufout17	bufout17_inst2 (
	.datain (
	 {xLMK_SEL0_3V3,
	  xLMK_SEL1_3V3,
	  xLMK_SCK_3V3,
	  xLMK_CS_3V3,
	  xLMK_SYNC_3V3,
	  xRNE1_RS422,
	  xDE1RX_RS422,
	  xRX1_RS422,
	  xFLASH_CLK_3V3,  
	  xFLASH_MOSI_3V3,
	  xFLASH_CS_3V3,
	  xDE_MISO_LVDS_3V3,  
	  xSYNC_DA2,
	  xSEL_ETALON_3V3,
  	  xFPGA_LED1_3V3,
  	  xT_TEST1,
	  xT_TEST2} 
	  ),
	.dataout (
	 {LMK_SEL0_3V3,
	  LMK_SEL1_3V3,
	  LMK_SCK_3V3,
	  LMK_CS_3V3,
	  LMK_SYNC_3V3,
	  RNE1_RS422,
	  DE1RX_RS422,
	  RX1_RS422,
	  FLASH_CLK_3V3,  
	  FLASH_MOSI_3V3,
	  FLASH_CS_3V3,
	  DE_MISO_LVDS_3V3,  
	  SYNC_DA2,
	  SEL_ETALON_3V3,
     FPGA_LED1_3V3,
     T_TEST1,
	  T_TEST2} )
	);
	
bufi1	bufi1_inst5 (
	.datain ( LMK_RESET_3V3 ),
	.dataout ( xLMK_RESET_3V3 )
	);
	

wire xONET1_RX_LOS;
wire xONET2_RX_LOS;
wire xTX1_RS422;
wire xFLASH_MISO_3V3;
wire xCS_FLASH_FPGA;	
	
bufi5	bufi5_inst (
	.datain ( 
	{ 
	  ONET1_RX_LOS,
	  ONET2_RX_LOS,
	  TX1_RS422,
	  FLASH_MISO_3V3,
	  CS_FLASH_FPGA}
	  ),
	.dataout ( 
	{ 
	  xONET1_RX_LOS,
	  xONET2_RX_LOS,
	  xTX1_RS422,
	  xFLASH_MISO_3V3,
	  xCS_FLASH_FPGA}
	  )
	);	
	
//------------------------TEST SPI---------------------------------

wire xSPI3_MISO1;
wire xSPI3_MISO2;
wire xSPI3_MISO3;
wire xSPI3_MISO4;
wire xSPI3_MISO5;
wire xSPI3_MISO6;
wire xSPI3_MISO7;
wire xSPI3_MISO8;
wire xSPI3_MISO9;
wire xSPI3_MISO10;
wire xSPI3_MISO11;
wire xSPI3_MISO12;
wire xSPI3_MISO13;
wire xSPI3_MISO14;
wire xSPI3_MISO15;
wire xSPI3_MISO16;
wire xSPI3_MISO17;
wire xSPI3_MISO18;
wire xSPI3_MISO19;
wire xSPI3_MISO20;
wire xSPI3_MISO21;
wire xSPI3_MISO22;
wire xSPI3_MISO23;
wire xSPI3_MISO24;
wire xSPI3_MISO25;

wire xSPI3_MISO26;
wire xSPI3_MISO27;
wire xSPI3_MISO28;
wire xSPI3_MISO29;
wire xSPI3_MISO30;
wire xSPI3_MISO31;
wire xSPI3_MISO32;
wire xSPI3_MISO33;
wire xSPI3_MISO34;
wire xSPI3_MISO35;
wire xSPI3_MISO36;
wire xSPI3_MISO37;


wire [31:0] wTESTwr;
wire [ 3:0] wire_out;



Block_read_spi 
 #(32,30) spi_test       (.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO1),.cs(xCS_FPGA1) ,.rst(0) ,
	.inport(32'hdeedbeef));//чтение test
	
Block_read_spi 
 #(32,35)     spi_TEST_rd(.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO2),.cs(xCS_FPGA1) ,.rst(0) ,
	.inport(wTESTwr));//чтение контрольного регистра - проверка шины SPI	

Block_write_spi 
 #(32,36) spi_TEST_wr( .clk(clk_125),.sclk(xSPI3_SCK),   .mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA1) ,.rst(0) ,
	.out(wTESTwr));	  //запись контрольного регистра - проверка шины SPI

//-----------------------------------------------------------------
wire rst_block000;
rst reset000(clk_125,rst_block000);
	
	 Block_write_spi 
 #(8,1) spi_att1( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.out
		 ({xUPR_AT1_05,
			xUPR_AT1_1,
			xUPR_AT1_2,
			xUPR_AT1_4,
			xUPR_AT1_8,
			xUPR_AT1_16}
			) );		
	
 Block_write_spi 
 #(8,2) spi_att2( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.out
		 ({xUPR_AT2_05,
			xUPR_AT2_1,
			xUPR_AT2_2,
			xUPR_AT2_4,
			xUPR_AT2_8,
			xUPR_AT2_16}
			) );

 Block_write_spi 
 #(8,3) spi_att3( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.out
		 ({xUPR_AT3_05,
			xUPR_AT3_1,
			xUPR_AT3_2,
			xUPR_AT3_4,
			xUPR_AT3_8,
			xUPR_AT3_16}
			) );
			
 Block_write_spi 
 #(8,4) spi_att4( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.out
		 ({xUPR_AT4_05,
			xUPR_AT4_1,
			xUPR_AT4_2,
			xUPR_AT4_4,
			xUPR_AT4_8,
			xUPR_AT4_16}
			) );

wire dummy_wire;			
	
	 Block_write_spi 
 #(8,5) spi_upr1( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.out
		 ({ xUPR_SWITCH1,
			xUPR_SWITCH2,
			xUPR_SWITCH3,
			xUPR_SWITCH4,
			dummy_wire    //неиспользуемый сигнал
			}  
			) );

//PWRDN для АЦП и ЦАП с МК			

			
	 Block_write_spi 
 #(8,99) spi_PWRDN( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.out
		 ({ xD1_RESETB_upr_MK,
		    xD2_RESETB_upr_MK,
			 xA1_RESET_MK,
			 xA2_RESET_MK,
			 xD1_SLEEP_upr_MK,
			 xD2_SLEEP_upr_MK,
			 xA1_PWRDOWN_upr_MK,
			 xA2_PWRDOWN_upr_MK
			}  
			) );

 	 Block_write_spi 
 #(8,48) spi_LED( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.out
		 ({
			xFPGA_IND2,		  //индикация лицевой панели : "ИСПРАВ"
			xFPGA_IND1,		  //индикация лицевой панели : "ЛИНИЯ СВЯЗИ"
			xREZERV1		  //индикация лицевой панели : "ИСПРАВ"
			}  
			) );
//-----------------------------контроль входных сигналов через SPI --------------------------------------------------

	 Block_read_spi 
 #(8,6) spi_control1( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO3),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.inport
		 ({xKAN1_KONTROL,
			xKAN2_KONTROL,
			xKAN3_KONTROL,
			xKAN4_KONTROL,
			xIZL1_KONTROL,
			xIZL2_KONTROL,
			xIZL3_KONTROL,  // 
			xIZL4_KONTROL}  // 
			) ); 
			
	 Block_read_spi 
 #(8,7) spi_control2( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO4),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.inport
		 ({ xADDR0,
			xADDR1,
			xADDR2,
			xADDR3,
			xD1_ALARM,
			xD2_ALARM,
			xLMK_STATUS_LD1_3V3,  // 
			xLMK_STATUS_LD2_3V3}  // 
			) ); 
			
	 Block_read_spi 
 #(8,8) spi_control3( .clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO5),.cs(xCS_FPGA1) ,.rst(rst_block000) ,
	.inport
		 ({ xONET1_RX_LOS,
			xONET2_RX_LOS,
			xADDR2,
			xADDR3,
			xD1_ALARM_FPGA,
			xD2_ALARM_FPGA,
			xLMK_STATUS_LD1_3V3,  // 
			xLMK_STATUS_LD2_3V3}  // 
			) );

			
//------------------TEMP signal-------------------
assign xLMK_SEL0_3V3  = 1'h00;//поменять управление в процессе отладки!!!
assign xLMK_SEL1_3V3  = 1'h00;
assign xLMK_SYNC_3V3  = xWDATA_MK0;
//------------------------------------------------			
			
			
//----------------------------------------------------------------			
assign xEN_2V5_VDA=1'h1; //0 - выключен источник питания для DAC и ADC			
//----------------------------------------------------------------
assign xTNC_MK_1HZ     = signal_1sec;  //направляем сигнал 1сек на мк
assign xSEL_ETALON_3V3 = 1'h1; //1 - включаем поступление сигнала эталона с ВЧ разъёма

assign xD1_SDENB=xCS_DAC1;
assign xD2_SDENB=xCS_DAC2;

assign xFLASH_CS_3V3 =xCS_FLASH_FPGA;
assign xFLASH_CLK_3V3=xSPI3_SCK;

assign xD2_SCLK		=xSPI3_SCK;
assign xD1_SCLK		=xSPI3_SCK; 

assign xD1_SDIO      = xSPI3_MOSI;
assign xD2_SDIO      = xSPI3_MOSI;

assign xFLASH_MOSI_3V3 = xSPI3_MOSI;

wire xSPI3_MISO_AND;
assign xSPI3_MISO_AND = 
							xSPI3_MISO1&
							xSPI3_MISO2&
							xSPI3_MISO3&
							xSPI3_MISO4&
							xSPI3_MISO5&
					//		xSPI3_MISO6&
					//		xSPI3_MISO7&
					//		xSPI3_MISO8&
							xSPI3_MISO9&  //eth1
							xSPI3_MISO10&
							xSPI3_MISO11&
							xSPI3_MISO12&

							xSPI3_MISO13&//adc2
							xSPI3_MISO14&//adc2
							xSPI3_MISO15&//adc2
							xSPI3_MISO16&//adc2
							xSPI3_MISO17&//adc2
							xSPI3_MISO18&//adc2
							xSPI3_MISO19&//adc2
							xSPI3_MISO20&//adc2
							xSPI3_MISO21&//eth2
							xSPI3_MISO22&//test SDRAM

							xSPI3_MISO23&//DAC2
			  		    	xSPI3_MISO24&//DAC2
				    		xSPI3_MISO25&//DAC2

				//    		xSPI3_MISO26&//ADC1
				     		xSPI3_MISO27&//тестируем модуль приёма данных для блока sync
				    		xSPI3_MISO28&//ADC1
				    		xSPI3_MISO29&//ADC1
				    		xSPI3_MISO30&//ADC1
				    		xSPI3_MISO31&//ADC1
				    		xSPI3_MISO32&//ADC1
				    		xSPI3_MISO33&//ADC1
				    		xSPI3_MISO34&//ADC1
				    		xSPI3_MISO35;//
				    //		xSPI3_MISO36&//
				    //		xSPI3_MISO37 //
									
//---------------------------------------------									
//assign xSPI3_MISO = xD1_SDO;//TEST!!!

assign SPI3_MISO =	xSPI3_MISO;						
 
assign xSPI3_MISO  = (!xCS_FPGA1)          ?xSPI3_MISO_AND:
					 (!xCS_LMK  )	       ?xLMK_RESET_3V3://вывожу spi с LMK через её ногу reset
				 // (!xCS_FLASH_FPGA)   ?xFLASH_MISO_3V3:
			 		 (!xD1_SDENB)		   ?xD1_SDO:
					 (!xD2_SDENB)		   ?xD2_SDO:	
					 (!xA1_SEN_1V8)        ?xA1_SDOUT_1V8:
					 (!xA2_SEN_1V8)        ?xA2_SDOUT_1V8:1'h1;

 							
assign xLMK_STATUS_LD1_FPGA_3V3=xLMK_STATUS_LD2_3V3;//тестовый вывод с LMK 							
assign xLMK_STATUS_LD2_FPGA_3V3=JESD_DAC1_sync_n;//тестовый вывод с DAC
 
//----------BOOT uart stm32---------- 
wire wRESET_MK;

reset_long
#(1000000) rst_mk (.clk(clk_125),.en(xBOOT_MK_FTDI &  xMR_RESET_MK_FPGA), .rst(wRESET_MK));  //модуль ресета для мк
//assign wRESET_MK=0;

assign xUART1_RX  = xTX_FTDI_1;
assign xRX_FTDI_1 = xUART1_TX;


assign xBOOT1    = 1'h0 ; //для stm32
assign xBOOT0    = (~xRESET_MK_FTDI)  | xBOOT_MK_FPGA;
assign xRESET_MK = wRESET_MK;


//--------------rs485-------------------

assign xRX1_RS422   =  xUART6_TX;
assign xUART6_RX    =  xTX1_RS422 & xTX_FTDI_2;
assign xRNE1_RS422  =  xCS_FPGA2;
assign xDE1RX_RS422 = ~xCS_FPGA2;

assign xRX_FTDI_2   =  TxD_test;//тут выводим тестовые данные с SPI-DMA (SPI4)  xUART6_TX

//-------------SYS_SPI----------------
/*	  
assign xD_MISO           = xSPI4_MISO_MK;
assign xSPI4_NSS_MK      = xCE_MO;
assign xCLK_MO           = xSPI4_SCK_MK;
assign xSPI4_MOSI_MK     = xD_MOSI;
//assign xDE_MISO_LVDS_3V3 = xLMK_STATUS_LD1_3V3; //управление буфером lvds - MISO от микроконтроллера 
*/
//----------------ADC-------------------

reg r_xA1_RESET_1V8 =0;
reg r_rst_adc1_align=0;

reg r_xA2_RESET_1V8 =0;
reg r_rst_adc2_align=0;
always @(posedge clk_240_adc1)
begin
r_xA1_RESET_1V8 <=xA1_RESET_MK;
r_rst_adc1_align<=xA1_RESET_MK;

r_xA2_RESET_1V8 <=xA2_RESET_MK;
r_rst_adc2_align<=xA2_RESET_MK;
end

wire xA1_RESET_MK;
wire xA2_RESET_MK;

assign xA2_RESET_1V8 =r_xA2_RESET_1V8;
assign xA1_RESET_1V8 =r_xA1_RESET_1V8;
assign rst_adc2_align=r_rst_adc2_align;
assign rst_adc1_align=r_rst_adc1_align;

assign xA1_SEN_1V8   =xCS_ADC1;
assign xA2_SEN_1V8   =xCS_ADC2;
assign xA2_SCLK_1V8  =xSPI3_SCK;
assign xA1_SCLK_1V8  =xSPI3_SCK;
assign xA1_SDATA_1V8 =xSPI3_MOSI; 
assign xA2_SDATA_1V8 =xSPI3_MOSI;

assign xA1_CTRL2_1V8  =0;//zero - Normal operation
assign xA1_CTRL1_1V8  =0;
assign xA1_PWRDOWN_1V8=xA1_PWRDOWN_upr_MK;
assign xA1_STBY_1V8   =0;

assign xA2_CTRL2_1V8  =0;//zero - Normal operation
assign xA2_CTRL1_1V8  =0;
assign xA2_PWRDOWN_1V8=xA2_PWRDOWN_upr_MK;
assign xA2_STBY_1V8   =0;


//---------------------ADC1-------------------------------------------

wire [ 7:0] xrx_runningdisp_adc1;
wire [ 7:0] xrx_disperr_adc1;
wire [ 7:0] xrx_errdetect_adc1;
wire [ 3:0] xrx_clkout_adc1;
wire [63:0] xrx_parallel_data_adc1;
wire [ 7:0] xrx_datak_adc1;
wire rst_adc1_align;
wire sync_n_adc1;
wire xrx_ready_adc1;
wire [7:0]  xrx_patterndetect_adc1;
wire [7:0]  xrx_syncstatus_adc1;
wire [19:0] rx_bitslipboundaryselectout_adc1;
wire [15:0] ch0_adc0_data;
wire [15:0] ch1_adc0_data;
wire [63:0] adc_data_tst1_1;
wire [63:0] adc_data_tst2_1;


assign xA1_SNC=sync_n_adc1;//SYNC_N ADC1

//    21-05-19
custom_phy_4line 
adc1_phy(
		.phy_mgmt_clk(clk_125),         //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset(),   // phy_mgmt_clk_reset.reset
		.phy_mgmt_address(),     //           phy_mgmt.address
		.phy_mgmt_read(),        //                   .read
		.phy_mgmt_readdata(),    //                   .readdata
		.phy_mgmt_waitrequest(), //                   .waitrequest
		.phy_mgmt_write(),       //                   .write
		.phy_mgmt_writedata(),   //                   .writedata
		.rx_ready(xrx_ready_adc1),  //           rx_ready.export
		.pll_ref_clk(clk_120_adc1), //        pll_ref_clk.clk
		.rx_serial_data({A1_TX3,A1_TX2,A1_TX1,A1_TX0}),       //     rx_serial_data.export
		.rx_runningdisp(xrx_runningdisp_adc1),       //     rx_runningdisp.export
		.rx_disperr(xrx_disperr_adc1),           //         rx_disperr.export
		.rx_errdetect(xrx_errdetect_adc1),         //       rx_errdetect.export
		.rx_patterndetect(xrx_patterndetect_adc1),
		.rx_syncstatus(xrx_syncstatus_adc1),
        .rx_bitslipboundaryselectout(rx_bitslipboundaryselectout_adc1),		
		.rx_coreclkin({clk_120_adc1,clk_120_adc1,clk_120_adc1,clk_120_adc1}),
		.rx_clkout(xrx_clkout_adc1),            //          rx_clkout.export
		.rx_parallel_data(xrx_parallel_data_adc1),     //   rx_parallel_data.export
		.rx_datak(xrx_datak_adc1),             //           rx_datak.export
		.reconfig_from_xcvr(),   // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr()      //   reconfig_to_xcvr.reconfig_to_xcvr
	);


wire fifo_adc1_full_sig_1;


wire tst_adc1;
wire [3:0] w_ok0;
wire [3:0] w_ok1;
wire [7:0] walign_tst;
wire adc0_sysref_error; 

//    15-01-19
adc1_jesd_rcv
adc1
(
.clk_120(clk_120_adc1),//входная тактовая частота
.clk_240(clk_240_adc1),//выходная тактовая частота
.rst_adc_align(rst_adc1_align),//подать ресет от микроконтроллера для АЦП0
.SYSREF0(SYSREF0),
.xrx_syncstatus_adc(xrx_syncstatus_adc1),
.xrx_disperr_adc(xrx_disperr_adc1),
.xrx_errdetect_adc(xrx_errdetect_adc1),
.xrx_parallel_data_adc(xrx_parallel_data_adc1),
.xrx_datak_adc(xrx_datak_adc1),
.fifo2clk_tst_rd(tst_adc1),//сигнал чтения для тестового вывода слов на SPI
.walign_tst(walign_tst),//тестовый вывод кода смещения входного слова
.w_ok0(w_ok0),//выход кода смещения эластикбуфера0
.w_ok1(w_ok1),//выход кода смещения эластикбуфера1
.sync_n_adc(sync_n_adc1),//выход сигнала SYNC_N
.sysref_error(adc0_sysref_error),
.ch_adc0_data(ch0_adc0_data),
.ch_adc1_data(ch1_adc0_data),
.adc_data_tst2(adc_data_tst2_1),
.adc_data_tst1(adc_data_tst1_1)
);


//---------------control error SYNC_N ADC1-------------
wire [15:0] error_adc1;
wire [15:0] error_sysref_adc1;
wire wclr1_adc1;
wire wclr2_adc1;
wire wclr3_adc1;

error_sch  
block_error_adc1 
 (
  	.out(error_adc1),
	.clk(clk_240_adc1),
	.event_int(~sync_n_adc1),
	.rst(wclr1_adc1)
);

error_sch  
block_error_sysref_adc1 
 (
  	.out(error_sysref_adc1),
	.clk(clk_120_adc1),
	.event_int(adc0_sysref_error),
	.rst(wclr2_adc1)
);

wire rst_block001;
rst reset001(clk_120_adc1,rst_block001);

Block_read_spi_v2 
 #(16,110) spi_error_adc1(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						 .miso(xSPI3_MISO28)  ,.cs(xCS_FPGA1)  ,.rst(rst_block001),
						 .clr(wclr1_adc1),           .inport (error_adc1));
 Block_read_spi_v2 
 #(16,112) spi_error_sysref_adc1(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						      .miso(xSPI3_MISO30)  ,.cs(xCS_FPGA1)  ,.rst(rst_block001),
						      .clr(wclr2_adc1),      .inport (error_sysref_adc1));
  Block_read_spi_v2 
 #(8,113) spi_walign_adc1(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						      .miso(xSPI3_MISO31)  ,.cs(xCS_FPGA1)  ,.rst(rst_block001),
						      .clr(wclr3_adc1),      .inport (walign_tst));
//-------------------------------------------------
Block_read_spi 
 #(32,100) spi_custom_phy_reg1_adc1( .clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO29),
 .cs(xCS_FPGA1) ,.rst(rst_block001) ,
	.inport
		 ({
		 xrx_runningdisp_adc1[7:0],
		       xrx_datak_adc1[7:0],
		     xrx_disperr_adc1[7:0],
		   xrx_errdetect_adc1[7:0]		   
			}));

Block_read_spi_v2 
 #(64,103) spi_custom_phy_reg4_adc1(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO32)  ,.cs(xCS_FPGA1)  ,.rst(rst_block001),
						 .clr(),           .inport (adc_data_tst1_1));
 Block_read_spi_v2 
 #(64,106) spi_custom_phy_reg5_adc1(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO33)  ,.cs(xCS_FPGA1)  ,.rst(rst_block001),
						 .clr(tst_adc1),           .inport (adc_data_tst2_1));

		 
Block_read_spi 
 #(24,104) spi_custom_phy_reg6_adc1( .clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO34),
 .cs(xCS_FPGA1) ,.rst(rst_block001) ,
	.inport
		 ({1'b0,
		 	w_ok0,
	  	 xrx_ready_adc1,		  
		 sync_n_adc1,
		 locked_120,
		 xrx_patterndetect_adc1[7:0],
		 xrx_syncstatus_adc1[7:0]		 
			}));
			
Block_read_spi 
 #(24,105) spi_custom_phy_reg7_adc1( .clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO35),
 .cs(xCS_FPGA1) ,.rst(rst_block001) ,
	.inport
		 ({4'b0000,
	  	 rx_bitslipboundaryselectout_adc1[19:0]		 
			}));			

	
//---------------------ADC2-------------------------------------------

wire [ 7:0] xrx_runningdisp_adc2;
wire [ 7:0] xrx_disperr_adc2;
wire [ 7:0] xrx_errdetect_adc2;
wire [ 3:0] xrx_clkout_adc2;
wire [63:0] xrx_parallel_data_adc2;
wire [ 7:0] xrx_datak_adc2;
wire rst_adc2_align;
wire sync_n_adc2;
wire xrx_ready_adc2;
wire [7:0]  xrx_patterndetect_adc2;
wire [7:0]  xrx_syncstatus_adc2;
wire [19:0] rx_bitslipboundaryselectout_adc2;
wire [15:0] ch0_adc2_data;
wire [15:0] ch1_adc2_data;
wire [63:0] adc_data_tst1_2;
wire [63:0] adc_data_tst2_2;


assign xA2_SNC=sync_n_adc2;//SYNC_N ADC2

//    21-05-19
custom_phy_4line 
adc2_phy(
		.phy_mgmt_clk(clk_125),         //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset(),   // phy_mgmt_clk_reset.reset
		.phy_mgmt_address(),     //           phy_mgmt.address
		.phy_mgmt_read(),        //                   .read
		.phy_mgmt_readdata(),    //                   .readdata
		.phy_mgmt_waitrequest(), //                   .waitrequest
		.phy_mgmt_write(),       //                   .write
		.phy_mgmt_writedata(),   //                   .writedata
		.rx_ready(xrx_ready_adc2),  //           rx_ready.export
		.pll_ref_clk(clk_120_adc1), //        pll_ref_clk.clk
		.rx_serial_data({A2_TX3,A2_TX2,A2_TX1,A2_TX0}),       //     rx_serial_data.export
		.rx_runningdisp(xrx_runningdisp_adc2),       //     rx_runningdisp.export
		.rx_disperr(xrx_disperr_adc2),           //         rx_disperr.export
		.rx_errdetect(xrx_errdetect_adc2),         //       rx_errdetect.export
		.rx_patterndetect(xrx_patterndetect_adc2),
		.rx_syncstatus(xrx_syncstatus_adc2),
        .rx_bitslipboundaryselectout(rx_bitslipboundaryselectout_adc2),		
		.rx_coreclkin({clk_120_adc1,clk_120_adc1,clk_120_adc1,clk_120_adc1}),
		.rx_clkout(xrx_clkout_adc2),            //          rx_clkout.export
		.rx_parallel_data(xrx_parallel_data_adc2),     //   rx_parallel_data.export
		.rx_datak(xrx_datak_adc2),             //           rx_datak.export
		.reconfig_from_xcvr(),   // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr()      //   reconfig_to_xcvr.reconfig_to_xcvr
	);


wire fifo_adc2_full_sig_1;

wire tst_adc2;

wire [3:0] w2_ok0;
wire [3:0] w2_ok1;
wire [7:0] walign2_tst;
wire adc2_sysref_error; 

//    15-01-19
adc2_jesd_rcv
adc2
(
.clk_120(clk_120_adc1),//входная тактовая частота
.clk_240(clk_240_adc1),//выходная тактовая частота
.rst_adc_align(rst_adc2_align),//подать ресет от микроконтроллера для АЦП0
.SYSREF0(SYSREF0),
.xrx_syncstatus_adc(xrx_syncstatus_adc2),
.xrx_disperr_adc(xrx_disperr_adc2),
.xrx_errdetect_adc(xrx_errdetect_adc2),
.xrx_parallel_data_adc(xrx_parallel_data_adc2),
.xrx_datak_adc(xrx_datak_adc2),
.fifo2clk_tst_rd(tst_adc2),//сигнал чтения для тестового вывода слов на SPI
.walign_tst(walign2_tst),//тестовый вывод кода смещения входного слова
.w_ok0(w2_ok0),//выход кода смещения эластикбуфера0
.w_ok1(w2_ok1),//выход кода смещения эластикбуфера1
.sync_n_adc(sync_n_adc2),//выход сигнала SYNC_N
.sysref_error(adc2_sysref_error),
.ch_adc0_data(ch0_adc2_data),
.ch_adc1_data(ch1_adc2_data),
.adc_data_tst2(adc_data_tst2_2),
.adc_data_tst1(adc_data_tst1_2)
);


//---------------control error SYNC_N ADC2-------------
wire [15:0] error_adc2;
wire [15:0] error_sysref_adc2;
wire wclr1_adc2;
wire wclr2_adc2;
wire wclr3_adc2;

error_sch  
block_error_adc2 
 (
  	.out(error_adc2),
	.clk(clk_240_adc1),
	.event_int(~sync_n_adc2),
	.rst(wclr1_adc2)
);

error_sch  
block_error_sysref_adc2 
 (
  	.out(error_sysref_adc2),
	.clk(clk_120_adc1),
	.event_int(adc2_sysref_error),
	.rst(wclr2_adc2)
);

wire rst_block002;
rst reset002(clk_120_adc1,rst_block002);

Block_read_spi_v2 
 #(16,60) spi_error_adc2(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						 .miso(xSPI3_MISO13)  ,.cs(xCS_FPGA1)  ,.rst(rst_block002),
						 .clr(wclr1_adc2),           .inport (error_adc2));
 Block_read_spi_v2 
 #(16,61) spi_error_sysref_adc2(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						      .miso(xSPI3_MISO14)  ,.cs(xCS_FPGA1)  ,.rst(rst_block002),
						      .clr(wclr2_adc2),      .inport (error_sysref_adc2));
  Block_read_spi_v2 
 #(8,65) spi_walign_adc2(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						      .miso(xSPI3_MISO15)  ,.cs(xCS_FPGA1)  ,.rst(rst_block002),
						      .clr(wclr3_adc2),      .inport (walign2_tst));
//-------------------------------------------------
Block_read_spi 
 #(32,50) spi_custom_phy_reg1_adc2( .clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO16),
 .cs(xCS_FPGA1) ,.rst(rst_block002) ,
	.inport
		 ({
		 xrx_runningdisp_adc2[7:0],
		       xrx_datak_adc2[7:0],
		     xrx_disperr_adc2[7:0],
		   xrx_errdetect_adc2[7:0]		   
			}));

Block_read_spi_v2 
 #(64,53) spi_custom_phy_reg4_adc2(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO17)  ,.cs(xCS_FPGA1)  ,.rst(rst_block002),
						 .clr(),           .inport (adc_data_tst1_2));
 Block_read_spi_v2 
 #(64,56) spi_custom_phy_reg5_adc2(.clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO18)  ,.cs(xCS_FPGA1)  ,.rst(rst_block002),
						 .clr(tst_adc2),           .inport (adc_data_tst2_2));

		 
Block_read_spi 
 #(24,54) spi_custom_phy_reg6_adc2( .clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO19),
 .cs(xCS_FPGA1) ,.rst(rst_block002) ,
	.inport
		 ({1'b0,
		 	w2_ok0,
	  	 xrx_ready_adc2,		  
		 sync_n_adc2,
		 locked_120,
		 xrx_patterndetect_adc2[7:0],
		 xrx_syncstatus_adc2[7:0]		 
			}));
			
Block_read_spi 
 #(24,55) spi_custom_phy_reg7_adc2( .clk(clk_120_adc1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO20),
 .cs(xCS_FPGA1) ,.rst(rst_block002) ,
	.inport
		 ({4'b0000,
	  	 rx_bitslipboundaryselectout_adc2[19:0]		 
			}));			
//--------------------------------------
wire        xSYSREF0;
bufi1	bufi1_inst2 (
	.datain ( SYSREF0 ),
	.dataout ( xSYSREF0 )
	);

//------------------Синхронизатор1--------------------

logic 		 w_REQ_COMM 	;
logic [63:0] TIME 			;
logic [47:0] FREQ     		;
logic [47:0] FREQ_STEP 		;
logic [31:0] FREQ_RATE 		;
logic [63:0] TIME_START		;
logic [63:0] TIME_INIT		;
logic 		 SYS_TIME_UPDATE;
logic 		 T1HZ 			;
logic 		 spi_WR 		;//сигнал записи данных из вне в реестр реального времени
logic 		 mem_WR			;//сигнал записи данных из реестра реального времени в синхронизатор
logic [15:0] N_impuls 		;
logic [ 1:0] TYPE_impulse 	;
logic [31:0] Interval_Ti 	;
logic [31:0] Interval_Tp 	;
logic [31:0] Tblank1 		;
logic [31:0] Tblank2 		;

//----------------------------
// вайры для между реестра и синхронизатора
logic [47:0] mFREQ     		;
logic [47:0] mFREQ_STEP 	;
logic [31:0] mFREQ_RATE 	;
logic [63:0] mTIME_START	;
logic [15:0] mN_impuls 		;
logic [ 1:0] mTYPE_impulse 	;
logic [31:0] mInterval_Ti 	;
logic [31:0] mInterval_Tp 	;
logic [31:0] mTblank1 		;
logic [31:0] mTblank2 		;

//----------------------------

logic [47:0] 	wFREQ 		;
logic [47:0] 	wFREQ_STEP 	;
logic [31:0] 	wFREQ_RATE	;
logic 			DDS_START 	;

logic [15:0] dds_data_I;
logic [15:0] dds_data_Q;
logic 		 dds_valid ;

logic 		SYS_TIME_UPDATE_OK;
logic 		En_Iz;
logic 		En_Pr;

logic wREQ=0;
logic wACK=0;

//----------DDS тактируется 96 МГц !!!---------------------------

logic [15:0] data_I;
logic [15:0] data_Q;

dds_chirp 
dds1(
	.clk_96 		(clk_96_dac1),    	// Clock
	.clk_48 		(clk_48_1 	),
	.REQ			(wREQ		),  	//запрос на передачу данных из 125 МГц в 96 МГц
    .ACK			(wACK		),		//подтверждение что данные переданы
	.DDS_freq 		(wFREQ 		),
	.DDS_delta_freq (wFREQ_STEP ),
	.DDS_delta_rate (wFREQ_RATE ),
	.start 			(DDS_START 	),
	.data_I 		(data_I 	),
	.data_Q 		(data_Q 	),
	.valid 			(dds_valid 	)	
);

//-------------Синхронизатор тактируется 48 МГц !!!-------------

rst reset_sync1_1(clk_48_1,rst_sync1);
test_t1hz inst_test_t1hz (.clk(clk_48_1), .z(T1HZ));//временная тестовая имитация квазисекундной метки (67/48)

master_start 
sync1(
.DDS_freq 			(wFREQ 				),
.DDS_delta_freq 	(wFREQ_STEP 		),
.DDS_delta_rate 	(wFREQ_RATE 		),
.DDS_start 			(DDS_START 			),
.REQ				(wREQ				),	//запрос на передачу данных
.ACK				(wACK				),  //подтверждение принятых данных из DDS
.REQ_COMMAND 		(w_REQ_COMM 		),  //запрос новой команды из реестра реального времени
.RESET 				(rst_sync1			),
.CLK 				(clk_48_1 			),
.SYS_TIME 			(tmp_TIME			),	//код времени для предустановки по сигналу T1c
.SYS_TIME_UPDATE 	(SYS_TIME_UPDATE 	),	//сигнал управления который включает готовность установки системного времени по сигналу T1hz 
.TIME 				(TIME 				),
.T1hz 				(T1HZ 				),	//сигнал секундной метки
.WR_DATA 			(mem_WR 			),  //сигнал записи данных в синхронизатор
.MEM_DDS_freq 		(mFREQ 				),  //данные команды из реестра реального времени
.MEM_DDS_delta_freq (mFREQ_STEP  		),  //данные команды из реестра реального времени
.MEM_DDS_delta_rate (mFREQ_RATE			),  //данные команды из реестра реального времени
.MEM_TIME_START 	(mTIME_START 		),  //данные команды из реестра реального времени
.MEM_N_impuls 		(mN_impuls 			),  //данные команды из реестра реального времени
.MEM_TYPE_impulse 	(mTYPE_impulse   	),  //тип формируемой пачки  :0 - повторяющаяся (некогерентный),1 - когерентная (DDS не перепрограммируется)
.MEM_Interval_Ti 	(mInterval_Ti 		),  //данные команды из реестра реального времени
.MEM_Interval_Tp 	(mInterval_Tp 		),  //данные команды из реестра реального времени
.MEM_Tblank1		(mTblank1 			),  //данные команды из реестра реального времени
.MEM_Tblank2 		(mTblank2 			),  //данные команды из реестра реального времени
.SYS_TIME_UPDATE_OK (SYS_TIME_UPDATE_OK ),	//флаг показывающий,что по секундной метке произошла установка системного времени
.En_Iz 				(En_Iz 				),  //сформированый интервал Излучения
.En_Pr 				(En_Pr 				)   //сформированый интервал Приёма
);

assign xFPGA_LED1_3V3=En_Iz;//тестовый вывод на HL10


rst reset_wcm1_1(clk_48_1,rst_wcm1);

wcm 
wcm1(						  		  //блок записи и чтения команд реального времени в память и из.
.CLK 		    (clk_48_1),
.rst_n 	        (~rst_wcm1),
.REQ_COMM 	    (w_REQ_COMM   		),//запрос новой команды для исполнения синхронизатором (тут вход)
.TIME 		    (TIME 		 		),//текущее системное время 
.SYS_TIME_UPDATE(SYS_TIME_UPDATE_OK	),//сигнал сообщающий о перестановке системного времени!!!
.FREQ           (tmp_FREQ 		 	),//данные с интерфейса МК
.FREQ_STEP      (tmp_FREQ_STEP 	 	),//----------------------
.FREQ_RATE      (tmp_FREQ_RATE 	 	),//--------//------------ 
.TIME_START     (tmp_TIME_START  	),
.N_impulse 	    (tmp_N_impuls 		),
.TYPE_impulse   (tmp_TYPE_impulse	),
.Interval_Ti    (tmp_Interval_Ti 	),
.Interval_Tp    (tmp_Interval_Tp 	),
.Tblank1 	    (tmp_Tblank1 	 	),
.Tblank2        (tmp_Tblank2 	 	),
.SPI_WR		    (spi_WR 		 	),  //сигнал записи для данных из вне в реестр реального времени
.DATA_WR 	    (mem_WR		 		),  //сигнал записи для передачи данных в блок синхронизации
.FREQ_z         (mFREQ 		 		),  //части команды выводимые из модуля в блок синхронизации и исполнения
.FREQ_STEP_z    (mFREQ_STEP 	 	),
.FREQ_RATE_z    (mFREQ_RATE 	 	),
.TIME_START_z   (mTIME_START	 	),
.N_impuls_z     (mN_impuls 	 		),
.TYPE_impulse_z (mTYPE_impulse		),
.Interval_Ti_z  (mInterval_Ti 		),
.Interval_Tp_z  (mInterval_Tp 		),
.Tblank1_z      (mTblank1 	 		),
.Tblank2_z      (mTblank2 	 		) //-----//-------	 
);

//----------------SPI управление-----------------
logic [ 63:0]	 tmp_TIME 		  ;
logic [ 47:0] 	 tmp_FREQ 		  ;
logic [ 47:0] 	 tmp_FREQ_STEP 	  ;
logic [ 31:0] 	 tmp_FREQ_RATE	  ;
logic [ 63:0]    tmp_TIME_START   ;
logic [ 15:0]    tmp_N_impulse    ;
logic [  7:0]    tmp_TYPE_impulse ;
logic [ 31:0]    tmp_Interval_Ti  ;
logic [ 31:0]    tmp_Interval_Tp  ;
logic [ 31:0]    tmp_Tblank1	  ;
logic [ 31:0]    tmp_Tblank2	  ;
	
rst reset_spi1_1(clk_48_1,rst_spi1);

assign TYPE_impulse=tmp_TYPE_impulse[1:0];//используем два младших бита как тип импульсов

assign xSPI4_SCK_MK =SPI4_SCK_MK ;
assign xSPI4_NSS_MK =SPI4_NSS_MK ;
assign xSPI4_MOSI_MK=SPI4_MOSI_MK;

DMA_SPI 
spi1
		(
			.clk             (clk_48_1),
			.clk_en          (1),
			.rst_n           (~rst_spi1),
			.MOSI            (xSPI4_MOSI_MK),
			.CS              (xSPI4_NSS_MK ),
			.SCLK            (xSPI4_SCK_MK ),

			.TIME            (tmp_TIME),
			.SYS_TIME_UPDATE (SYS_TIME_UPDATE),
			.FREQ            (tmp_FREQ),
			.FREQ_STEP       (tmp_FREQ_STEP),
			.FREQ_RATE       (tmp_FREQ_RATE),
			.TIME_START      (tmp_TIME_START),
			.N_impulse       (tmp_N_impulse),
			.TYPE_impulse    (tmp_TYPE_impulse),
			.Interval_Ti     (tmp_Interval_Ti),//интервал измеряется в 1/48 МГц - еденицах
			.Interval_Tp     (tmp_Interval_Tp),
			.Tblank1         (tmp_Tblank1),
			.Tblank2         (tmp_Tblank2),

			.SPI_WR          (spi_WR)
		);
//---------------------тестовый вывод на уарт-----------------
logic [407:0] test_data;
logic [  7:0]  DATA_out;
logic 		   TxD_busy;	 
logic 		   SEND;

rst reset_u1_1(clk_48_1,rst_uart1);


assign test_data={tmp_TIME       ,tmp_FREQ     ,tmp_FREQ_STEP   ,tmp_FREQ_RATE  ,
					  tmp_TIME_START ,tmp_N_impulse,tmp_TYPE_impulse,tmp_Interval_Ti,
					  tmp_Interval_Tp,tmp_Tblank1  ,tmp_Tblank2};

send_to_uart tst_u1
		(
			.clk      (clk_48_1),
			.rst_n    (~rst_uart1),
			.data_in  (test_data),//
			.RCV      (spi_WR),
			.BUSY     (TxD_busy),
			.DATA_out (DATA_out),
			.SEND     (SEND)
		);

logic TxD_test;

async_transmitter #(
			.ClkFrequency(48000000),
			.Baud		 (9600    )
		) tx1 (
			.clk       (clk_48_1),
			.TxD_start (SEND),
			.TxD_data  (DATA_out),
			.TxD       (TxD_test),
			.TxD_busy  (TxD_busy)
		);

 Block_read_spi_v2 
 #(64,49) spi_test_sync(.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO27)  ,.cs(xCS_FPGA1)  ,.rst(0),
						 .clr(),           .inport (tmp_TIME)); //чтение test
//---------------------JESD204b_dac1--------------------------		 

wire 			 dac1_phy_mgmt_clk;
wire 			 dac1_phy_mgmt_clk_reset;
wire [8:0]   dac1_phy_mgmt_address;
wire 			 dac1_phy_mgmt_read;
wire [31:0]  dac1_phy_mgmt_readdata;
wire 			 dac1_phy_mgmt_waitrequest;
wire 			 dac1_phy_mgmt_write;
wire [31:0]  dac1_phy_mgmt_writedata;

wire         dac1_tx_ready;
wire [ 1:0]  dac1_tx_serial_data;
wire         dac1_pll_locked;
wire [ 1:0]  dac1_tx_clkout;

wire [ 3:0]  dac1_tx_datak;
wire [ 3:0]  dac1_tx_dispval;
wire [ 3:0]  dac1_tx_forcedisp;
wire [183:0] dac1_reconfig_from_xcvr;
wire [279:0] dac1_reconfig_to_xcvr;

wire [31:0] dac1_tx_parallel_data_alias;
wire [31:0] dac1_tx_parallel_data;
wire [ 3:0] dac1_datak_align;
wire JESD_DAC1_sync_n;

assign  JESD_DAC1_sync_n=xD1_SYNCB;//&xD1_SYNC_N_AB&xD1_SYNC_N_CD
assign  xD1_ALARM_FPGA=JESD_DAC1_sync_n;//выводим сигнал sync_n на прерывание для МК


wire wclr1;
wire wclr2;
wire [15:0] err_data1;
wire [15:0] err_data2;

error_sch  
error1 
 (
  	.out(err_data1),
	.clk(clk_125),
	.event_int(xD1_ALARM),
	.rst(wclr1)
);

error_sch  
error2 
 (
  	.out(err_data2),
	.clk(clk_125),
	.event_int(~JESD_DAC1_sync_n),
	.rst(wclr2)
);

wire rst_block004;
rst reset004(clk_125,rst_block004);

Block_read_spi_v2 
 #(16,70) spi_error_dac1(.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						 .miso(xSPI3_MISO11)  ,.cs(xCS_FPGA1)  ,.rst(rst_block004),
						 .clr(wclr1),           .inport (err_data1));
Block_read_spi_v2 
 #(16,71) spi_error_dac2(.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						 .miso(xSPI3_MISO12)  ,.cs(xCS_FPGA1)  ,.rst(rst_block004),
						 .clr(wclr2),           .inport (err_data2));

wire [31:0] data_dac;
wire [15:0] tst_data;

//----------------DAC1---------------------------------		 

//assign data_DAC0_i=data_I;
//assign data_DAC0_q=data_Q;

wire [15:0] temp_data_q;
wire [15:0] temp_data_i;

assign temp_data_q={data_I[7:0],data_I[15:8]};
assign temp_data_i={data_Q[7:0],data_Q[15:8]};

//    15-01-19		 
sync_align_ila #(32,4)
sa_ila(
	.dout   (dac1_tx_parallel_data_alias),
	.txdatak(dac1_datak_align),
	.clk    (clk_96_dac1),
	.sstatus(JESD_DAC1_sync_n),
	.sysref (SYSREF0),
	.data   ({temp_data_q,temp_data_i})
	
);	
	

custom_phy_dac
dac1
(
		.phy_mgmt_clk                (clk_125),         //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset          (dac1_phy_mgmt_clk_reset),   // phy_mgmt_clk_reset.reset
		.phy_mgmt_address            (dac1_phy_mgmt_address),     //           phy_mgmt.address
		.phy_mgmt_read               (dac1_phy_mgmt_read),        //                   .read
		.phy_mgmt_readdata           (dac1_phy_mgmt_readdata),    //                   .readdata
		.phy_mgmt_waitrequest        (dac1_phy_mgmt_waitrequest), //                   .waitrequest
		.phy_mgmt_write              (dac1_phy_mgmt_write),       //                   .write
		.phy_mgmt_writedata          (dac1_phy_mgmt_writedata),   //                   .writedata
		.tx_ready                    (dac1_tx_ready),             //           tx_ready.export
		.pll_ref_clk                 (clk_96_dac1),          //        pll_ref_clk.clk clk_96Mhz
		.tx_serial_data              ({D1_RX1,D1_RX0}),       //     tx_serial_data.export
		.pll_locked                  (dac1_pll_locked),           //         pll_locked.export
		.tx_clkout                   (dac1_tx_clkout),            //          tx_clkout.export
		.tx_parallel_data            (dac1_tx_parallel_data_alias),     //   tx_parallel_data.export
		.tx_datak                    (dac1_datak_align),             //           tx_datak.export
		.reconfig_from_xcvr          (),   // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr            ()     //   reconfig_to_xcvr.reconfig_to_xcvr
	);

wire rst_block005;
rst reset005(clk_96_dac1,rst_block005);
	
Block_read_spi 
 #(8,40) spi_custom_phy_dac1( .clk(clk_96_dac1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO10),
 .cs(xCS_FPGA1) ,.rst(rst_block005) ,
	.inport
		 ({
		   locked_dac1,
		   dac1_pll_locked,
		   dac1_tx_ready,
		   JESD_DAC1_sync_n,
				1'b0,   //dac1_datak_align[3]
				1'b0,   //dac1_datak_align[2] 
				1'b0,   //dac1_datak_align[1]
				1'b0}   //dac1_datak_align[0] 
			) );
			
Block_write_spi 
 #(32,41) spi_wr_custom_phy_dac1( .clk(clk_96_dac1),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),
 .cs(xCS_FPGA1) ,.rst(rst_block005) ,
	.out
		 (dac1_tx_parallel_data));
	
			
			
//---------------------JESD204b_dac2--------------------------	
	 

wire 			 dac2_phy_mgmt_clk;
wire 			 dac2_phy_mgmt_clk_reset;
wire [8:0]   dac2_phy_mgmt_address;
wire 			 dac2_phy_mgmt_read;
wire [31:0]  dac2_phy_mgmt_readdata;
wire 			 dac2_phy_mgmt_waitrequest;
wire 			 dac2_phy_mgmt_write;
wire [31:0]  dac2_phy_mgmt_writedata;

wire         dac2_tx_ready;
wire [ 1:0]  dac2_tx_serial_data;
wire         dac2_pll_locked;
wire [ 1:0]  dac2_tx_clkout;

wire [ 3:0]  dac2_tx_datak;
wire [ 3:0]  dac2_tx_dispval;
wire [ 3:0]  dac2_tx_forcedisp;
wire [183:0] dac2_reconfig_from_xcvr;
wire [279:0] dac2_reconfig_to_xcvr;



wire [31:0] dac2_tx_parallel_data_alias;
wire [31:0] dac2_tx_parallel_data;
wire [ 3:0] dac2_datak_align;
wire JESD_DAC2_sync_n;

assign  JESD_DAC2_sync_n=xD2_SYNCB;//&xD1_SYNC_N_AB&xD1_SYNC_N_CD
assign  xD2_ALARM_FPGA=JESD_DAC2_sync_n;//выводим сигнал sync_n на прерывание для МК


wire wclr1_D2;
wire wclr2_D2;
wire [15:0] err_data1_D2;
wire [15:0] err_data2_D2;

error_sch  
error1_D2 
 (
  	.out(err_data1_D2),
	.clk(clk_125),
	.event_int(xD2_ALARM),
	.rst(wclr1_D2)
);

error_sch  
error2_D2 
 (
  	.out(err_data2_D2),
	.clk(clk_125),
	.event_int(~JESD_DAC2_sync_n),
	.rst(wclr2_D2)
);

wire rst_block006;
rst reset006(clk_125,rst_block006);

Block_read_spi_v2 
 #(16,72) spi_error_dac1_D2(.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						 .miso(xSPI3_MISO23)  ,.cs(xCS_FPGA1)  ,.rst(rst_block006),
						 .clr(wclr1_D2),           .inport (err_data1_D2));
Block_read_spi_v2 
 #(16,73) spi_error_dac2_D2(.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),
						 .miso(xSPI3_MISO24)  ,.cs(xCS_FPGA1)  ,.rst(rst_block006),
						 .clr(wclr2_D2),           .inport (err_data2_D2));

wire [31:0] data_dac2;
wire [15:0] tst_data_D2;

//--------------------------------------

//assign data_DAC1_i=data_I;
//assign data_DAC1_q=data_Q;

wire [15:0] D2_temp_data_q;
wire [15:0] D2_temp_data_i;

assign D2_temp_data_q={data_Q[7:0],data_Q[15:8]};
assign D2_temp_data_i={data_I[7:0],data_I[15:8]};


//    15-01-19		 
sync_align_ila #(32,4)
sa_ila_D2(
	.dout   (dac2_tx_parallel_data_alias),
	.txdatak(dac2_datak_align),
	.clk    (clk_96_dac2),
	.sstatus(JESD_DAC2_sync_n),
	.sysref (SYSREF0),
	.data   ({D2_temp_data_q,D2_temp_data_i})
	
);	
	

custom_phy_dac
dac2
(
		.phy_mgmt_clk                (clk_125),         //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset          (dac2_phy_mgmt_clk_reset),   // phy_mgmt_clk_reset.reset
		.phy_mgmt_address            (dac2_phy_mgmt_address),     //           phy_mgmt.address
		.phy_mgmt_read               (dac2_phy_mgmt_read),        //                   .read
		.phy_mgmt_readdata           (dac2_phy_mgmt_readdata),    //                   .readdata
		.phy_mgmt_waitrequest        (dac2_phy_mgmt_waitrequest), //                   .waitrequest
		.phy_mgmt_write              (dac2_phy_mgmt_write),       //                   .write
		.phy_mgmt_writedata          (dac2_phy_mgmt_writedata),   //                   .writedata
		.tx_ready                    (dac2_tx_ready),             //           tx_ready.export
		.pll_ref_clk                 (clk_96_dac2),          //        pll_ref_clk.clk
		.tx_serial_data              ({D2_RX1,D2_RX0}),       //     tx_serial_data.export
		.pll_locked                  (dac2_pll_locked),           //         pll_locked.export
		.tx_clkout                   (dac2_tx_clkout),            //          tx_clkout.export
		.tx_parallel_data            (dac2_tx_parallel_data_alias),     //   tx_parallel_data.export
		.tx_datak                    (dac2_datak_align),             //           tx_datak.export
		.reconfig_from_xcvr          (),   // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr            ()     //   reconfig_to_xcvr.reconfig_to_xcvr
	);

wire rst_block007;
rst reset007(clk_96_dac2,rst_block007);
	
Block_read_spi 
 #(8,42) spi_custom_phy_dac2_D2( .clk(clk_96_dac2),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO25),.cs(xCS_FPGA1) ,.rst(rst_block007) ,
	.inport
		 ({
		   locked_dac2,
		   dac2_pll_locked,
		   dac2_tx_ready,
		   JESD_DAC2_sync_n,
		   1'b0,					//dac2_datak_align[3]
		   1'b0,  					//dac2_datak_align[2] 
		   1'b0,					//dac2_datak_align[1]
		   1'b0} 					//dac2_datak_align[0] 
			) );
			
Block_write_spi 
 #(32,43) spi_wr_custom_phy_dac1_D2( .clk(clk_96_dac2),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA1) ,.rst(rst_block007) ,
	.out
		 (dac2_tx_parallel_data));		
		
//-------------------ETH1----------------------------

reg [7:0] sch_time=0;
reg o1=0;
reg o2=0;
always @(posedge clk_240_adc1)
begin
if (sch_time!=19) sch_time<=sch_time+1; else sch_time<=0; 
if (sch_time <10) 
	begin
	o1<=1;
	o2<=1;
	end 
		else 
			begin
			o1<=0;
			o2<=0;
			end
end

wire rst_block_eth1;
rst reset_ETH1(clk_125,rst_block_eth1);

eth_1g_top //MAC0
#(
	18,//чтение 32 бит служебных данных из памяти UDP ресивера 
	17,//чтение 32 бит данных из памяти UDP ресивера 
	16,//запись адреса памяти для чтения,управление чтением пакета из фифо МАС
	15,//управление потоком в MAC 1 - вкл , 0 - выкл
	13,//записываем адресс чтения/записи (пишется первым)
	12,//запись в МАС данных
	14,//чтение 32 бит данных
	9, //чтение 32 бит данных TEST
	10,//32 записываем команду в блок i2c в формате: {<w/r>[6:0][7:0]}
	11,//24 записываем команду в блок i2c в формате: {<w/r>[6:0][7:0]}
	34,//адресс чтения памяти UDP
	37,//данные чтения из памяти UDP
	38,//адресс МЕМ3
	39,//данные МЕМ3
	44,//crc    MEM3
	21,//адрес по которому записываем наш IP и наш порт {32'ip,16'port}
	45,//адрес по которому записываем наш номер ПОРТа и ПОРТ абанента (dest)	{16'PORT_my,16'PORT_dest}
	46 //адрес по которому записываем MAC адрес в корку ETH
	)
eth1(
	.data_1ch(data_test),//data_dsp_adc0_0 
	.data_2ch(data_test),//data_dsp_adc0_1 
	.wr_data_1ch(wr_en),//dsp0_0_valid 
	.wr_data_2ch(wr_en),//dsp0_1_valid 
	.wrclk(clk_240_adc1),//входной клок!!!!
	.clk_12(o1),//этот не клок  а тактовый сигнал для часов
	.clk_125  (clk_125),
	.clk_125_eth(clk_125_eth0),//ref для трансивера
	.reset_all(rst_block_eth1),
	.xCS_FPGA1(xCS_FPGA1),
	.xSPI3_SCK(xSPI3_SCK),
	.xSPI3_MOSI(xSPI3_MOSI),
	.xSPI3_MISO(xSPI3_MISO9),
	.RX_GTP(RX_GTP),
	.TX_GTP(TX_GTP),
	.SDATA1_I2C(SDATA1_I2C),
	.SCLK1_I2C(SCLK1_I2C),
	.SFP1_TX_FAULT(SFP1_TX_FAULT),
	.SFP1_PRESENT(SFP1_PRESENT),
	.SFP1_LOS(SFP1_LOS),
	.RATE1_SELECTION(RATE1_SELECTION),
	.SFP1_TX_DISABLE(SFP1_TX_DISABLE),
	.INT_MK(xINT1_FPGA)//прерывание на мк!!!
	);

//--------------------------------------
wire [31:0] data_test; 
wire [15:0]	d_gen;
wire wr_en;

assign 	data_test = {16'h0000,d_gen};

test_gen 
tst1(
.clk(clk_240_adc1),
.q(d_gen) ,
.wr() ,
.clk12() );	

//-------------------------------------

wire rst_block_eth2;
rst reset_ETH2(clk_125,rst_block_eth2);

eth_1g_top //MAC1
#(
	126,//чтение 32 бит служебных данных из памяти UDP ресивера 
	125,//чтение 32 бит данных из памяти UDP ресивера 
	124,//запись адреса памяти для чтения,управление чтением пакета из фифо МАС
	123,//управление потоком в MAC 1 - вкл , 0 - выкл
	122,//записываем адресс чтения/записи (пишется первым)
	121,//запись в МАС данных
	120,//чтение 32 бит данных
	119, //чтение 32 бит данных TEST
	118,//32 записываем команду в блок i2c в формате: {<w/r>[6:0][7:0]}
	117,//24 записываем команду в блок i2c в формате: {<w/r>[6:0][7:0]}
	116,//адресс чтения памяти UDP
	115,//данные чтения из памяти UDP
	108,//адресс МЕМ3
	102,//данные МЕМ3
	101,//crc    MEM3
	22, //адрес по которому записываем наш IP и наш порт 						{32'ip_my  ,32'ip_dest}
	23,	//адрес по которому записываем наш номер ПОРТа и ПОРТ абанента (dest)	{16'PORT_my,16'PORT_dest}
	47  //адрес по которому записываем MAC адрес в корку ETH
	)
eth2(
	.data_1ch(data_test),	//data_dsp_adc1_0 
	.data_2ch(data_test),	//data_dsp_adc1_1 
	.wr_data_1ch(wr_en),	//dsp1_0_valid 
	.wr_data_2ch(wr_en),	//dsp1_1_valid 
	.wrclk(clk_240_adc1),	//входной клок!!!!
	.clk_12(o2),			//этот не клок  а тактовый сигнал для часов
	.clk_125  (clk_125),
	.clk_125_eth(clk_125_eth1),//ref для трансивера
	.reset_all(rst_block_eth2),
	.xCS_FPGA1(xCS_FPGA1),
	.xSPI3_SCK(xSPI3_SCK),
	.xSPI3_MOSI(xSPI3_MOSI),
	.xSPI3_MISO(xSPI3_MISO21),
	.RX_GTP(RX2_GTP),
	.TX_GTP(TX2_GTP),
	.SDATA1_I2C(SDATA2_I2C),
	.SCLK1_I2C(SCLK2_I2C),
	.SFP1_TX_FAULT(SFP2_TX_FAULT),
	.SFP1_PRESENT(SFP2_PRESENT),
	.SFP1_LOS(SFP2_LOS),
	.RATE1_SELECTION(RATE2_SELECTION),
	.SFP1_TX_DISABLE(SFP2_TX_DISABLE),
	.INT_MK(xWDATA_MK2)
	);
	
//-----------------------------------------------
//sdram

wire rst_sdram;

rst rst_sdr(clk_125 ,rst_sdram);//clk_125

wire w_rd_req;
wire w_wr_req;
wire w_read_valid;
wire w_write_valid;
wire w_ready;

wire [12:0]           sdr_addr           ; // SDRAM ADRESS
wire [15:0]           Dq                 ; // SDRAM Read/Write Data Bus
wire 		sdram_buf_we;
wire [15:0] w_data_to_sdram;
wire [15:0] w_data_from_sdram;
wire [24:0] w_adr_sdram;
wire [15:0] sdram_data_o;

wire [1:0] w_sdram_ba;

wire w_scke;
wire w_sms;
wire w_sras;
wire w_scas;
wire w_swe;
wire [1:0] w_abe;


sdram_cntr
#(
     .SDRAM_ROW_WIDTH_BIT(13),
     .SDRAM_COL_WIDTH_BIT(10),
	 .SDRAM_BANK_WIDTH_BIT(2),
	 .SDRAM_DATA_WIDTH_BIT(16),
	 .SDRAM_CAS(3),
	 .tPOWERUP(16'd14285),
	 .tREF(64),
	 .tREF_COUNT(8192),
	 .tCK(8)
	 
)
SDRAM_CNTR0
(
     .i_clk                         (clk_125   ),
	 // interface for manager RAM
	 .i_ram_data					(w_data_to_sdram),//
	 .o_ram_data					(w_data_from_sdram),
	 .i_ram_addr					(w_adr_sdram),
	 .i_ram_len						(8           ),//работаем бурстом по 8 слов!!!
	 .i_ram_read_req				(w_rd_req    ),
	 .o_ram_read_valid				(w_read_valid),
	 .i_ram_write_req				(w_wr_req    ),
	 .o_ram_write_valid				(w_write_valid),
	 .o_ready						(w_ready     ),
	 // interface for SDRAM
	 .i_sdram_data					({D15,D14,D13,D12,D11,D10,D9,D8,D7,D6,D5,D4,D3,D2,D1,D0}),
	 .o_sdram_data					(sdram_data_o),
	 .o_sdram_addr					(sdr_addr    ),

//	 .o_sdram_clk(       o_sdram_clk        ),
//	 .o_sdram_clk(       o_sys_clk          ),

	 .o_sdram_cke					(w_scke),//SCKE
	 .o_sdram_cs_l					(w_sms ),//SMS
	 .o_sdram_ras_l					(w_sras),//SRAS
	 .o_sdram_cas_l					(w_scas),//SCAS
	 .o_sdram_we_l					(w_swe ),//SWE
	 .o_sdram_buf_we				(sdram_buf_we),
	 .o_sdram_ba  					(w_sdram_ba),
	 .o_sdram_dqml					(w_abe[0]),//ABE0
	 .o_sdram_dqmh					(w_abe[1]) //ABE1
);

reg test_1=0;
//always @(posedge clk_250) test_1<=A1;

assign {D15,D14,D13,D12,D11,D10,D9,D8,D7,D6,D5,D4,D3,D2,D1,D0} = sdram_buf_we ? sdram_data_o : 16'hz;
assign {A13,A12,SA10,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1}           = sdr_addr;
assign {A19,A18} = w_sdram_ba;
assign SCKE = w_scke;
assign SMS  = w_sms;
assign SRAS = w_sras;
assign SCAS = w_scas;
assign SWE  = w_swe;
assign ABE0 = w_abe[0];
assign ABE1 = w_abe[1];

//assign xFPGA_LED1_3V3=0;
assign CLK_OUT=clk_125_n;//clk_125_90 clk_125_n


wire [15:0] data_from_mem_to_contr;
wire [15:0] data_sdram_to_mem;
wire [9:0]  adr_mem_wr;
wire [9:0]  adr_mem_rd;

wire w_wr;
wire w_rd;

wire [31:0] w_ADR_read_MEM;
wire [15:0] w_DATA_from_MEM;

wire w_write_imp;
wire [24:0] w_adr_wr;


sdram_mk_upr 
u1( 
	.ready          (w_ready),//
	.clk            (clk_125),
	.data_from_mem  (data_from_mem_to_contr),//data_from_mem_to_contr
	.adr_mem_read   (adr_mem_rd),
	.adr_mem_write  (adr_mem_wr),
	.data_to_mem    (data_sdram_to_mem),
	.data_to_sdram  (w_data_to_sdram),
	.data_from_sdram(w_data_from_sdram),
	.adr_sdram      (w_adr_sdram),
	.adr_from_mk    (w_ADR_read_MEM[24:0]),
	.adr_from_mk_wr (w_ADR_read_MEM[24:0]),
	.wr_req         (w_wr_req),
	.rd_req         (w_rd_req),
	.wr_valid       (w_write_valid),
	.rd_valid       (w_read_valid),
	.wr_bus         (xWR_BUS),//сигнал записи в sdram от МК   xWR_BUS         
	.rd_bus         (xRD_BUS) //сигнал чтение из sdram в МЕМ           
	//--------------------
	 );

//assign OK_BUS = w_ready;

mem_for_sdram_v1 //MEM для скачивания данных из sdram в мк
m_rd(   //MEM for read
	.clock(clk_125),
	.data(data_sdram_to_mem),
	.rdaddress(w_ADR_read_MEM[9:0]),//
	.wraddress(adr_mem_wr),//
	.wren(1'b1),
	.q(w_DATA_from_MEM)
	);

wire [31:0] w_ADR_DATA;


mem_for_sdram_v1 //MEM для записи данных в sdram из мк
m_wr(   //MEM for write
	.clock    (clk_125),
	.data     (w_ADR_DATA[15:0]),//
	.rdaddress(adr_mem_rd),//
	.wraddress(w_ADR_DATA[31:16]),
	.wren     (w_wr),//
	.q        (data_from_mem_to_contr)//
	);

wire rst_block008;
rst reset008(clk_125,rst_block008);

//запись в промежуточную память МЕМ для пересылки оттуда в SDRAM , а ещё это адресс в sdram
Block_write_spi_mac //
 #(32,33) spi_test_sdram_wr(.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA2) ,.rst(rst_block008) ,
	.out (w_ADR_DATA),.wr(w_wr),.wtreq(0));

//чтение из промежуточной памяти МЕМ данных скачаных из SDRAM
Block_read_spi 
 #(16,32) spi_read_data_MEM (.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO22),.cs(xCS_FPGA2) ,.rst(rst_block008) ,
	.inport(w_DATA_from_MEM));//чтение данных 

Block_write_spi_mac //запись адреса в МЕМ откуда читаем слово данных, а ещё это адресс в sdram
 #(32,20) spi_adr_read_MEM  (.clk(clk_125),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(),.cs(xCS_FPGA2) ,.rst(rst_block008) ,
	.out (w_ADR_read_MEM),.wr(w_rd),.wtreq(0));



//-----DSP ADC2-----------

wire [31:0] data_dsp_adc0_0;
wire [31:0] data_dsp_adc0_1;
wire dsp0_0_valid;
wire dsp0_1_valid;

reg [15:0] reg_ch1_adc2_data=0;
reg [15:0] reg_ch0_adc2_data=0;

wire rst_00;
rst rst_dsp00(clk_240_adc1,rst_00);

always @(posedge clk_240_adc1) reg_ch1_adc2_data<=ch1_adc2_data;
/*
dsp_step1 
dsp0_0(
.clk(clk_240_adc1),//
.rst(rst_00),
.in(reg_ch1_adc2_data),//q_data
.data(data_dsp_adc0_0),
.valid(dsp0_0_valid)
);
*/
wire rst_01;
rst rst_dsp01(clk_240_adc1,rst_01);

always @(posedge clk_240_adc1) reg_ch0_adc2_data<=ch0_adc2_data;
/*
dsp_step1 
dsp0_1(
.clk(clk_240_adc1),//
.rst(rst_01),
.in(reg_ch0_adc2_data),//i_data
.data(data_dsp_adc0_1),
.valid(dsp0_1_valid)
);
*/
//-----NCO test-----------
/*
  parameter freq1=32'h53333333;//78 Mhz	 

wire [17:0] w_i_nco;
wire [17:0] w_q_nco;
wire nco_valid;

nco_test 
nco1 (
		.clk       (clk_240_adc1),       // clk.clk
		.reset_n   (~rst_dsp1),   // rst.reset_n
		.clken     (1'h1),     //  in.clken
		.phi_inc_i (freq1), //    .phi_inc_i
		.fsin_o    (w_i_nco),    // out.fsin_o
		.fcos_o    (w_q_nco),    //    .fcos_o
		.out_valid (nco_valid)  //    .out_valid
	);
*/
//-----DSP ADC1-----------

wire [31:0] data_dsp_adc1_0;
wire [31:0] data_dsp_adc1_1;
wire dsp1_0_valid;
wire dsp1_1_valid;

reg [15:0] reg_ch0_adc0_data=0;
reg [15:0] reg_ch1_adc0_data=0;


wire rst_10;
rst rst_dsp10(clk_240_adc1,rst_10);

always @(posedge clk_240_adc1) reg_ch0_adc0_data<=ch0_adc0_data;//w_i_nco[17:2];//
/*
dsp_step1 
dsp1_0(
.clk(clk_240_adc1),//
.rst(rst_10),
.in(reg_ch0_adc0_data),//
.data(data_dsp_adc1_0),
.valid(dsp1_0_valid)
);
*/
wire rst_11;
rst rst_dsp11(clk_240_adc1,rst_11);

always @(posedge clk_240_adc1) reg_ch1_adc0_data<=ch1_adc0_data;//w_q_nco[17:2];//
/*
dsp_step1 
dsp1_1(
.clk(clk_240_adc1),//
.rst(rst_11),
.in(reg_ch1_adc0_data),//i_data
.data(data_dsp_adc1_1),
.valid(dsp1_1_valid)
);
*/
//------------------timer 1 sec-----------------
reg signal_1sec;
reg [31:0] timer_1sec=0;
always @(posedge clk_125)
begin
if (timer_1sec!=62500000) 
begin
timer_1sec <=timer_1sec+1; 
end
else
	begin
	timer_1sec <=0;
	signal_1sec<=~signal_1sec;	
	end
end
//-----------------------------------------------
//-----------------------------------------------
endmodule


	
