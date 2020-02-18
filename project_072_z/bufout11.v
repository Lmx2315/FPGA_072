// megafunction wizard: %ALTIOBUF%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altiobuf_out 

// ============================================================
// File Name: bufout11.v
// Megafunction Name(s):
// 			altiobuf_out
//
// Simulation Library Files(s):
// 			
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 18.1.0 Build 625 09/12/2018 SJ Standard Edition
// ************************************************************


//Copyright (C) 2018  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Intel Program License 
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel FPGA IP License Agreement, or other applicable license
//agreement, including, without limitation, that your use is for
//the sole purpose of programming logic devices manufactured by
//Intel and sold by Intel or its authorized distributors.  Please
//refer to the applicable agreement for further details.


//altiobuf_out CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Arria V" ENABLE_BUS_HOLD="FALSE" LEFT_SHIFT_SERIES_TERMINATION_CONTROL="FALSE" NUMBER_OF_CHANNELS=11 OPEN_DRAIN_OUTPUT="FALSE" PSEUDO_DIFFERENTIAL_MODE="FALSE" USE_DIFFERENTIAL_MODE="FALSE" USE_OE="FALSE" USE_TERMINATION_CONTROL="FALSE" datain dataout
//VERSION_BEGIN 18.1 cbx_altiobuf_out 2018:09:12:13:04:24:SJ cbx_mgl 2018:09:12:13:10:36:SJ cbx_stratixiii 2018:09:12:13:04:24:SJ cbx_stratixv 2018:09:12:13:04:24:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = arriav_io_obuf 11 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  bufout11_iobuf_out_9js
	( 
	datain,
	dataout) ;
	input   [10:0]  datain;
	output   [10:0]  dataout;

	wire  [10:0]   wire_obufa_i;
	wire  [10:0]   wire_obufa_o;
	wire  [10:0]   wire_obufa_oe;
	wire  [10:0]  oe_w;

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
	arriav_io_obuf   obufa_7
	( 
	.i(wire_obufa_i[7:7]),
	.o(wire_obufa_o[7:7]),
	.obar(),
	.oe(wire_obufa_oe[7:7])
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
		obufa_7.bus_hold = "false",
		obufa_7.open_drain_output = "false",
		obufa_7.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_8
	( 
	.i(wire_obufa_i[8:8]),
	.o(wire_obufa_o[8:8]),
	.obar(),
	.oe(wire_obufa_oe[8:8])
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
		obufa_8.bus_hold = "false",
		obufa_8.open_drain_output = "false",
		obufa_8.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_9
	( 
	.i(wire_obufa_i[9:9]),
	.o(wire_obufa_o[9:9]),
	.obar(),
	.oe(wire_obufa_oe[9:9])
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
		obufa_9.bus_hold = "false",
		obufa_9.open_drain_output = "false",
		obufa_9.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_10
	( 
	.i(wire_obufa_i[10:10]),
	.o(wire_obufa_o[10:10]),
	.obar(),
	.oe(wire_obufa_oe[10:10])
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
		obufa_10.bus_hold = "false",
		obufa_10.open_drain_output = "false",
		obufa_10.lpm_type = "arriav_io_obuf";
	assign
		wire_obufa_i = datain,
		wire_obufa_oe = oe_w;
	assign
		dataout = wire_obufa_o,
		oe_w = {11{1'b1}};
endmodule //bufout11_iobuf_out_9js
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module bufout11 (
	datain,
	dataout);

	input	[10:0]  datain;
	output	[10:0]  dataout;

	wire [10:0] sub_wire0;
	wire [10:0] dataout = sub_wire0[10:0];

	bufout11_iobuf_out_9js	bufout11_iobuf_out_9js_component (
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
// Retrieval info: CONSTANT: number_of_channels NUMERIC "11"
// Retrieval info: CONSTANT: open_drain_output STRING "FALSE"
// Retrieval info: CONSTANT: pseudo_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_oe STRING "FALSE"
// Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
// Retrieval info: USED_PORT: datain 0 0 11 0 INPUT NODEFVAL "datain[10..0]"
// Retrieval info: USED_PORT: dataout 0 0 11 0 OUTPUT NODEFVAL "dataout[10..0]"
// Retrieval info: CONNECT: @datain 0 0 11 0 datain 0 0 11 0
// Retrieval info: CONNECT: dataout 0 0 11 0 @dataout 0 0 11 0
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout11.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout11.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout11.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout11.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout11_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout11_bb.v TRUE
