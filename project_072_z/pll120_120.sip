set_global_assignment -entity "pll120_120" -library "lib_pll120_120" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll120_120" -library "lib_pll120_120" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll120_120" -library "lib_pll120_120" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll120_120" -name SPD_FILE [file join $::quartus(sip_path) "pll120_120.spd"]

set_global_assignment -library "lib_pll120_120" -name MISC_FILE [file join $::quartus(sip_path) "pll120_120_sim/pll120_120.vo"]
