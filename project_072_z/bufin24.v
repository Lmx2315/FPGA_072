// megafunction wizard: %ALTIOBUF%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altiobuf_in 

// ============================================================
// File Name: bufin24.v
// Megafunction Name(s):
// 			altiobuf_in
//
// Simulation Library Files(s):
// 			arriav
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 17.0.0 Build 595 04/25/2017 SJ Standard Edition
// ************************************************************


//Copyright (C) 2017  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Intel Program License 
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel MegaCore Function License Agreement, or other 
//applicable license agreement, including, without limitation, 
//that your use is for the sole purpose of programming logic 
//devices manufactured by Intel and sold by Intel or its 
//authorized distributors.  Please refer to the applicable 
//agreement for further details.


//altiobuf_in CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Arria V" ENABLE_BUS_HOLD="FALSE" NUMBER_OF_CHANNELS=24 USE_DIFFERENTIAL_MODE="FALSE" USE_DYNAMIC_TERMINATION_CONTROL="FALSE" datain dataout
//VERSION_BEGIN 17.0 cbx_altiobuf_in 2017:04:25:18:06:29:SJ cbx_mgl 2017:04:25:18:09:28:SJ cbx_stratixiii 2017:04:25:18:06:30:SJ cbx_stratixv 2017:04:25:18:06:30:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = arriav_io_ibuf 24 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  bufin24_iobuf_in_mrh
	( 
	datain,
	dataout) ;
	input   [23:0]  datain;
	output   [23:0]  dataout;

	wire  [23:0]   wire_ibufa_i;
	wire  [23:0]   wire_ibufa_o;

	arriav_io_ibuf   ibufa_0
	( 
	.i(wire_ibufa_i[0:0]),
	.o(wire_ibufa_o[0:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_0.bus_hold = "false",
		ibufa_0.differential_mode = "false",
		ibufa_0.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_1
	( 
	.i(wire_ibufa_i[1:1]),
	.o(wire_ibufa_o[1:1])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_1.bus_hold = "false",
		ibufa_1.differential_mode = "false",
		ibufa_1.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_2
	( 
	.i(wire_ibufa_i[2:2]),
	.o(wire_ibufa_o[2:2])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_2.bus_hold = "false",
		ibufa_2.differential_mode = "false",
		ibufa_2.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_3
	( 
	.i(wire_ibufa_i[3:3]),
	.o(wire_ibufa_o[3:3])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_3.bus_hold = "false",
		ibufa_3.differential_mode = "false",
		ibufa_3.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_4
	( 
	.i(wire_ibufa_i[4:4]),
	.o(wire_ibufa_o[4:4])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_4.bus_hold = "false",
		ibufa_4.differential_mode = "false",
		ibufa_4.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_5
	( 
	.i(wire_ibufa_i[5:5]),
	.o(wire_ibufa_o[5:5])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_5.bus_hold = "false",
		ibufa_5.differential_mode = "false",
		ibufa_5.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_6
	( 
	.i(wire_ibufa_i[6:6]),
	.o(wire_ibufa_o[6:6])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_6.bus_hold = "false",
		ibufa_6.differential_mode = "false",
		ibufa_6.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_7
	( 
	.i(wire_ibufa_i[7:7]),
	.o(wire_ibufa_o[7:7])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_7.bus_hold = "false",
		ibufa_7.differential_mode = "false",
		ibufa_7.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_8
	( 
	.i(wire_ibufa_i[8:8]),
	.o(wire_ibufa_o[8:8])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_8.bus_hold = "false",
		ibufa_8.differential_mode = "false",
		ibufa_8.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_9
	( 
	.i(wire_ibufa_i[9:9]),
	.o(wire_ibufa_o[9:9])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_9.bus_hold = "false",
		ibufa_9.differential_mode = "false",
		ibufa_9.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_10
	( 
	.i(wire_ibufa_i[10:10]),
	.o(wire_ibufa_o[10:10])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_10.bus_hold = "false",
		ibufa_10.differential_mode = "false",
		ibufa_10.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_11
	( 
	.i(wire_ibufa_i[11:11]),
	.o(wire_ibufa_o[11:11])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_11.bus_hold = "false",
		ibufa_11.differential_mode = "false",
		ibufa_11.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_12
	( 
	.i(wire_ibufa_i[12:12]),
	.o(wire_ibufa_o[12:12])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_12.bus_hold = "false",
		ibufa_12.differential_mode = "false",
		ibufa_12.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_13
	( 
	.i(wire_ibufa_i[13:13]),
	.o(wire_ibufa_o[13:13])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_13.bus_hold = "false",
		ibufa_13.differential_mode = "false",
		ibufa_13.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_14
	( 
	.i(wire_ibufa_i[14:14]),
	.o(wire_ibufa_o[14:14])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_14.bus_hold = "false",
		ibufa_14.differential_mode = "false",
		ibufa_14.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_15
	( 
	.i(wire_ibufa_i[15:15]),
	.o(wire_ibufa_o[15:15])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_15.bus_hold = "false",
		ibufa_15.differential_mode = "false",
		ibufa_15.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_16
	( 
	.i(wire_ibufa_i[16:16]),
	.o(wire_ibufa_o[16:16])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_16.bus_hold = "false",
		ibufa_16.differential_mode = "false",
		ibufa_16.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_17
	( 
	.i(wire_ibufa_i[17:17]),
	.o(wire_ibufa_o[17:17])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_17.bus_hold = "false",
		ibufa_17.differential_mode = "false",
		ibufa_17.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_18
	( 
	.i(wire_ibufa_i[18:18]),
	.o(wire_ibufa_o[18:18])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_18.bus_hold = "false",
		ibufa_18.differential_mode = "false",
		ibufa_18.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_19
	( 
	.i(wire_ibufa_i[19:19]),
	.o(wire_ibufa_o[19:19])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_19.bus_hold = "false",
		ibufa_19.differential_mode = "false",
		ibufa_19.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_20
	( 
	.i(wire_ibufa_i[20:20]),
	.o(wire_ibufa_o[20:20])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_20.bus_hold = "false",
		ibufa_20.differential_mode = "false",
		ibufa_20.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_21
	( 
	.i(wire_ibufa_i[21:21]),
	.o(wire_ibufa_o[21:21])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_21.bus_hold = "false",
		ibufa_21.differential_mode = "false",
		ibufa_21.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_22
	( 
	.i(wire_ibufa_i[22:22]),
	.o(wire_ibufa_o[22:22])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_22.bus_hold = "false",
		ibufa_22.differential_mode = "false",
		ibufa_22.lpm_type = "arriav_io_ibuf";
	arriav_io_ibuf   ibufa_23
	( 
	.i(wire_ibufa_i[23:23]),
	.o(wire_ibufa_o[23:23])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_23.bus_hold = "false",
		ibufa_23.differential_mode = "false",
		ibufa_23.lpm_type = "arriav_io_ibuf";
	assign
		wire_ibufa_i = datain;
	assign
		dataout = wire_ibufa_o;
endmodule //bufin24_iobuf_in_mrh
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module bufin24 (
	datain,
	dataout);

	input	[23:0]  datain;
	output	[23:0]  dataout;

	wire [23:0] sub_wire0;
	wire [23:0] dataout = sub_wire0[23:0];

	bufin24_iobuf_in_mrh	bufin24_iobuf_in_mrh_component (
				.datain (datain),
				.dataout (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Arria V"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Arria V"
// Retrieval info: CONSTANT: enable_bus_hold STRING "FALSE"
// Retrieval info: CONSTANT: number_of_channels NUMERIC "24"
// Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_dynamic_termination_control STRING "FALSE"
// Retrieval info: USED_PORT: datain 0 0 24 0 INPUT NODEFVAL "datain[23..0]"
// Retrieval info: USED_PORT: dataout 0 0 24 0 OUTPUT NODEFVAL "dataout[23..0]"
// Retrieval info: CONNECT: @datain 0 0 24 0 datain 0 0 24 0
// Retrieval info: CONNECT: dataout 0 0 24 0 @dataout 0 0 24 0
// Retrieval info: GEN_FILE: TYPE_NORMAL bufin24.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufin24.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufin24.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufin24.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufin24_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufin24_bb.v TRUE
// Retrieval info: LIB_FILE: arriav
