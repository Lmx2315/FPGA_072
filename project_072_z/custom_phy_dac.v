// megafunction wizard: %Custom PHY Intel FPGA IP v18.1%
// GENERATION: XML
// custom_phy_dac.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module custom_phy_dac (
		input  wire         phy_mgmt_clk,         //       phy_mgmt_clk.clk
		input  wire         phy_mgmt_clk_reset,   // phy_mgmt_clk_reset.reset
		input  wire [8:0]   phy_mgmt_address,     //           phy_mgmt.address
		input  wire         phy_mgmt_read,        //                   .read
		output wire [31:0]  phy_mgmt_readdata,    //                   .readdata
		output wire         phy_mgmt_waitrequest, //                   .waitrequest
		input  wire         phy_mgmt_write,       //                   .write
		input  wire [31:0]  phy_mgmt_writedata,   //                   .writedata
		output wire         tx_ready,             //           tx_ready.export
		input  wire [0:0]   pll_ref_clk,          //        pll_ref_clk.clk
		output wire [1:0]   tx_serial_data,       //     tx_serial_data.export
		output wire [0:0]   pll_locked,           //         pll_locked.export
		output wire [1:0]   tx_clkout,            //          tx_clkout.export
		input  wire [31:0]  tx_parallel_data,     //   tx_parallel_data.export
		input  wire [3:0]   tx_datak,             //           tx_datak.export
		output wire [183:0] reconfig_from_xcvr,   // reconfig_from_xcvr.reconfig_from_xcvr
		input  wire [279:0] reconfig_to_xcvr      //   reconfig_to_xcvr.reconfig_to_xcvr
	);

	altera_xcvr_custom #(
		.device_family                         ("Arria V"),
		.protocol_hint                         ("basic"),
		.operation_mode                        ("TX"),
		.lanes                                 (2),
		.bonded_group_size                     (1),
		.bonded_mode                           ("xN"),
		.pma_bonding_mode                      ("x1"),
		.pcs_pma_width                         (10),
		.ser_base_factor                       (8),
		.ser_words                             (2),
		.data_rate                             ("1920 Mbps"),
		.base_data_rate                        ("1920 Mbps"),
		.en_synce_support                      (0),
		.tx_bitslip_enable                     ("false"),
		.rx_use_coreclk                        ("false"),
		.tx_use_coreclk                        ("false"),
		.use_8b10b                             ("true"),
		.use_8b10b_manual_control              ("false"),
		.std_tx_pcfifo_mode                    ("low_latency"),
		.std_rx_pcfifo_mode                    ("low_latency"),
		.word_aligner_mode                     ("manual"),
		.word_aligner_state_machine_datacnt    (1),
		.word_aligner_state_machine_errcnt     (1),
		.word_aligner_state_machine_patterncnt (10),
		.word_aligner_pattern_length           (16),
		.word_align_pattern                    ("1111100111111111"),
		.run_length_violation_checking         (40),
		.use_rate_match_fifo                   (0),
		.rate_match_pattern1                   ("11010000111010000011"),
		.rate_match_pattern2                   ("00101111000101111100"),
		.byte_order_mode                       ("none"),
		.byte_order_pattern                    ("111111011"),
		.byte_order_pad_pattern                ("000000000"),
		.coreclk_0ppm_enable                   ("false"),
		.pll_refclk_cnt                        (1),
		.pll_refclk_freq                       ("96.0 MHz"),
		.pll_refclk_select                     ("0"),
		.cdr_refclk_select                     (0),
		.plls                                  (1),
		.pll_type                              ("CMU"),
		.pll_select                            (0),
		.pll_reconfig                          (0),
		.pll_external_enable                   (0),
		.gxb_analog_power                      ("AUTO"),
		.pll_lock_speed                        ("AUTO"),
		.tx_analog_power                       ("AUTO"),
		.tx_slew_rate                          ("OFF"),
		.tx_termination                        ("OCT_100_OHMS"),
		.tx_use_external_termination           ("false"),
		.tx_preemp_pretap                      (0),
		.tx_preemp_pretap_inv                  ("false"),
		.tx_preemp_tap_1                       (0),
		.tx_preemp_tap_2                       (0),
		.tx_preemp_tap_2_inv                   ("false"),
		.tx_vod_selection                      (2),
		.tx_common_mode                        ("0.65V"),
		.rx_pll_lock_speed                     ("AUTO"),
		.rx_common_mode                        ("0.82V"),
		.rx_termination                        ("OCT_100_OHMS"),
		.rx_use_external_termination           ("false"),
		.rx_eq_dc_gain                         (1),
		.rx_eq_ctrl                            (16),
		.mgmt_clk_in_mhz                       (250),
		.embedded_reset                        (1),
		.channel_interface                     (0)
	) custom_phy_dac_inst (
		.phy_mgmt_clk                (phy_mgmt_clk),         //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset          (phy_mgmt_clk_reset),   // phy_mgmt_clk_reset.reset
		.phy_mgmt_address            (phy_mgmt_address),     //           phy_mgmt.address
		.phy_mgmt_read               (phy_mgmt_read),        //                   .read
		.phy_mgmt_readdata           (phy_mgmt_readdata),    //                   .readdata
		.phy_mgmt_waitrequest        (phy_mgmt_waitrequest), //                   .waitrequest
		.phy_mgmt_write              (phy_mgmt_write),       //                   .write
		.phy_mgmt_writedata          (phy_mgmt_writedata),   //                   .writedata
		.tx_ready                    (tx_ready),             //           tx_ready.export
		.pll_ref_clk                 (pll_ref_clk),          //        pll_ref_clk.clk
		.tx_serial_data              (tx_serial_data),       //     tx_serial_data.export
		.pll_locked                  (pll_locked),           //         pll_locked.export
		.tx_clkout                   (tx_clkout),            //          tx_clkout.export
		.tx_parallel_data            (tx_parallel_data),     //   tx_parallel_data.export
		.tx_datak                    (tx_datak),             //           tx_datak.export
		.reconfig_from_xcvr          (reconfig_from_xcvr),   // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr            (reconfig_to_xcvr),     //   reconfig_to_xcvr.reconfig_to_xcvr
		.rx_ready                    (),                     //        (terminated)
		.tx_forceelecidle            (2'b00),                //        (terminated)
		.tx_bitslipboundaryselect    (10'b0000000000),       //        (terminated)
		.rx_serial_data              (2'b00),                //        (terminated)
		.rx_runningdisp              (),                     //        (terminated)
		.rx_disperr                  (),                     //        (terminated)
		.rx_errdetect                (),                     //        (terminated)
		.rx_is_lockedtoref           (),                     //        (terminated)
		.rx_is_lockedtodata          (),                     //        (terminated)
		.rx_signaldetect             (),                     //        (terminated)
		.rx_patterndetect            (),                     //        (terminated)
		.rx_syncstatus               (),                     //        (terminated)
		.rx_bitslipboundaryselectout (),                     //        (terminated)
		.rx_enabyteord               (2'b00),                //        (terminated)
		.rx_bitslip                  (2'b00),                //        (terminated)
		.rx_rmfifodatainserted       (),                     //        (terminated)
		.rx_rmfifodatadeleted        (),                     //        (terminated)
		.rx_rlv                      (),                     //        (terminated)
		.rx_byteordflag              (),                     //        (terminated)
		.tx_coreclkin                (2'b00),                //        (terminated)
		.rx_coreclkin                (2'b00),                //        (terminated)
		.rx_recovered_clk            (),                     //        (terminated)
		.rx_clkout                   (),                     //        (terminated)
		.cdr_ref_clk                 (1'b0),                 //        (terminated)
		.tx_dispval                  (4'b0000),              //        (terminated)
		.tx_forcedisp                (4'b0000),              //        (terminated)
		.rx_parallel_data            (),                     //        (terminated)
		.rx_datak                    (),                     //        (terminated)
		.pll_powerdown               (1'b0),                 //        (terminated)
		.tx_digitalreset             (2'b00),                //        (terminated)
		.tx_analogreset              (2'b00),                //        (terminated)
		.tx_cal_busy                 (),                     //        (terminated)
		.rx_digitalreset             (2'b00),                //        (terminated)
		.rx_analogreset              (2'b00),                //        (terminated)
		.rx_cal_busy                 (),                     //        (terminated)
		.ext_pll_clk                 (2'b00)                 //        (terminated)
	);

endmodule
// Retrieval info: <?xml version="1.0"?>
//<!--
//	Generated by Altera MegaWizard Launcher Utility version 1.0
//	************************************************************
//	THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//	************************************************************
//	Copyright (C) 1991-2019 Altera Corporation
//	Any megafunction design, and related net list (encrypted or decrypted),
//	support information, device programming or simulation file, and any other
//	associated documentation or information provided by Altera or a partner
//	under Altera's Megafunction Partnership Program may be used only to
//	program PLD devices (but not masked PLD devices) from Altera.  Any other
//	use of such megafunction design, net list, support information, device
//	programming or simulation file, or any other related documentation or
//	information is prohibited for any other purpose, including, but not
//	limited to modification, reverse engineering, de-compiling, or use with
//	any other silicon devices, unless such use is explicitly licensed under
//	a separate agreement with Altera or a megafunction partner.  Title to
//	the intellectual property, including patents, copyrights, trademarks,
//	trade secrets, or maskworks, embodied in any such megafunction design,
//	net list, support information, device programming or simulation file, or
//	any other related documentation or information provided by Altera or a
//	megafunction partner, remains with Altera, the megafunction partner, or
//	their respective licensors.  No other licenses, including any licenses
//	needed under any third party's intellectual property, are provided herein.
//-->
// Retrieval info: <instance entity-name="altera_xcvr_custom_phy" version="18.1" >
// Retrieval info: 	<generic name="device_family" value="Arria V" />
// Retrieval info: 	<generic name="gui_parameter_rules" value="Custom" />
// Retrieval info: 	<generic name="operation_mode" value="TX" />
// Retrieval info: 	<generic name="lanes" value="2" />
// Retrieval info: 	<generic name="gui_bonding_enable" value="false" />
// Retrieval info: 	<generic name="gui_bonded_mode" value="xN" />
// Retrieval info: 	<generic name="gui_pma_bonding_mode" value="x1" />
// Retrieval info: 	<generic name="gui_deser_factor" value="16" />
// Retrieval info: 	<generic name="gui_pcs_pma_width" value="PARAM_DEFAULT" />
// Retrieval info: 	<generic name="gui_pll_type" value="CMU" />
// Retrieval info: 	<generic name="data_rate" value="1920 Mbps" />
// Retrieval info: 	<generic name="gui_base_data_rate" value="1250 Mbps" />
// Retrieval info: 	<generic name="gui_pll_refclk_freq" value="96.0 MHz" />
// Retrieval info: 	<generic name="en_synce_support" value="0" />
// Retrieval info: 	<generic name="gui_tx_bitslip_enable" value="false" />
// Retrieval info: 	<generic name="gui_rx_use_coreclk" value="false" />
// Retrieval info: 	<generic name="gui_tx_use_coreclk" value="false" />
// Retrieval info: 	<generic name="gui_rx_use_recovered_clk" value="false" />
// Retrieval info: 	<generic name="gui_use_status" value="false" />
// Retrieval info: 	<generic name="gui_use_8b10b" value="true" />
// Retrieval info: 	<generic name="gui_use_8b10b_manual_control" value="false" />
// Retrieval info: 	<generic name="gui_use_8b10b_status" value="false" />
// Retrieval info: 	<generic name="std_tx_pcfifo_mode" value="low_latency" />
// Retrieval info: 	<generic name="std_rx_pcfifo_mode" value="low_latency" />
// Retrieval info: 	<generic name="word_aligner_mode" value="manual" />
// Retrieval info: 	<generic name="word_aligner_state_machine_datacnt" value="1" />
// Retrieval info: 	<generic name="word_aligner_state_machine_errcnt" value="1" />
// Retrieval info: 	<generic name="word_aligner_state_machine_patterncnt" value="10" />
// Retrieval info: 	<generic name="gui_use_wa_status" value="false" />
// Retrieval info: 	<generic name="word_aligner_pattern_length" value="16" />
// Retrieval info: 	<generic name="word_align_pattern" value="1111100111111111" />
// Retrieval info: 	<generic name="gui_enable_run_length" value="false" />
// Retrieval info: 	<generic name="run_length_violation_checking" value="40" />
// Retrieval info: 	<generic name="use_rate_match_fifo" value="0" />
// Retrieval info: 	<generic name="rate_match_pattern1" value="11010000111010000011" />
// Retrieval info: 	<generic name="rate_match_pattern2" value="00101111000101111100" />
// Retrieval info: 	<generic name="gui_use_rmfifo_status" value="false" />
// Retrieval info: 	<generic name="gui_use_byte_order_block" value="false" />
// Retrieval info: 	<generic name="gui_byte_order_pld_ctrl_enable" value="false" />
// Retrieval info: 	<generic name="byte_order_pattern" value="111111011" />
// Retrieval info: 	<generic name="byte_order_pad_pattern" value="000000000" />
// Retrieval info: 	<generic name="use_double_data_mode" value="DEPRECATED" />
// Retrieval info: 	<generic name="coreclk_0ppm_enable" value="false" />
// Retrieval info: 	<generic name="pll_external_enable" value="0" />
// Retrieval info: 	<generic name="gxb_analog_power" value="AUTO" />
// Retrieval info: 	<generic name="pll_lock_speed" value="AUTO" />
// Retrieval info: 	<generic name="tx_analog_power" value="AUTO" />
// Retrieval info: 	<generic name="tx_slew_rate" value="OFF" />
// Retrieval info: 	<generic name="tx_termination" value="OCT_100_OHMS" />
// Retrieval info: 	<generic name="tx_use_external_termination" value="false" />
// Retrieval info: 	<generic name="tx_preemp_pretap" value="0" />
// Retrieval info: 	<generic name="gui_tx_preemp_pretap_inv" value="false" />
// Retrieval info: 	<generic name="tx_preemp_tap_1" value="0" />
// Retrieval info: 	<generic name="tx_preemp_tap_2" value="0" />
// Retrieval info: 	<generic name="gui_tx_preemp_tap_2_inv" value="false" />
// Retrieval info: 	<generic name="tx_vod_selection" value="2" />
// Retrieval info: 	<generic name="tx_common_mode" value="0.65V" />
// Retrieval info: 	<generic name="rx_pll_lock_speed" value="AUTO" />
// Retrieval info: 	<generic name="rx_common_mode" value="0.82V" />
// Retrieval info: 	<generic name="rx_termination" value="OCT_100_OHMS" />
// Retrieval info: 	<generic name="rx_use_external_termination" value="false" />
// Retrieval info: 	<generic name="rx_eq_dc_gain" value="1" />
// Retrieval info: 	<generic name="rx_eq_ctrl" value="16" />
// Retrieval info: 	<generic name="gui_pll_reconfig_enable_pll_reconfig" value="false" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll_count" value="1" />
// Retrieval info: 	<generic name="gui_pll_reconfig_refclk_count" value="1" />
// Retrieval info: 	<generic name="gui_pll_reconfig_main_pll_index" value="0" />
// Retrieval info: 	<generic name="gui_pll_reconfig_cdr_pll_refclk_sel" value="0" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll0_pll_type" value="CMU" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll0_data_rate" value="0 Mbps" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll0_refclk_freq" value="0 MHz" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll0_refclk_sel" value="0" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll0_clk_network" value="x1" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll1_pll_type" value="CMU" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll1_data_rate" value="0 Mbps" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll1_refclk_freq" value="0 MHz" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll1_refclk_sel" value="0" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll1_clk_network" value="x1" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll2_pll_type" value="CMU" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll2_data_rate" value="0 Mbps" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll2_refclk_freq" value="0 MHz" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll2_refclk_sel" value="0" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll2_clk_network" value="x1" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll3_pll_type" value="CMU" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll3_data_rate" value="0 Mbps" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll3_refclk_freq" value="0 MHz" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll3_refclk_sel" value="0" />
// Retrieval info: 	<generic name="gui_pll_reconfig_pll3_clk_network" value="x1" />
// Retrieval info: 	<generic name="gui_mgmt_clk_in_hz" value="250000000" />
// Retrieval info: 	<generic name="gui_split_interfaces" value="0" />
// Retrieval info: 	<generic name="gui_embedded_reset" value="1" />
// Retrieval info: 	<generic name="channel_interface" value="0" />
// Retrieval info: </instance>
// IPFS_FILES : custom_phy_dac.vo
// RELATED_FILES: custom_phy_dac.v, altera_xcvr_functions.sv, altera_xcvr_custom.sv, av_xcvr_custom_nr.sv, av_xcvr_custom_native.sv, alt_xcvr_resync.sv, alt_xcvr_csr_common_h.sv, alt_xcvr_csr_common.sv, alt_xcvr_csr_pcs8g_h.sv, alt_xcvr_csr_pcs8g.sv, alt_xcvr_csr_selector.sv, alt_xcvr_mgmt2dec.sv, altera_wait_generate.v, sv_reconfig_bundle_to_xcvr.sv, sv_reconfig_bundle_to_ip.sv, sv_reconfig_bundle_merger.sv, av_xcvr_h.sv, av_xcvr_avmm_csr.sv, av_tx_pma_ch.sv, av_tx_pma.sv, av_rx_pma.sv, av_pma.sv, av_pcs_ch.sv, av_pcs.sv, av_xcvr_avmm.sv, av_xcvr_native.sv, av_xcvr_plls.sv, av_xcvr_data_adapter.sv, av_reconfig_bundle_to_basic.sv, av_reconfig_bundle_to_xcvr.sv, av_hssi_8g_rx_pcs_rbc.sv, av_hssi_8g_tx_pcs_rbc.sv, av_hssi_common_pcs_pma_interface_rbc.sv, av_hssi_common_pld_pcs_interface_rbc.sv, av_hssi_pipe_gen1_2_rbc.sv, av_hssi_rx_pcs_pma_interface_rbc.sv, av_hssi_rx_pld_pcs_interface_rbc.sv, av_hssi_tx_pcs_pma_interface_rbc.sv, av_hssi_tx_pld_pcs_interface_rbc.sv, altera_xcvr_reset_control.sv, alt_xcvr_reset_counter.sv, alt_xcvr_arbiter.sv, alt_xcvr_m2s.sv
