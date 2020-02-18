set_global_assignment -entity "mypll" -library "lib_mypll" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "mypll" -library "lib_mypll" -name IP_TOOL_VERSION "17.0"
set_global_assignment -entity "mypll" -library "lib_mypll" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_mypll" -name SPD_FILE [file join $::quartus(sip_path) "../mypll.spd"]
set_global_assignment -library "lib_mypll" -name MISC_FILE [file join $::quartus(sip_path) "../../mypll.qsys"]

set_global_assignment -library "lib_mypll" -name MISC_FILE [file join $::quartus(sip_path) "mypll.v"]
set_global_assignment -library "lib_mypll" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mypll_altclkctrl_0.v"]
