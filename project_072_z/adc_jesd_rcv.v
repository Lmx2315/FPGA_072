
module adc_jesd_rcv
(
input wire clk_120,
input wire clk_240,
input wire rst_adc_align,
input wire SYSREF0,
input wire [ 7:0] xrx_syncstatus_adc,
input wire [ 7:0] xrx_disperr_adc,
input wire [ 7:0] xrx_errdetect_adc,
input wire [63:0] xrx_parallel_data_adc,
input wire [ 7:0] xrx_datak_adc,
input wire 		fifo2clk_tst_rd,//сигнал чтения для тестового вывода слов на SPI
output wire [7:0] walign_tst,//тестовый вывод кода смещения входного слова
output wire [3:0] w_ok0,
output wire [3:0] w_ok1,
output wire sync_n_adc,
output wire  sysref_error,
output wire [15:0] ch_adc0_data,
output wire [15:0] ch_adc1_data,
output wire [63:0] adc_data_tst2,
output wire [63:0] adc_data_tst1
);

parameter FRAME_IN_MULTIFREIM=15;

wire reset_fifo;

fifo_2clk //convert 64 bits to 2x 16bit
fifo1_1(
	.data_tst1(adc_data_tst1),
	.data_tst2(adc_data_tst2),
	.clk2x(clk_240),
	.clk1x(clk_120),
	.en_tst(fifo2clk_tst_rd),
	.datain(d), 
	.rst(reset_fifo),
	.adc0(ch_adc0_data),
	.adc1(ch_adc1_data)
);


wire [63:0] d;

wire [ 7:0] walign_datak;
wire [63:0] walign_data;


//-------------блок выравнивает данные в приёмном окне - смещает их как надо по коду 0xBC-----------
genvar i;
generate
for (i=0;i<4;i=i+1)	
begin: gen_lane
	
line_world_align
al
(	.datak(walign_datak[2*i+1:i*2]),
	.o(walign_data[16*i+15:i*16]),
	.align_tst(walign_tst[2*i+1:i*2]),
	.clk(clk_120),	 
	.sync_n(sync_n_adc),
	.rst(rst_adc_align),
	.in(xrx_parallel_data_adc[16*i+15:i*16]),
	.charisk(xrx_datak_adc[2*i+1:i*2])
	);
end	
endgenerate
//-------------------------------------------------------------------------------------------------

wire [3:0] w_ok;
wire wire_lmfc_edge;
wire sync_n_adc0;
wire sync_n_adc1;

assign sync_n_adc=sync_n_adc0&sync_n_adc1;

adc_align #(0) //настройка выходных данных,настоящее-прошлое
 al1(
	.data_o(d[31:0]),
	.error_rx(xrx_errdetect_adc[3:0]),
	.error_disp(xrx_disperr_adc[3:0]),
	.clk(clk_120),
	.lmfc_edge(wire_lmfc_edge),
	.in(walign_data[31:0]),
	.datak(walign_datak[3:0]),
	.syncstatus(xrx_syncstatus_adc[3:0]),
	.flag_ok(w_ok0),	
	.sync_n(sync_n_adc0),
	.rst_f(reset_fifo),	//ресет для конвертора потока из 120 в 240 МГц 64-2х32
	.rst(rst_adc_align)
);
//d[63:32]
adc_align #(1)
 al2(
	.data_o({d[39:32],d[47:40],d[55:48],d[63:56]}),
	.error_rx(xrx_errdetect_adc[7:4]),
	.error_disp(xrx_disperr_adc[7:4]),
	.clk(clk_120),
	.lmfc_edge(wire_lmfc_edge),
	.in(walign_data[63:32]),
	.datak(walign_datak[7:4]),
	.syncstatus(xrx_syncstatus_adc[7:4]),
	.flag_ok(w_ok1),	
	.sync_n(sync_n_adc1),
	.rst_f(),	
	.rst(rst_adc_align)
);

jesd204_lmfc 
lmfc1(
  .clk(clk_120),
  .reset(rst_adc_align),

  .sysref(SYSREF0),

  .cfg_beats_per_multiframe(FRAME_IN_MULTIFREIM),
  .cfg_lmfc_offset(0),
  .cfg_sysref_oneshot(1),
  .cfg_sysref_disable(0),

  .lmfc_edge(wire_lmfc_edge),
  .lmfc_clk(),
  .lmfc_counter(),

  .sysref_edge(),
  .sysref_alignment_error(sysref_error)
);

endmodule