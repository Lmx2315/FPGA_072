set_global_assignment -entity "pll360v3_inv" -library "lib_pll360v3_inv" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll360v3_inv" -library "lib_pll360v3_inv" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll360v3_inv" -library "lib_pll360v3_inv" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll360v3_inv" -name SPD_FILE [file join $::quartus(sip_path) "pll360v3_inv.spd"]

set_global_assignment -library "lib_pll360v3_inv" -name MISC_FILE [file join $::quartus(sip_path) "pll360v3_inv_sim/pll360v3_inv.vo"]
