// megafunction wizard: %ALTIOBUF%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altiobuf_out 

// ============================================================
// File Name: bufout7.v
// Megafunction Name(s):
// 			altiobuf_out
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


//altiobuf_out CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Arria V" ENABLE_BUS_HOLD="FALSE" LEFT_SHIFT_SERIES_TERMINATION_CONTROL="FALSE" NUMBER_OF_CHANNELS=7 OPEN_DRAIN_OUTPUT="FALSE" PSEUDO_DIFFERENTIAL_MODE="FALSE" USE_DIFFERENTIAL_MODE="FALSE" USE_OE="FALSE" USE_TERMINATION_CONTROL="FALSE" datain dataout
//VERSION_BEGIN 17.0 cbx_altiobuf_out 2017:04:25:18:06:29:SJ cbx_mgl 2017:04:25:18:09:28:SJ cbx_stratixiii 2017:04:25:18:06:30:SJ cbx_stratixv 2017:04:25:18:06:30:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = arriav_io_obuf 7 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  bufout7_iobuf_out_uhs
	( 
	datain,
	dataout) ;
	input   [6:0]  datain;
	output   [6:0]  dataout;

	wire  [6:0]   wire_obufa_i;
	wire  [6:0]   wire_obufa_o;
	wire  [6:0]   wire_obufa_oe;
	wire  [6:0]  oe_w;

	arriav_io_obuf   obufa_0
	( 
	.i(wire_obufa_i[0:0]),
	.o(wire_obufa_o[0:0]),
	.obar(),
	.oe(wire_obufa_oe[0:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obufa_0.bus_hold = "false",
		obufa_0.open_drain_output = "false",
		obufa_0.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_1
	( 
	.i(wire_obufa_i[1:1]),
	.o(wire_obufa_o[1:1]),
	.obar(),
	.oe(wire_obufa_oe[1:1])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obufa_1.bus_hold = "false",
		obufa_1.open_drain_output = "false",
		obufa_1.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_2
	( 
	.i(wire_obufa_i[2:2]),
	.o(wire_obufa_o[2:2]),
	.obar(),
	.oe(wire_obufa_oe[2:2])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obufa_2.bus_hold = "false",
		obufa_2.open_drain_output = "false",
		obufa_2.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_3
	( 
	.i(wire_obufa_i[3:3]),
	.o(wire_obufa_o[3:3]),
	.obar(),
	.oe(wire_obufa_oe[3:3])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obufa_3.bus_hold = "false",
		obufa_3.open_drain_output = "false",
		obufa_3.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_4
	( 
	.i(wire_obufa_i[4:4]),
	.o(wire_obufa_o[4:4]),
	.obar(),
	.oe(wire_obufa_oe[4:4])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obufa_4.bus_hold = "false",
		obufa_4.open_drain_output = "false",
		obufa_4.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_5
	( 
	.i(wire_obufa_i[5:5]),
	.o(wire_obufa_o[5:5]),
	.obar(),
	.oe(wire_obufa_oe[5:5])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obufa_5.bus_hold = "false",
		obufa_5.open_drain_output = "false",
		obufa_5.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_6
	( 
	.i(wire_obufa_i[6:6]),
	.o(wire_obufa_o[6:6]),
	.obar(),
	.oe(wire_obufa_oe[6:6])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obufa_6.bus_hold = "false",
		obufa_6.open_drain_output = "false",
		obufa_6.lpm_type = "arriav_io_obuf";
	assign
		wire_obufa_i = datain,
		wire_obufa_oe = oe_w;
	assign
		dataout = wire_obufa_o,
		oe_w = {7{1'b1}};
endmodule //bufout7_iobuf_out_uhs
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module bufout7 (
	datain,
	dataout);

	input	[6:0]  datain;
	output	[6:0]  dataout;

	wire [6:0] sub_wire0;
	wire [6:0] dataout = sub_wire0[6:0];

	bufout7_iobuf_out_uhs	bufout7_iobuf_out_uhs_component (
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
// Retrieval info: CONSTANT: left_shift_series_termination_control STRING "FALSE"
// Retrieval info: CONSTANT: number_of_channels NUMERIC "7"
// Retrieval info: CONSTANT: open_drain_output STRING "FALSE"
// Retrieval info: CONSTANT: pseudo_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_oe STRING "FALSE"
// Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
// Retrieval info: USED_PORT: datain 0 0 7 0 INPUT NODEFVAL "datain[6..0]"
// Retrieval info: USED_PORT: dataout 0 0 7 0 OUTPUT NODEFVAL "dataout[6..0]"
// Retrieval info: CONNECT: @datain 0 0 7 0 datain 0 0 7 0
// Retrieval info: CONNECT: dataout 0 0 7 0 @dataout 0 0 7 0
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout7.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout7.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout7.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout7.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout7_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout7_bb.v TRUE
// Retrieval info: LIB_FILE: arriav
