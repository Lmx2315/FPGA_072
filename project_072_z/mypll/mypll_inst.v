 output wire UPR_SWITCH1,
 output wire UPR_SWITCH2,
 output wire UPR_SWITCH3,
 output wire UPR_SWITCH4,
	  
	
	
output wire EN_2V5_VDA,
output wire REZERV1,
output wire FPGA_IND1,
output wire FPGA_IND2,

output wire FPGA_LED1_3V3,
output wire T_TEST1,
output wire T_TEST2


--------------контролируемые сигналы----------------------


 input wire KAN1_KONTROL,
 input wire KAN2_KONTROL,
 input wire KAN3_KONTROL,
 input wire KAN4_KONTROL,
  
 input wire IZL1_KONTROL,
 input wire IZL2_KONTROL,
 input wire IZL3_KONTROL,
 input wire IZL4_KONTROL,
	 
	 
------------------соеденить между собой--------------------

output wire LMK_STATUS_LD1_FPGA_3V3,~#~~~~~~~~~~
output wire LMK_STATUS_LD2_FPGA_3V3,~~~~~~~~~~
	  
input  wire LMK_STATUS_LD1_3V3,~~~~~~~~~~~~~
input  wire LMK_STATUS_LD2_3V3,~~~~~~~~~~~~~



input wire CS_ADC1,~~~~~~~~~~~~~
input wire CS_ADC2,~~~~~~~~~~~~
input wire CS_DAC1,~~~~~~~~~~~
input wire CS_DAC2,~~~~~~~~~~~~~
input wire CS_LMK,

  output wire D1_SCLK,
	  input  wire D1_SDIO,
	  output wire D1_SDO,
	  output wire D1_SDENB,~~~~~~~~~~
	  
	  output wire D2_SCLK,
	  input  wire D2_SDIO,
	  output wire D2_SDO,
	  output wire D2_SDENB,~~~~~~~~~~~
	  
	  output wire A1_SCLK_1V8,
	  output wire A1_SDATA_1V8,
	   input wire A1_SDOUT_1V8,
	  output wire A1_SEN_1V8,~~~~~~~~~~

	  
		  output wire A2_SCLK_1V8,
	  output wire A2_SDATA_1V8,
	   input wire A2_SDOUT_1V8,
	  output wire A2_SEN_1V8,~~~~~~~~~~~

  output wire LMK_SCK_3V3,
	  input  wire LMK_SDIO_3V3,
	  output wire LMK_CS_3V3,~~~~~~~~~~~~
	  
	  
	  output wire RNE1_RS422,
	  output wire DE1RX_RS422,
	  output wire RX1_RS422,
	  input  wire TX1_RS422,  
	  
  output wire FLASH_CLK_3V3,     //ноги управления резервной flash
	  output wire FLASH_MOSI_3V3,
	  output wire FLASH_CS_3V3,~~~~~~~~~
	  input  wire FLASH_MISO_3V3,
	  input  wire CS_FLASH_FPGA, ~~~~~~~~~~~~		// сигнал чипсилекта с МК на флеш через ПЛИС
	  

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


------sys spi-----

output wire SPI4_SCK_MK,  //SPI где слейв МК  ,выдача данных с ПЛИС на МК
output wire SPI4_NSS_MK,
output wire SPI4_MOSI_MK,
input wire SPI4_MISO_MK,




	 