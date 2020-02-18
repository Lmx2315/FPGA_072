set_global_assignment -entity "pll240v2" -library "lib_pll240v2" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll240v2" -library "lib_pll240v2" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll240v2" -library "lib_pll240v2" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll240v2" -name SPD_FILE [file join $::quartus(sip_path) "pll240v2.spd"]

set_global_assignment -library "lib_pll240v2" -name MISC_FILE [file join $::quartus(sip_path) "pll240v2_sim/pll240v2.vo"]
