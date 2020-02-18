transcript to asim_log
createdesign arria5_tst1 C:/intelFPGA/17.0/project
opendesign -a arria5_tst1.adf
waveformmode ASDB
alib verilog_libs/altera_ver
amap altera_ver verilog_libs/altera_ver
alog  -v2k5 -dbg -msg 0 -work altera_ver c:/intelfpga/17.0/quartus/eda/sim_lib/altera_primitives.v

alib verilog_libs/lpm_ver
amap lpm_ver verilog_libs/lpm_ver
alog  -v2k5 -dbg -msg 0 -work lpm_ver c:/intelfpga/17.0/quartus/eda/sim_lib/220model.v

alib verilog_libs/sgate_ver
amap sgate_ver verilog_libs/sgate_ver
alog  -v2k5 -dbg -msg 0 -work sgate_ver c:/intelfpga/17.0/quartus/eda/sim_lib/sgate.v

alib verilog_libs/altera_mf_ver
amap altera_mf_ver verilog_libs/altera_mf_ver
alog  -v2k5 -dbg -msg 0 -work altera_mf_ver c:/intelfpga/17.0/quartus/eda/sim_lib/altera_mf.v

alib verilog_libs/altera_lnsim_ver
amap altera_lnsim_ver verilog_libs/altera_lnsim_ver
alog  -sv2k5 -dbg -msg 0 -work altera_lnsim_ver c:/intelfpga/17.0/quartus/eda/sim_lib/altera_lnsim.sv

alib verilog_libs/arriav_ver
amap arriav_ver verilog_libs/arriav_ver
alog  -v2k5 -dbg -msg 0 -work arriav_ver c:/intelfpga/17.0/quartus/eda/sim_lib/aldec/arriav_atoms_ncrypt.v
alog  -v2k5 -dbg -msg 0 -work arriav_ver c:/intelfpga/17.0/quartus/eda/sim_lib/aldec/arriav_hmi_atoms_ncrypt.v
alog  -v2k5 -dbg -msg 0 -work arriav_ver c:/intelfpga/17.0/quartus/eda/sim_lib/arriav_atoms.v

alib verilog_libs/arriav_hssi_ver
amap arriav_hssi_ver verilog_libs/arriav_hssi_ver
alog  -v2k5 -dbg -msg 0 -work arriav_hssi_ver c:/intelfpga/17.0/quartus/eda/sim_lib/aldec/arriav_hssi_atoms_ncrypt.v
alog  -v2k5 -dbg -msg 0 -work arriav_hssi_ver c:/intelfpga/17.0/quartus/eda/sim_lib/arriav_hssi_atoms.v

alib verilog_libs/arriav_pcie_hip_ver
amap arriav_pcie_hip_ver verilog_libs/arriav_pcie_hip_ver
alog  -v2k5 -dbg -msg 0 -work arriav_pcie_hip_ver c:/intelfpga/17.0/quartus/eda/sim_lib/aldec/arriav_pcie_hip_atoms_ncrypt.v
alog  -v2k5 -dbg -msg 0 -work arriav_pcie_hip_ver c:/intelfpga/17.0/quartus/eda/sim_lib/arriav_pcie_hip_atoms.v

addfile -c -auto C:/intelFPGA/17.0/project/pll1.vo
addfile -c -auto C:/intelFPGA/17.0/project/arria5_tst1.v
addfile -c -auto C:/intelFPGA/17.0/project/Block_upr_spi1.v
addfile -c -auto C:/intelFPGA/17.0/project/pll1/pll1_0002.v
addfile -c -auto C:/intelFPGA/17.0/project/tst_rst_modul.v
addfile -c -auto C:/intelFPGA/17.0/project/bufi4.v
addfile -c -auto C:/intelFPGA/17.0/project/bufi5.v
addfile -c -auto C:/intelFPGA/17.0/project/bufout3.v
addfile -c -auto C:/intelFPGA/17.0/project/bufi3.v
addfile -c -auto C:/intelFPGA/17.0/project/Block_control_GPHY.v
addfile -c -auto C:/intelFPGA/17.0/project/buf_out1.v
addfile -c -auto C:/intelFPGA/17.0/project/buf_io1.v
addfile -c -auto C:/intelFPGA/17.0/project/buf34_out.v
addfile -c -auto C:/intelFPGA/17.0/project/bufin20.v
addfile -c -auto C:/intelFPGA/17.0/project/bufout10.v
addfile -c -auto C:/intelFPGA/17.0/project/bufout7.v
addfile -c -auto C:/intelFPGA/17.0/project/bufi1.v
addfile -c -auto C:/intelFPGA/17.0/project/bufout17.v
addfile -c -auto C:/intelFPGA/17.0/project/bufi6.v
addfile -c -auto C:/intelFPGA/17.0/project/bufout16.v
addfile -c -auto C:/intelFPGA/17.0/project/bufout18.v
alib mypll
alog  -v2k5 -dbg -work mypll c:/intelfpga/17.0/project/db/ip/mypll/mypll.v +incdir+c:/intelfpga/17.0/project/db/ip/mypll
alog  -v2k5 -dbg -work mypll c:/intelfpga/17.0/project/db/ip/mypll/submodules/mypll_altclkctrl_0.v +incdir+c:/intelfpga/17.0/project/db/ip/mypll/submodules

