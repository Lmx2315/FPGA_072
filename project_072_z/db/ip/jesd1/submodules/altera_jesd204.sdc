# (C) 2001-2017 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


#Users are recommended to modify this sdc file if these settings do not reflects the correct design's usage .
#For example, users must comment out set_clock_groups -asynch -group {jesd204_*x_link_clk} - group {jesd204_*x_avs_clk} if the jesd204_*x_link_clk is synchronous to jesd204_*x_avs_clk

set jesd204_sdc_debug 0

# Check if port exists
proc jesd204_port_existence {port_name} {
   set port_collection [get_ports -nowarn $port_name]
   if { [get_collection_size $port_collection] > 0 } {
      return 1
   } else {
      return 0
   }
}

# Return existing clock target list
proc jesd204_get_clock_target_list {} {
   upvar 1 jesd204_sdc_debug jesd204_sdc_debug

   set result [list]
   set clocks_collection [get_clocks -nowarn]
   foreach_in_collection clock $clocks_collection { 
      set clock_name       [get_clock_info -name $clock] 
      set clock_target_col [get_clock_info -targets $clock]
      lappend result       [query_collection -report -all $clock_target_col]
      if {$jesd204_sdc_debug} { post_message -type info "clock_name : $clock_name" }
   }
   if {$jesd204_sdc_debug} { post_message -type info "JESD204 clock_target list: $result" }

   return $result
}

set jesd204_clock_target_list [jesd204_get_clock_target_list]

      set jesd204_pll_ref_clk_ext         [jesd204_port_existence pll_ref_clk]
      set jesd204_pll_ref_clk_lsrc        [lsearch -exact $jesd204_clock_target_list pll_ref_clk]
      set jesd204_txlink_clk_ext          [jesd204_port_existence txlink_clk]
      set jesd204_txlink_clk_lsrc         [lsearch -exact $jesd204_clock_target_list txlink_clk]
      set jesd204_reconfig_to_xcvr_0_ext  [jesd204_port_existence reconfig_to_xcvr[0]]
      set jesd204_reconfig_to_xcvr_0_lsrc [lsearch -exact $jesd204_clock_target_list reconfig_to_xcvr[0]]
      set jesd204_tx_avs_clk_ext          [jesd204_port_existence jesd204_tx_avs_clk]
      set jesd204_tx_avs_clk_lsrc         [lsearch -exact $jesd204_clock_target_list jesd204_tx_avs_clk]

      if {$jesd204_pll_ref_clk_ext && $jesd204_pll_ref_clk_lsrc == -1} {
         create_clock -name "pll_ref_clk" -period 8.000ns [get_ports pll_ref_clk] 
      }
      derive_pll_clocks -create_base_clocks
      derive_clock_uncertainty
      if {$jesd204_txlink_clk_ext && $jesd204_txlink_clk_lsrc == -1} {
         create_clock -name "txlink_clk" -period 12.800ns [get_ports txlink_clk]
      }
      if {$jesd204_reconfig_to_xcvr_0_ext && $jesd204_reconfig_to_xcvr_0_lsrc == -1} {
         #Temporary set reconfig_to_xcvr[0] to 125MHz and tx_avs_clk to 125MHz. Users are responsible to constraint the reconfig_to_xcvr[0] and tx_avs_clk at desired value
         create_clock -name "reconfig_to_xcvr[0]" -period 8.000ns [get_ports reconfig_to_xcvr[0]] 
      }
      if {$jesd204_tx_avs_clk_ext && $jesd204_tx_avs_clk_lsrc == -1} {
         create_clock -name "tx_avs_clk" -period 8.000ns [get_ports jesd204_tx_avs_clk] 
      }
      if {$jesd204_txlink_clk_ext && $jesd204_pll_ref_clk_ext && $jesd204_tx_avs_clk_ext && $jesd204_reconfig_to_xcvr_0_ext} {
         set_clock_groups -asynchronous -group {txlink_clk} -group {pll_ref_clk} -group {tx_avs_clk}  -group {reconfig_to_xcvr[0]}
      }

         # JESD204B IP may not meet timing for high data rate and multi lanes design due to non-ideal placement of Quartus fitter. Set Max delay for workaround. FB 161708 
         set_max_delay -from [get_keepers {*inst_tx*altera_jesd204_tx_dll_inst*}] -to [get_keepers {*inst_av_hssi_8g_tx_pcs|wys~BURIED_SYNC_DATA*}] 12.800ns 

set_multicycle_path -end -setup -from [get_cells -compatibility_mode *inst_tx|altera_jesd204_tx_ctl_inst|csr_f_latch[*]] -to [get_cells -compatibility_mode *|inst_tx|altera_jesd204_tx_ctl_inst|rx_sync_req_n] 2
set_multicycle_path -end -hold -from [get_cells -compatibility_mode *inst_tx|altera_jesd204_tx_ctl_inst|csr_f_latch[*]] -to [get_cells -compatibility_mode *|inst_tx|altera_jesd204_tx_ctl_inst|rx_sync_req_n] 1






