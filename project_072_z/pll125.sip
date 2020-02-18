set_global_assignment -entity "pll125" -library "lib_pll125" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll125" -library "lib_pll125" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll125" -library "lib_pll125" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll125" -name SPD_FILE [file join $::quartus(sip_path) "pll125.spd"]

set_global_assignment -library "lib_pll125" -name MISC_FILE [file join $::quartus(sip_path) "pll125_sim/pll125.vo"]
