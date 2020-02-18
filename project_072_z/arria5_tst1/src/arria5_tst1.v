
//synthesis_resources = arriav_io_ibuf 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on


module top_module(

		input wire clk_100MHZ,
		
//		input wire si570_clk,
		
		input wire REF3,
		
		input wire SYSREF0,
		
//		input wire SYSREF5,

//		input wire SYSREF6,	
	
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
	  
	  input wire D1_ALARM_FPGA,
	  input wire D2_ALARM_FPGA,
	  
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
	  
	  

	  
	  input wire [7:0] WDATA_MK, //шина 8 бит с МК
	  input wire OK_BUS,
	  input wire WR_BUS,
	  input wire RD_BUS,
	  
//--------------------------
	 output wire SPI4_SCK_MK,  //SPI где слейв МК  ,выдача данных с ПЛИС на МК
	 output wire SPI4_NSS_MK,
	 output wire SPI4_MOSI_MK,
	  input wire SPI4_MISO_MK,
	  
	  
  	 output wire SPI3_SCK,  //SPI где слейв ПЛИС
	 output wire SPI3_CS,
	 output wire SPI3_MISO,
	  input wire SPI3_MOSI,
	  
	  output wire SPI2_NSS_MK, 
	  
//-----------GTX---------------

	
	  input wire RX_GTP,

	  output wire TX_GTP,
	 
		
//	  input wire FPGA_F48MHZ,
	
	  
//	  input wire DCLK6,
	
	  
//	  input wire DCLK5,

	  
//	  input wire DCLK0,
	
	  

//	 output wire D2_RX0,
	 

//	 output wire D2_RX1,
	 

//	 output wire D1_RX0,
	 
	
//	 output wire D1_RX1,
	 
	 
//	  input wire A2_TX0,

	  
//	  input wire A2_TX1,

	  
//	  input wire A1_TX3,

	  
//	  input wire A1_TX2,

	  
//	  input wire A2_TX3,
	
	  
//	  input wire A2_TX2,
	
	  
//	  input wire A1_TX1,
	
	  
//	  input wire A1_TX0,
	
	 
	 
	  
//-----------DAC---------------
	  
	  output wire DAC_SYNC, //Сигнал идёт наружу кассеты к АЦ
	  
	  input wire D2_SYNCB,
	
	  
	  input wire D1_SYNCB,
	
	  
	  output wire D1_RESETB,
	  output wire D1_SCLK,
	  output wire D1_SDIO,
	  input  wire D1_SDO,
	  output wire D1_SDENB,
	  output wire D1_SLEEP,
	  output wire D1_SYNC_N_AB,
	  output wire D1_SYNC_N_CD,
	  output wire D1_TXENABLE,	 
	  input  wire D1_ALARM,
	 
	  
	  output wire D2_RESETB,
	  output wire D2_SCLK,
	  output wire D2_SDIO,
	  input  wire D2_SDO,
	  output wire D2_SDENB,
	  output wire D2_SLEEP,
	  output wire D2_SYNC_N_AB,
	  output wire D2_SYNC_N_CD,
	  output wire D2_TXENABLE,
	  input  wire D2_ALARM,
	  
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
	  output wire LMK_RESET_3V3,
	  output wire LMK_SCK_3V3,
	  output wire LMK_SDIO_3V3,
	  output wire LMK_CS_3V3,
	  output wire LMK_SYNC_3V3,
	  
//----------ONET----------------
	  
	  input wire ONET1_RX_LOS,
	  input wire ONET2_RX_LOS,
	  
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
//-------------------------------	  
	
	  
     output wire FPGA_LED1_3V3,
     output wire T_TEST1,
	  output wire T_TEST2
     );
	  
	  wire RX_GTP_o;
	  
	  wire clk_100MHZ_glob;
	  
	  wire reset_all;
	  
	  wire reset_125;
	  
	  wire clk_REF3_glob;
	  wire clk_125_pll;
	  
	  wire pll125_locked;
	  
  	  wire signal_wire0 = 1'b0;
	  wire signal_wire1 = 1'b0;
	
	  wire [15:0] rx_parallel_data_out = 16'd0;
	  wire [1:0]  rx_ctrldetect;
	  
	  wire xCE_MO;
	  wire xCLK_MO;
	  wire xD_MOSI;
	  wire xD_MISO;
	  wire xFPGA_SYNC1;
	  
	  
	
