module dsp_step1 (

input wire clk,
input wire rst,
input wire         [15:0] in,
output wire        [31:0] data,
output wire valid
);

  parameter freq1=32'h50000000;//75 Mhz	 
//parameter freq1=32'h22222222;//32 Mhz	 для тестового синуса с АЦП

wire [17:0] w_i_nco;
wire [17:0] w_q_nco;
wire nco_valid;

reg [17:0] w_i_nco_temp;
reg [17:0] w_q_nco_temp;
reg nco_valid_temp;

reg n_rst=0;
always @(posedge clk) n_rst<=~rst;

nco_test 
nc1 (
		.clk       (clk),       // clk.clk
		.reset_n   (n_rst),   // rst.reset_n
		.clken     (1'h1),     //  in.clken
		.phi_inc_i (freq1), //    .phi_inc_i
		.fsin_o    (w_i_nco),    // out.fsin_o
		.fcos_o    (w_q_nco),    //    .fcos_o
		.out_valid (nco_valid)  //    .out_valid
	);
	
reg [15:0] data_temp1=0;
	
always @(posedge clk)
begin
w_i_nco_temp  <=w_i_nco;
w_q_nco_temp  <=w_q_nco;
nco_valid_temp<=nco_valid;
end

always @(posedge clk) data_temp1<=in;//ввёл  для компенсации нарушения констрейнов в плис
	
wire [19:0] i_to_cic;
wire [19:0] q_to_cic; 
	
	
mixer_to_iq 
mix1(
	.o_i(i_to_cic),
	.o_q(q_to_cic),
	.clk(clk),
	.rst(rst),
	.in(data_temp1),//s_i_nco[17:2]
	.nco_i(w_i_nco_temp),//w_i_nco
	.nco_q(w_q_nco_temp) //w_q_nco
);


//------test NCO--------------
/*
parameter freq_tst=32'd1789570;//100 khz при 240 Мгц тактовой	 

wire [17:0] test_i_nco;
wire [17:0] test_q_nco;
wire test_nco_valid;

nco_test 
nc1 (
		.clk       (clk),       // clk.clk
		.reset_n   (~rst),   // rst.reset_n
		.clken     (1'h1),     //  in.clken
		.phi_inc_i (freq_tst), //    .phi_inc_i
		.fsin_o    (test_i_nco),    // out.fsin_o
		.fcos_o    (test_q_nco),    //    .fcos_o
		.out_valid (test_nco_valid)  //    .out_valid
	);
*/	

wire [27:0] i_cic_to_fir;
wire i_fir_valid;
wire [27:0] q_cic_to_fir;
wire q_fir_valid;


cic 
cici (
		.clk       (clk),       //     clock.clk
		.reset_n   (n_rst),   //     reset.reset_n
		.in_error  (0),  //  av_st_in.error
		.in_valid  (1),  //          .valid
		.in_ready  (),  //          .ready
		.in_data   (i_to_cic),   //          .in_data test_i_nco[17:2]
		.out_data  (i_cic_to_fir),  // av_st_out.out_data
		.out_error (), //          .error
		.out_valid (i_fir_valid), //          .valid
		.out_ready (1)  //          .ready  
	//	.clken(1)
	);
	
	
cic 
cicq (
		.clk       (clk),       //     clock.clk
		.reset_n   (n_rst),   //     reset.reset_n
		.in_error  (0),  //  av_st_in.error
		.in_valid  (1),  //          .valid
		.in_ready  (),  //          .ready
		.in_data   (q_to_cic),   //          .in_data test_q_nco[17:2]
		.out_data  (q_cic_to_fir),  // av_st_out.out_data
		.out_error (), //          .error
		.out_valid (q_fir_valid), //          .valid
		.out_ready (1)  //          .ready  
	//	.clken(1)
	);

reg [27:0] r_i_cic_to_fir;
reg r_i_fir_valid;
reg [27:0] r_q_cic_to_fir;
reg r_q_fir_valid;	
	
always @(posedge clk)
begin
r_i_cic_to_fir<=i_cic_to_fir;
r_i_fir_valid <=i_fir_valid;
r_q_cic_to_fir<=q_cic_to_fir;
r_q_fir_valid <=q_fir_valid;
end	
	
/*
	
decimator_t2  #(10)
dec_dds_i(
	.out(i_fir_data),
	.o_valid(i_sor_valid),
	.clk(clk),
	.valid(1),
	.in(in)
); 


	
decimator_t2  #(10)
dec_dds_q(
	.out(q_fir_data),
	.o_valid(q_sor_valid),
	.clk(clk),
	.valid(1),
	.in(in)
); 
*/
wire [19:0] i_fir_data;	 
wire  i_sor_valid; 
 
wire [19:0] q_fir_data;	 
wire  q_sor_valid;


fir_v2 
fir_i (
		.clk              (clk),              //                     clk.clk
		.reset_n          (n_rst),          //                     rst.reset_n
		.ast_sink_data    (r_i_cic_to_fir),    //  {w_dec_dds_q,4'b0000} avalon_streaming_sink.data 
		.ast_sink_valid   (r_i_fir_valid),   //                        .valid  
		.ast_sink_error   (2'b00),   //                        .error
		.ast_source_data  (i_fir_data),  // avalon_streaming_source.data
		.ast_source_valid (i_sor_valid), //                        .valid
		.ast_source_error ()  //                        .error
	);


fir_v2 
fir_q (
		.clk              (clk),              //                     clk.clk
		.reset_n          (n_rst),          //                     rst.reset_n
		.ast_sink_data    (r_q_cic_to_fir),    //  {w_dec_dds_q,4'b0000} avalon_streaming_sink.data 
		.ast_sink_valid   (r_q_fir_valid),   //                        .valid  
		.ast_sink_error   (2'b00),   //                        .error
		.ast_source_data  (q_fir_data),  // avalon_streaming_source.data
		.ast_source_valid (q_sor_valid), //                        .valid
		.ast_source_error ()  //                        .error
	);	
	
	
wire [19:0] i_dsp_data;
wire i_dsp_valid;  

wire [19:0] q_dsp_data;
wire q_dsp_valid;
	
decimator_t2  #(2)
dec_i(
	.out(i_dsp_data),
	.o_valid(i_dsp_valid),
	.clk(clk),
	.valid(i_sor_valid),
	.in(i_fir_data)//
); 

decimator_t2  #(2)
dec_q(
	.out(q_dsp_data),
	.o_valid(q_dsp_valid),
	.clk(clk),
	.valid(q_sor_valid),
	.in(q_fir_data)//
);


reg [31:0] data_dsp=0;
reg [19:0] data_i=0;
reg [19:0] data_q=0;
reg data_valid=0;

always @(posedge clk)
begin
data_i    <=i_dsp_data;
data_q    <=q_dsp_data;
data_dsp  <={data_i[18:3],data_q[18:3]};
data_valid<=q_dsp_valid;
end
	
assign data=data_dsp;
assign valid=data_valid;	

	
endmodule
	