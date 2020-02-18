// megafunction wizard: %ALTIOBUF%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altiobuf_out 

// ============================================================
// File Name: bufout10.v
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

module bufout10 (
	datain,
	dataout)/* synthesis synthesis_clearbox = 1 */;

	input	[9:0]  datain;
	output	[9:0]  dataout;

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
// Retrieval info: CONSTANT: number_of_channels NUMERIC "10"
// Retrieval info: CONSTANT: open_drain_output STRING "FALSE"
// Retrieval info: CONSTANT: pseudo_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_oe STRING "FALSE"
// Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
// Retrieval info: USED_PORT: datain 0 0 10 0 INPUT NODEFVAL "datain[9..0]"
// Retrieval info: USED_PORT: dataout 0 0 10 0 OUTPUT NODEFVAL "dataout[9..0]"
// Retrieval info: CONNECT: @datain 0 0 10 0 datain 0 0 10 0
// Retrieval info: CONNECT: dataout 0 0 10 0 @dataout 0 0 10 0
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout10.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout10.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout10.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout10.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout10_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufout10_bb.v TRUE
// Retrieval info: LIB_FILE: arriav
