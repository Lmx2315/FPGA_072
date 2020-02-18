set_global_assignment -entity "pll_125_120_96_96_96_v1" -library "lib_pll_125_120_96_96_96_v1" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_125_120_96_96_96_v1" -library "lib_pll_125_120_96_96_96_v1" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll_125_120_96_96_96_v1" -library "lib_pll_125_120_96_96_96_v1" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_125_120_96_96_96_v1" -name SPD_FILE [file join $::quartus(sip_path) "pll_125_120_96_96_96_v1.spd"]

set_global_assignment -library "lib_pll_125_120_96_96_96_v1" -name MISC_FILE [file join $::quartus(sip_path) "pll_125_120_96_96_96_v1_sim/pll_125_120_96_96_96_v1.vo"]
