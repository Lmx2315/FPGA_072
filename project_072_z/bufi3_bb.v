// megafunction wizard: %ALTIOBUF%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altiobuf_in 

// ============================================================
// File Name: bufi3.v
// Megafunction Name(s):
// 			altiobuf_in
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

module bufi3 (
	datain,
	dataout)/* synthesis synthesis_clearbox = 1 */;

	input	[2:0]  datain;
	output	[2:0]  dataout;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Arria V"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Arria V"
// Retrieval info: CONSTANT: enable_bus_hold STRING "FALSE"
// Retrieval info: CONSTANT: number_of_channels NUMERIC "3"
// Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_dynamic_termination_control STRING "FALSE"
// Retrieval info: USED_PORT: datain 0 0 3 0 INPUT NODEFVAL "datain[2..0]"
// Retrieval info: USED_PORT: dataout 0 0 3 0 OUTPUT NODEFVAL "dataout[2..0]"
// Retrieval info: CONNECT: @datain 0 0 3 0 datain 0 0 3 0
// Retrieval info: CONNECT: dataout 0 0 3 0 @dataout 0 0 3 0
// Retrieval info: GEN_FILE: TYPE_NORMAL bufi3.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufi3.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufi3.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufi3.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufi3_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL bufi3_bb.v TRUE
