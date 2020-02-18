set_global_assignment -entity "pll96_v2_inv" -library "lib_pll96_v2_inv" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll96_v2_inv" -library "lib_pll96_v2_inv" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll96_v2_inv" -library "lib_pll96_v2_inv" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll96_v2_inv" -name SPD_FILE [file join $::quartus(sip_path) "pll96_v2_inv.spd"]

set_global_assignment -library "lib_pll96_v2_inv" -name MISC_FILE [file join $::quartus(sip_path) "pll96_v2_inv_sim/pll96_v2_inv.vo"]
