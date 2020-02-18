set_global_assignment -entity "pll100" -library "lib_pll100" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll100" -library "lib_pll100" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll100" -library "lib_pll100" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll100" -name SPD_FILE [file join $::quartus(sip_path) "pll100.spd"]

set_global_assignment -library "lib_pll100" -name MISC_FILE [file join $::quartus(sip_path) "pll100_sim/pll100.vo"]