pll1 
pll1_inst1 (
		.refclk   (REF3),   //  refclk.clk
		.rst      (reset_all),      //   reset.reset
		.outclk_0 (clk_125_pll), // outclk0.clk
		.locked   (pll125_locked)    //  locked.export
	);
		  
	
		
	  
mypll 
u0 (
		.inclk  (clk_100MHZ),  //  altclkctrl_input.inclk
		.outclk (clk_100MHZ_glob)  // altclkctrl_output.outclk
				);

	  
	  rst rst1(clk_100MHZ_glob,reset_all);
	  rst rst2(clk_125_pll,reset_125);

	
	bufi3	bufi3_inst1 (
	.datain  ( { CE_MO, CLK_MO, D_MOSI} ),
	.dataout ( {xCE_MO,xCLK_MO,xD_MOSI} )
	);
	  
	buf_out1	buf_out1_inst3 (
	.datain ( xD_MISO ),
	.dataout ( D_MISO )
	);



	wire	 xKAN1_KONTROL;
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

buf_io1	buf_io1_inst (
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
	  
	   D1_ALARM_FPGA,
	   D2_ALARM_FPGA,
	
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
	  
	   xD1_ALARM_FPGA,
	   xD2_ALARM_FPGA,
	
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
	  wire [7:0] xWDATA_MK; 
	  wire xOK_BUS;
	  wire xWR_BUS;
	  wire xRD_BUS;
	
	
	bufin20	bufin20_inst (
	.datain ( 
	 {UART6_TX, 
	  UART1_TX, 	 
	  TX_FTDI_1,	 
	  TX_FTDI_2, 	 
	  BOOT_MK_FTDI,
	  RESET_MK_FTDI,	  
	  MR_RESET_MK_FPGA, 
	  BOOT_MK_FPGA,		 
	  WDATA_MK[7:0], 
	  OK_BUS,
	  WR_BUS,
	  RD_BUS}
	  ),
	.dataout (  
	 {xUART6_TX, 
	  xUART1_TX, 	 
	  xTX_FTDI_1,	 
	  xTX_FTDI_2, 	 
	  xBOOT_MK_FTDI,
	  xRESET_MK_FTDI,	  
	  xMR_RESET_MK_FPGA, 
	  xBOOT_MK_FPGA,		 
	  xWDATA_MK[7:0], 
	  xOK_BUS,
	  xWR_BUS,
	  xRD_BUS} )
	);

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
	 
	 bufout7	bufout7_inst (
	.datain ( 
	{xSPI4_SCK_MK,
	 xSPI4_NSS_MK,
	 xSPI4_MOSI_MK,
  	 xSPI3_SCK,
	 xSPI3_CS,
	 xSPI3_MISO,
	 xSPI2_NSS_MK} ),
	.dataout ( 
	{SPI4_SCK_MK,
	 SPI4_NSS_MK,
	 SPI4_MOSI_MK,
  	 SPI3_SCK,
	 SPI3_CS,
	 SPI3_MISO,
	 SPI2_NSS_MK}
	 )
	);
	
	
 wire xSPI4_MISO_MK;
 wire xSPI3_MOSI;
	
bufi1	bufi1_inst (
	.datain ( SPI4_MISO_MK ),
	.dataout ( xSPI4_MISO_MK )
	);
	
bufi1	bufi2_inst (
	.datain ( SPI3_MOSI ),
	.dataout ( xSPI3_MOSI )
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
	
bufout17	bufout17_inst (
	.datain ( 
	{ xDAC_SYNC,
	  xD1_RESETB,
	  xD1_SCLK,
	  xD1_SDO,
	  xD1_SDENB,
	  xD1_SLEEP,
	  xD1_SYNC_N_AB,
	  xD1_SYNC_N_CD,
	  xD1_TXENABLE,	 
	  xD2_RESETB,
	  xD2_SCLK,
	  xD2_SDO,
	  xD2_SDENB,
	  xD2_SLEEP,
	  xD2_SYNC_N_AB,
	  xD2_SYNC_N_CD,
	  xD2_TXENABLE} ),
	.dataout ( 
	{ DAC_SYNC,
	  D1_RESETB,
	  D1_SCLK,
	  D1_SDO,
	  D1_SDENB,
	  D1_SLEEP,
	  D1_SYNC_N_AB,
	  D1_SYNC_N_CD,
	  D1_TXENABLE,	 
	  D2_RESETB,
	  D2_SCLK,
	  D2_SDO,
	  D2_SDENB,
	  D2_SLEEP,
	  D2_SYNC_N_AB,
	  D2_SYNC_N_CD,
	  D2_TXENABLE}
	  )
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
	  
	   test_led tst_led1(clk_100MHZ_glob,xFPGA_LED1_3V3,xT_TEST1,xT_TEST2);
		
	bufout18	bufout18_inst (
	.datain (
	 {xLMK_SEL0_3V3,
	  xLMK_SEL1_3V3,
	  xLMK_RESET_3V3,
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
	  LMK_RESET_3V3,
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
	
wire xLMK_SDIO_3V3;
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
	


	
	 Block_upr_spi1 
 #(8,1) spi_att1( .clk(clk_125_pll),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO),.cs(xCS_FPGA1) ,.rst(reset_125) ,
	.out
		 ({xUPR_AT1_05,
			xUPR_AT1_1,
			xUPR_AT1_2,
			xUPR_AT1_4,
			xUPR_AT1_8,
			xUPR_AT1_16}
			) );		
	
 Block_upr_spi1 
 #(8,2) spi_att2( .clk(clk_125_pll),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO),.cs(xCS_FPGA1) ,.rst(reset_125) ,
	.out
		 ({xUPR_AT2_05,
			xUPR_AT2_1,
			xUPR_AT2_2,
			xUPR_AT2_4,
			xUPR_AT2_8,
			xUPR_AT2_16}
			) );

 Block_upr_spi1 
 #(8,3) spi_att3( .clk(clk_125_pll),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO),.cs(xCS_FPGA1) ,.rst(reset_125) ,
	.out
		 ({xUPR_AT3_05,
			xUPR_AT3_1,
			xUPR_AT3_2,
			xUPR_AT3_4,
			xUPR_AT3_8,
			xUPR_AT3_16}
			) );
			
 Block_upr_spi1 
 #(8,4) spi_att4( .clk(clk_125_pll),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO),.cs(xCS_FPGA1) ,.rst(reset_125) ,
	.out
		 ({xUPR_AT4_05,
			xUPR_AT4_1,
			xUPR_AT4_2,
			xUPR_AT4_4,
			xUPR_AT4_8,
			xUPR_AT4_16}
			) );
			
	
	 Block_upr_spi1 
 #(8,5) spi_upr1( .clk(clk_125_pll),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO),.cs(xCS_FPGA1) ,.rst(reset_125) ,
	.out
		 ({xUPR_SWITCH1,
			xUPR_SWITCH2,
			xUPR_SWITCH3,
			xUPR_SWITCH4,
			xREZERV1,
			xFPGA_IND1,  //индикация лицевой панели 2
			xFPGA_IND2}  //индикация лицевой панели 1
			) );
			
//-----------------------------контроль входных сигналов через SPI --------------------------------------------------

	 Block_control_spi 
 #(8,6) spi_control1( .clk(clk_125_pll),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO),.cs(xCS_FPGA1) ,.rst(reset_125) ,
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
			
	 Block_control_spi 
 #(8,7) spi_control2( .clk(clk_125_pll),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO),.cs(xCS_FPGA1) ,.rst(reset_125) ,
	.inport
		 ({xADDR0,
			xADDR1,
			xADDR2,
			xADDR3,
			xD1_ALARM_FPGA,
			xD2_ALARM_FPGA,
			xLMK_STATUS_LD1_3V3,  // 
			xLMK_STATUS_LD2_3V3}  // 
			) ); 
			
	 Block_control_spi 
 #(8,8) spi_control3( .clk(clk_125_pll),.sclk(xSPI3_SCK),.mosi(xSPI3_MOSI),.miso(xSPI3_MISO),.cs(xCS_FPGA1) ,.rst(reset_125) ,
	.inport
		 ({xONET1_RX_LOS,
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
assign xLMK_RESET_3V3 = 1'h00;
assign xLMK_SYNC_3V3  = 1'h00;
//------------------------------------------------			
			
			
//----------------------------------------------------------------			
assign xEN_2V5_VDA=1'h0; //выключен источник питания для DAC и ADC			
//----------------------------------------------------------------
assign xTNC_MK_1HZ     = xFPGA_SYNC1;  //направляем сигнал 1сек на мк
assign xSEL_ETALON_3V3 = 1'h1; //1 - включаем поступление сигнала эталона с ВЧ разъёма





assign xA1_SEN_1V8=xCS_ADC1;
assign xA2_SEN_1V8=xCS_ADC2;

assign xD1_SDENB=xCS_DAC1;
assign xD2_SDENB=xCS_DAC2;

assign xLMK_CS_3V3=xCS_LMK;
assign xFLASH_CS_3V3=xCS_FLASH_FPGA;

assign xFLASH_CLK_3V3=xSPI3_SCK;
assign xLMK_SCK_3V3  =xSPI3_SCK;
assign xA2_SCLK_1V8  =xSPI3_SCK;
assign xA1_SCLK_1V8  =xSPI3_SCK;
assign xD2_SCLK		=xSPI3_SCK;
assign xD1_SCLK		=xSPI3_SCK; 

assign xD1_SDIO        = xSPI3_MOSI;
assign xD2_SDIO        = xSPI3_MOSI;
assign xA1_SDATA_1V8   = xSPI3_MOSI; 
assign xA2_SDATA_1V8   = xSPI3_MOSI;
assign xLMK_SDIO_3V3   = xSPI3_MOSI;
assign xFLASH_MOSI_3V3 = xSPI3_MOSI;
 
assign xSPI3_MISO  = (!xCS_FLASH_FPGA)   ?xFLASH_MISO_3V3:
							(!xD1_SDENB)		  ?xD1_SDO:
							(!xD2_SDENB)		  ?xD2_SDO:	
							(!xA1_SEN_1V8)      ?xA1_SDOUT_1V8:1'h1;
 							
							
 
//----------BOOT uart stm32---------- 
assign xUART1_RX  = xTX_FTDI_1;
assign xRX_FTDI_1 = xUART1_TX;


assign xBOOT1    = 1'h0 ; //для stm32
assign xBOOT0    = (~xRESET_MK_FTDI)  | xBOOT_MK_FPGA;
assign xRESET_MK = xBOOT_MK_FTDI &  xMR_RESET_MK_FPGA;


//--------------rs485-------------------

assign xRX1_RS422   =  xUART6_TX;
assign xUART6_RX    =  xTX1_RS422 & xTX_FTDI_2;
assign xRNE1_RS422  =  xCS_FPGA2;
assign xDE1RX_RS422 = ~xCS_FPGA2;

assign xRX_FTDI_2   =  xUART6_TX;

//-------------SYS_SPI----------------
	  
assign xD_MISO           = xSPI4_MISO_MK;
assign xSPI4_NSS_MK      = xCE_MO;
assign xCLK_MO           = xSPI4_SCK_MK;
assign xSPI4_MOSI_MK     = xD_MOSI;
assign xDE_MISO_LVDS_3V3 = xLMK_STATUS_LD1_3V3; //управление буфером lvds - MISO от микроконтроллера 

//------------------------------------
	

wire 			xphy_mgmt_clk_reset;
wire [0:0]  xtx_pma_clkout;
wire [79:0] xtx_pma_parallel_data;

wire [0:0]  xrx_analogreset;
wire [0:0]  xrx_digitalreset;
wire [8:0]  xphy_mgmt_address;
wire        xphy_mgmt_read;
wire [31:0] xphy_mgmt_readdata;
wire        xphy_mgmt_waitrequest;
wire        xphy_mgmt_write;
wire [31:0] xphy_mgmt_writedata;
wire        xtx_ready;
wire        xrx_ready;
wire [0:0]  xrx_runningdisp;
wire [0:0]  xrx_disperr;
wire [0:0]  xrx_errdetect;
wire [0:0]  xtx_clkout;
wire [0:0]  xrx_clkout; 
wire [7:0]  xtx_parallel_data;
wire [0:0]  xtx_datak;
wire [7:0]  xrx_parallel_data;
wire [0:0]  xrx_datak;

wire        xSYSREF0;
wire        xdev_sync_n;
wire [3:0]	xsomf;

bufi1	bufi1_inst2 (
	.datain ( SYSREF0 ),
	.dataout ( xSYSREF0 )
	);
	
	
wire x1sync_n;
wire x2sync_n;
	
bufi1	bufi1_inst3 (
	.datain ( D1_SYNCB ),
	.dataout ( x1sync_n )
	);	
	
bufi1	bufi1_inst4 (
	.datain ( D2_SYNCB ),
	.dataout ( x2sync_n )
	);	
	
	
	
	wire	[7:0]	xcsr_f;
	wire	[4:0]	xcsr_k;
	wire	[4:0]	xcsr_l;
	wire	[7:0]	xcsr_m;
	wire	[4:0]	xcsr_n;
	wire	[4:0]	xcsr_s;
	wire	[4:0]	xcsr_cf;
	wire	[1:0]	xcsr_cs;
	wire  		xcsr_hd;
	wire  [4:0]	xcsr_np;
	wire  [1:0]	xcsr_lane_powerdown;	
	
	wire 			  xtxlink_rst_n_reset_n;
	wire 			  xjesd204_tx_avs_rst_n;
	wire  [7:0]   xjesd204_tx_avs_address;
	wire          xjesd204_tx_avs_read;
	wire  [31:0]  xjesd204_tx_avs_readdata;  
	wire  		  xjesd204_tx_avs_waitrequest;	
	wire          xjesd204_tx_avs_write;
	wire  [31:0]  xjesd204_tx_avs_writedata;
	wire  [63:0] 	  xjesd204_tx_link_data;
	wire  [7:0]   xjesd204_tx_link_valid;
	wire 			  xjesd204_tx_link_ready;
	wire 			  xjesd204_tx_int;
	
	wire 			  xjesd204_tx_frame_ready;
	wire [3:0]    xcsr_tx_testmode;
	 reg [31:0]   xcsr_tx_testpattern_a=32'hBeefBeef;
	 reg [31:0]   xcsr_tx_testpattern_b=32'hBaafBeef;
	 reg [31:0]   xcsr_tx_testpattern_c=32'hBccfBeef;
	 reg [31:0]   xcsr_tx_testpattern_d=32'hBddfBeef;
	 
	wire          xjesd204_tx_frame_error;
	wire [63:0]   xjesd204_tx_dlb_data;
	wire [7:0]	  xjesd204_tx_dlb_kchar_data;
	wire 			  xtxphy_clk;
	wire 			  xpll_powerdown;
	wire [1:0] 	  xtx_analogreset;
	wire [1:0] 	  xtx_digitalreset;
	wire [1:0]    xpll_locked;
	wire [1:0]    xtx_cal_busy;
	
	
	
//assign xphy_mgmt_clk_reset = 0;
assign xphy_mgmt_address   = 0;
assign xphy_mgmt_read      = 0;
assign xphy_mgmt_write     = 0;
assign xphy_mgmt_writedata = 0;
//assign xtx_parallel_data   = 0;
//assign xtx_datak				= 0;
 


 custom_phy  PHY1(
		.phy_mgmt_clk(clk_125_pll),         //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset(xphy_mgmt_clk_reset),   // phy_mgmt_clk_reset.reset
		.phy_mgmt_address(xphy_mgmt_address),     //           phy_mgmt.address
		.phy_mgmt_read(xphy_mgmt_read),        //                   .read
		.phy_mgmt_readdata(xphy_mgmt_readdata),    //                   .readdata
		.phy_mgmt_waitrequest(xphy_mgmt_waitrequest), //                   .waitrequest
		.phy_mgmt_write(xphy_mgmt_write),       //                   .write
		.phy_mgmt_writedata(xphy_mgmt_writedata),   //                   .writedata
		.tx_ready(xtx_ready),             //           tx_ready.export
		.rx_ready(xrx_ready),             //           rx_ready.export
		.pll_ref_clk(clk_125_pll),          //        pll_ref_clk.clk
		.tx_serial_data(TX_GTP),       //     tx_serial_data.export
		.pll_locked(xpll_locked),           //         pll_locked.export
		.rx_serial_data(RX_GTP),       //     rx_serial_data.export
		.rx_runningdisp(xrx_runningdisp),       //     rx_runningdisp.export
		.rx_disperr(xrx_disperr),           //         rx_disperr.export
		.rx_errdetect(xrx_errdetect),         //       rx_errdetect.export
		.tx_clkout(xtx_clkout),            //          tx_clkout.export
		.rx_clkout(xrx_clkout),            //          rx_clkout.export
		.tx_parallel_data(xtx_parallel_data),     //   tx_parallel_data.export
		.tx_datak(xtx_datak),             //           tx_datak.export
		.rx_parallel_data(xrx_parallel_data),     //   rx_parallel_data.export
		.rx_datak(xrx_datak),             //           rx_datak.export
		.reconfig_from_xcvr(xreconfig_from_xcvr),   // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr(xreconfig_to_xcvr)      //   reconfig_to_xcvr.reconfig_to_xcvr
	);	
	
	
Block_control_GPHY  #(32,10) 
block_GPHY1
(  .clk(clk_125_pll),
	.sclk(xSPI3_SCK),
	.mosi(xSPI3_MOSI),
	.miso(xSPI3_MISO),
	.cs(xCS_FPGA1) ,
	.rst(reset_125) ,
	.reset_PHY(xphy_mgmt_clk_reset),
	.tx_ready(xtx_ready), 
	.rx_ready(xrx_ready),
	.pll_locked(xpll_locked),
	.rx_runningdisp(xrx_runningdisp),
	.rx_disperr(xrx_disperr),
	.rx_errdetect(xrx_errdetect),
	.tx_parallel_data(xtx_parallel_data),
	.tx_datak(xtx_datak),
	.rx_parallel_data(xrx_parallel_data),
	.rx_datak(xrx_datak)	
	);	


wire 			 xreconfig_busy;
wire [6:0]   xreconfig_mgmt_address;
wire         xreconfig_mgmt_read;
wire [31:0]  xreconfig_mgmt_readdata;
wire         xreconfig_mgmt_waitrequest;
wire         xreconfig_mgmt_write;
wire [31:0]  xreconfig_mgmt_writedata;
wire [139:0] xreconfig_to_xcvr;
wire [91:0]  xreconfig_from_xcvr;



endmodule


	
