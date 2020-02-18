set_global_assignment -entity "pll_v040219_1" -library "lib_pll_v040219_1" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_v040219_1" -library "lib_pll_v040219_1" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll_v040219_1" -library "lib_pll_v040219_1" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_v040219_1" -name SPD_FILE [file join $::quartus(sip_path) "pll_v040219_1.spd"]

set_global_assignment -library "lib_pll_v040219_1" -name MISC_FILE [file join $::quartus(sip_path) "pll_v040219_1_sim/pll_v040219_1.vo"]
