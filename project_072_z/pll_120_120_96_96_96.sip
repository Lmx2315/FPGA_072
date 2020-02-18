set_global_assignment -entity "pll_120_120_96_96_96" -library "lib_pll_120_120_96_96_96" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_120_120_96_96_96" -library "lib_pll_120_120_96_96_96" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll_120_120_96_96_96" -library "lib_pll_120_120_96_96_96" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_120_120_96_96_96" -name SPD_FILE [file join $::quartus(sip_path) "pll_120_120_96_96_96.spd"]

set_global_assignment -library "lib_pll_120_120_96_96_96" -name MISC_FILE [file join $::quartus(sip_path) "pll_120_120_96_96_96_sim/pll_120_120_96_96_96.vo"]
