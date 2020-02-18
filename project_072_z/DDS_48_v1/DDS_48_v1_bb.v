
module DDS_48_v1 (
	clk,
	reset_n,
	clken,
	phi_inc_i,
	freq_mod_i,
	phase_mod_i,
	fsin_o,
	fcos_o,
	out_valid);	

	input		clk;
	input		reset_n;
	input		clken;
	input	[47:0]	phi_inc_i;
	input	[31:0]	freq_mod_i;
	input	[15:0]	phase_mod_i;
	output	[15:0]	fsin_o;
	output	[15:0]	fcos_o;
	output		out_valid;
endmodule
