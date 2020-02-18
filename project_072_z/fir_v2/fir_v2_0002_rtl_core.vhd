-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fir_v2_0002_rtl_core
-- VHDL created on Tue Oct 08 10:54:20 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fir_v2_0002_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(27 downto 0);  -- sfix28
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(55 downto 0);  -- sfix56
        clk : in std_logic;
        areset : in std_logic
    );
end fir_v2_0002_rtl_core;

architecture normal of fir_v2_0002_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_count0_inner_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_count0_inner_i : SIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra10_count0_inner_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra10_count0_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_count0_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra10_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra10_count1_lutreg_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_count1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_count1_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra10_count1_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra10_count1_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra10_count1_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_ra10_add_0_0_a : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_add_0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_add_0_0_o : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_add_0_0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra21_count1_lutreg_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_ra21_add_0_0_a : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra21_add_0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra21_add_0_0_o : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra21_add_0_0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_we12_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we12_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we21_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we21_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we21_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we21_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we21_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we21_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we21_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we21_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa10_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_wa10_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa10_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa12_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_wa12_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa12_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa21_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_wa21_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa21_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr1_ia : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_iq : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr3_ia : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_iq : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr5_ia : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_iq : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_q : STD_LOGIC_VECTOR (55 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split7_c_14_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr7_ia : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_iq : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_q : STD_LOGIC_VECTOR (55 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_b_14_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr9_ia : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_iq : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr12_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr12_ia : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr12_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr12_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr12_iq : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr12_q : STD_LOGIC_VECTOR (27 downto 0);
    signal d_u0_m0_wo0_wi0_r0_memr12_q_14_q : STD_LOGIC_VECTOR (27 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split13_b_14_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr13_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr13_ia : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr13_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr13_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr13_iq : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr15_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr15_ia : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr15_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr15_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr15_iq : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr15_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr17_ia : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_iq : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr19_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr19_ia : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr19_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr19_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr19_iq : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr19_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_memr21_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr21_ia : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr21_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr21_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr21_iq : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_memr21_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_ca10_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_ca10_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_ca10_i : signal is true;
    signal u0_m0_wo0_ca10_eq : std_logic;
    attribute preserve of u0_m0_wo0_ca10_eq : signal is true;
    signal d_u0_m0_wo0_ca10_q_14_q : STD_LOGIC_VECTOR (3 downto 0);
    signal d_u0_m0_wo0_ca10_q_15_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm2_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm3_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm4_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm5_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm6_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm7_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm8_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm9_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_cm10_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_sym_add0_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add0_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add0_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add1_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add1_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add1_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add2_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add2_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add2_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add2_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add3_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add3_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add3_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add3_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add4_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add4_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add4_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add4_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add5_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add5_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add5_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add5_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add6_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add6_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add6_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add6_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add7_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add7_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add7_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add7_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add8_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add8_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add8_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add8_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add9_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add9_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add9_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_sym_add9_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : STD_LOGIC_VECTOR (52 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : STD_LOGIC_VECTOR (52 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : STD_LOGIC_VECTOR (52 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : STD_LOGIC_VECTOR (52 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_result_add_0_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_result_add_0_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_result_add_0_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_result_add_0_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_a : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_o : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_a : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_b : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_o : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_reset : std_logic;
    type u0_m0_wo0_mtree_mult1_10_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_a0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 0);
    attribute preserve of u0_m0_wo0_mtree_mult1_10_im0_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 0);
    attribute preserve of u0_m0_wo0_mtree_mult1_10_im0_cma_c0 : signal is true;
    type u0_m0_wo0_mtree_mult1_10_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_p : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_u : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_w : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_x : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_y : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_s : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_im0_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_reset : std_logic;
    type u0_m0_wo0_mtree_mult1_10_im8_cma_a0type is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_a0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 0);
    attribute preserve of u0_m0_wo0_mtree_mult1_10_im8_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_c0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 0);
    attribute preserve of u0_m0_wo0_mtree_mult1_10_im8_cma_c0 : signal is true;
    type u0_m0_wo0_mtree_mult1_10_im8_cma_ptype is array(NATURAL range <>) of SIGNED(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_p : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_u : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_w : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_x : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_y : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_s : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_qq : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_im8_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_a0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_10_ma3_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_c0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_10_ma3_cma_c0 : signal is true;
    type u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_l : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    type u0_m0_wo0_mtree_mult1_10_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_p : u0_m0_wo0_mtree_mult1_10_ma3_cma_ptype(0 to 1);
    type u0_m0_wo0_mtree_mult1_10_ma3_cma_utype is array(NATURAL range <>) of SIGNED(30 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_u : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_w : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_x : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_y : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_s : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_ma3_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_a0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_p : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 1);
    type u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype is array(NATURAL range <>) of UNSIGNED(36 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_a0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_p : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_a0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_p : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_a0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_p : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_a0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_p : u0_m0_wo0_mtree_mult1_10_im0_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_reset : std_logic;
    type u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type is array(NATURAL range <>) of SIGNED(1 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    type u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ptype is array(NATURAL range <>) of SIGNED(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_qq : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_a0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_p : u0_m0_wo0_mtree_mult1_10_ma3_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_u : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_w : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_x : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_y : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_s : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_c0 : signal is true;
    type u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ptype is array(NATURAL range <>) of SIGNED(12 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ptype(0 to 1);
    type u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype is array(NATURAL range <>) of SIGNED(13 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_qq : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_qq : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_a0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_p : u0_m0_wo0_mtree_mult1_10_ma3_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_u : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_w : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_x : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_y : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_s : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_qq : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_qq : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_a0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_p : u0_m0_wo0_mtree_mult1_10_ma3_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_u : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_w : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_x : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_y : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_s : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_qq : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_qq : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_a0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_p : u0_m0_wo0_mtree_mult1_10_ma3_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_u : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_w : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_x : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_y : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_s : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_qq : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_10_im8_cma_ptype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_qq : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_a0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im0_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_r : u0_m0_wo0_mtree_mult1_10_ma3_cma_ltype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_p : u0_m0_wo0_mtree_mult1_10_ma3_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_u : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_w : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_x : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_y : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_s : u0_m0_wo0_mtree_mult1_10_ma3_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_ena1 : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_a0 : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_c0 : u0_m0_wo0_mtree_mult1_10_im8_cma_a0type(0 to 1);
    attribute preserve of u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_c0 : signal is true;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_p : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ptype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_u : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_w : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_x : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_y : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_s : u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_qq : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_ena1 : std_logic;
    signal d_xIn_0_13_mem_reset0 : std_logic;
    signal d_xIn_0_13_mem_ia : STD_LOGIC_VECTOR (27 downto 0);
    signal d_xIn_0_13_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_mem_iq : STD_LOGIC_VECTOR (27 downto 0);
    signal d_xIn_0_13_mem_q : STD_LOGIC_VECTOR (27 downto 0);
    signal d_xIn_0_13_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of d_xIn_0_13_rdcnt_i : signal is true;
    signal d_xIn_0_13_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of d_xIn_0_13_sticky_ena_q : signal is true;
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_mem_reset0 : std_logic;
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_mem_ia : STD_LOGIC_VECTOR (27 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_mem_iq : STD_LOGIC_VECTOR (27 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_mem_q : STD_LOGIC_VECTOR (27 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_i : signal is true;
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of d_u0_m0_wo0_wi0_r0_split9_c_16_sticky_ena_q : signal is true;
    signal u0_m0_wo0_wi0_r0_ra10_count0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_c_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_count1_lut_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_ra21_count1_lut_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_resize_in : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_ra10_resize_b : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_ra21_resize_in : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_ra21_resize_b : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_c : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split3_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split3_c : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split5_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split5_c : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split7_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split7_c : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_c : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split13_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split13_c : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split15_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split15_c : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split17_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split17_c : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split19_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_wi0_r0_split19_c : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_b0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_b0_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs6_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_a0_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_a0_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_join_11_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_align_12_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_align_12_qint : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a0_b18_q : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a0_b18_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b0_qint : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b18_q : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b18_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a0_b18_q : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a0_b18_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b0_qint : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b18_q : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b18_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a0_b18_q : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a0_b18_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b0_qint : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b18_q : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b18_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a0_b18_q : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a0_b18_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b0_qint : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b18_q : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b18_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a0_b18_q : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a0_b18_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b0_qint : STD_LOGIC_VECTOR (47 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b18_q : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b18_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs2_in : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs2_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs5_in : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs5_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs10_in : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_bs10_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_join1_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_join3_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_join5_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_join7_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_join9_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_join13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_join15_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_join17_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_wi0_r0_join19_q : STD_LOGIC_VECTOR (55 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_run(ENABLEGENERATOR,13)@10 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(4 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(8, 5);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(4) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-9);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(4 downto 4));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11";
                WHEN "100" => u0_m0_wo0_run_inc := "00";
                WHEN "101" => u0_m0_wo0_run_inc := "01";
                WHEN "110" => u0_m0_wo0_run_inc := "11";
                WHEN "111" => u0_m0_wo0_run_inc := "00";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,14)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,340)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,16)@13
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_13_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_20(DELAY,341)@13 + 7
    d_u0_m0_wo0_compute_q_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_20_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,129)@20 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "000000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 9;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(5 downto 5));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_21(DELAY,342)@20 + 1
    d_u0_m0_wo0_compute_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_20_q, xout => d_u0_m0_wo0_compute_q_21_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_split9_c_16_notEnable(LOGICAL,362)@13
    d_u0_m0_wo0_wi0_r0_split9_c_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- d_u0_m0_wo0_wi0_r0_split9_c_16_nor(LOGICAL,363)@13
    d_u0_m0_wo0_wi0_r0_split9_c_16_nor_q <= not (d_u0_m0_wo0_wi0_r0_split9_c_16_notEnable_q or d_u0_m0_wo0_wi0_r0_split9_c_16_sticky_ena_q);

    -- d_u0_m0_wo0_wi0_r0_split9_c_16_cmpReg(REG,361)@13 + 1
    d_u0_m0_wo0_wi0_r0_split9_c_16_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_r0_split9_c_16_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_r0_split9_c_16_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_split9_c_16_sticky_ena(REG,364)@13 + 1
    d_u0_m0_wo0_wi0_r0_split9_c_16_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_r0_split9_c_16_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_wi0_r0_split9_c_16_nor_q = "1") THEN
                d_u0_m0_wo0_wi0_r0_split9_c_16_sticky_ena_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_split9_c_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_split9_c_16_enaAnd(LOGICAL,365)@13
    d_u0_m0_wo0_wi0_r0_split9_c_16_enaAnd_q <= d_u0_m0_wo0_wi0_r0_split9_c_16_sticky_ena_q and VCC_q;

    -- d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt(COUNTER,359)@13 + 1
    -- low=0, high=1, step=1, init=0
    d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_i <= d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_i, 1)));

    -- u0_m0_wo0_wi0_r0_ra10_count1(COUNTER,24)@12
    -- low=0, high=9, step=1, init=1
    u0_m0_wo0_wi0_r0_ra10_count1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra10_count1_i <= TO_UNSIGNED(1, 4);
            u0_m0_wo0_wi0_r0_ra10_count1_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra10_count1_i = TO_UNSIGNED(8, 4)) THEN
                    u0_m0_wo0_wi0_r0_ra10_count1_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra10_count1_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra10_count1_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra10_count1_i <= u0_m0_wo0_wi0_r0_ra10_count1_i + 7;
                ELSE
                    u0_m0_wo0_wi0_r0_ra10_count1_i <= u0_m0_wo0_wi0_r0_ra10_count1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra10_count1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra10_count1_i, 4)));

    -- u0_m0_wo0_wi0_r0_ra10_count1_lut(LOOKUP,22)@12
    u0_m0_wo0_wi0_r0_ra10_count1_lut_combproc: PROCESS (u0_m0_wo0_wi0_r0_ra10_count1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra10_count1_q) IS
            WHEN "0000" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "01100";
            WHEN "0001" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "01101";
            WHEN "0010" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "01110";
            WHEN "0011" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "01111";
            WHEN "0100" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "00000";
            WHEN "0101" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "00001";
            WHEN "0110" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "00010";
            WHEN "0111" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "00011";
            WHEN "1000" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "00100";
            WHEN "1001" => u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= "00101";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra10_count1_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra10_count1_lutreg(REG,23)@12
    u0_m0_wo0_wi0_r0_ra10_count1_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra10_count1_lutreg_q <= "01100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra10_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra10_count1_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra10_count0_inner(COUNTER,19)@12
    -- low=-1, high=8, step=-1, init=8
    u0_m0_wo0_wi0_r0_ra10_count0_inner_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra10_count0_inner_i <= TO_SIGNED(8, 5);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra10_count0_inner_i(4 downto 4) = "1") THEN
                    u0_m0_wo0_wi0_r0_ra10_count0_inner_i <= u0_m0_wo0_wi0_r0_ra10_count0_inner_i - 23;
                ELSE
                    u0_m0_wo0_wi0_r0_ra10_count0_inner_i <= u0_m0_wo0_wi0_r0_ra10_count0_inner_i - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra10_count0_inner_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra10_count0_inner_i, 5)));

    -- u0_m0_wo0_wi0_r0_ra10_count0_run(LOGICAL,20)@12
    u0_m0_wo0_wi0_r0_ra10_count0_run_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra10_count0_inner_q(4 downto 4));

    -- u0_m0_wo0_wi0_r0_ra10_count0(COUNTER,21)@12
    -- low=0, high=15, step=1, init=0
    u0_m0_wo0_wi0_r0_ra10_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra10_count0_i <= TO_UNSIGNED(0, 4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1" and u0_m0_wo0_wi0_r0_ra10_count0_run_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra10_count0_i <= u0_m0_wo0_wi0_r0_ra10_count0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra10_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra10_count0_i, 5)));

    -- u0_m0_wo0_wi0_r0_ra10_add_0_0(ADD,25)@12 + 1
    u0_m0_wo0_wi0_r0_ra10_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra10_count0_q);
    u0_m0_wo0_wi0_r0_ra10_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra10_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra10_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra10_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra10_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra10_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra10_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra10_add_0_0_q <= u0_m0_wo0_wi0_r0_ra10_add_0_0_o(5 downto 0);

    -- u0_m0_wo0_wi0_r0_ra10_resize(BITSELECT,26)@13
    u0_m0_wo0_wi0_r0_ra10_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra10_add_0_0_q(3 downto 0));
    u0_m0_wo0_wi0_r0_ra10_resize_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra10_resize_in(3 downto 0));

    -- d_xIn_0_13_notEnable(LOGICAL,354)@10
    d_xIn_0_13_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- d_xIn_0_13_nor(LOGICAL,355)@10
    d_xIn_0_13_nor_q <= not (d_xIn_0_13_notEnable_q or d_xIn_0_13_sticky_ena_q);

    -- d_xIn_0_13_cmpReg(REG,353)@10 + 1
    d_xIn_0_13_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_13_sticky_ena(REG,356)@10 + 1
    d_xIn_0_13_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_xIn_0_13_nor_q = "1") THEN
                d_xIn_0_13_sticky_ena_q <= STD_LOGIC_VECTOR(d_xIn_0_13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_xIn_0_13_enaAnd(LOGICAL,357)@10
    d_xIn_0_13_enaAnd_q <= d_xIn_0_13_sticky_ena_q and VCC_q;

    -- d_xIn_0_13_rdcnt(COUNTER,351)@10 + 1
    -- low=0, high=1, step=1, init=0
    d_xIn_0_13_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_rdcnt_i <= d_xIn_0_13_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_xIn_0_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(d_xIn_0_13_rdcnt_i, 1)));

    -- d_xIn_0_13_wraddr(REG,352)@10 + 1
    d_xIn_0_13_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_wraddr_q <= STD_LOGIC_VECTOR(d_xIn_0_13_rdcnt_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_13_mem(DUALMEM,350)@10 + 2
    d_xIn_0_13_mem_ia <= STD_LOGIC_VECTOR(xIn_0);
    d_xIn_0_13_mem_aa <= d_xIn_0_13_wraddr_q;
    d_xIn_0_13_mem_ab <= d_xIn_0_13_rdcnt_q;
    d_xIn_0_13_mem_reset0 <= areset;
    d_xIn_0_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 28,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 28,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken1 => d_xIn_0_13_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => d_xIn_0_13_mem_reset0,
        clock1 => clk,
        address_a => d_xIn_0_13_mem_aa,
        data_a => d_xIn_0_13_mem_ia,
        wren_a => VCC_q(0),
        address_b => d_xIn_0_13_mem_ab,
        q_b => d_xIn_0_13_mem_iq
    );
    d_xIn_0_13_mem_q <= d_xIn_0_13_mem_iq(27 downto 0);

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,339)@10 + 3
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,47)@13
    -- low=0, high=15, step=1, init=5
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(5, 4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 4)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,51)@13
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_mem_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra10_resize_b;
    u0_m0_wo0_wi0_r0_memr0_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 28,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 28,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(27 downto 0);

    -- u0_m0_wo0_wi0_r0_join1(BITJOIN,52)@13
    u0_m0_wo0_wi0_r0_join1_q <= u0_m0_wo0_wi0_r0_split1_b & u0_m0_wo0_wi0_r0_memr0_q;

    -- u0_m0_wo0_wi0_r0_memr1(DUALMEM,54)@13
    u0_m0_wo0_wi0_r0_memr1_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join1_q);
    u0_m0_wo0_wi0_r0_memr1_aa <= u0_m0_wo0_wi0_r0_wa10_q;
    u0_m0_wo0_wi0_r0_memr1_ab <= u0_m0_wo0_wi0_r0_ra10_resize_b;
    u0_m0_wo0_wi0_r0_memr1_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 56,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr1_aa,
        data_a => u0_m0_wo0_wi0_r0_memr1_ia,
        wren_a => u0_m0_wo0_wi0_r0_we12_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr1_ab,
        q_b => u0_m0_wo0_wi0_r0_memr1_iq
    );
    u0_m0_wo0_wi0_r0_memr1_q <= u0_m0_wo0_wi0_r0_memr1_iq(55 downto 0);

    -- u0_m0_wo0_wi0_r0_split1(BITSELECT,53)@13
    u0_m0_wo0_wi0_r0_split1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(27 downto 0));
    u0_m0_wo0_wi0_r0_split1_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(55 downto 28));

    -- u0_m0_wo0_wi0_r0_join3(BITJOIN,55)@13
    u0_m0_wo0_wi0_r0_join3_q <= u0_m0_wo0_wi0_r0_split3_b & u0_m0_wo0_wi0_r0_split1_c;

    -- u0_m0_wo0_wi0_r0_memr3(DUALMEM,57)@13
    u0_m0_wo0_wi0_r0_memr3_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join3_q);
    u0_m0_wo0_wi0_r0_memr3_aa <= u0_m0_wo0_wi0_r0_wa10_q;
    u0_m0_wo0_wi0_r0_memr3_ab <= u0_m0_wo0_wi0_r0_ra10_resize_b;
    u0_m0_wo0_wi0_r0_memr3_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 56,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr3_aa,
        data_a => u0_m0_wo0_wi0_r0_memr3_ia,
        wren_a => u0_m0_wo0_wi0_r0_we12_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr3_ab,
        q_b => u0_m0_wo0_wi0_r0_memr3_iq
    );
    u0_m0_wo0_wi0_r0_memr3_q <= u0_m0_wo0_wi0_r0_memr3_iq(55 downto 0);

    -- u0_m0_wo0_wi0_r0_split3(BITSELECT,56)@13
    u0_m0_wo0_wi0_r0_split3_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr3_q(27 downto 0));
    u0_m0_wo0_wi0_r0_split3_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr3_q(55 downto 28));

    -- u0_m0_wo0_wi0_r0_join5(BITJOIN,58)@13
    u0_m0_wo0_wi0_r0_join5_q <= u0_m0_wo0_wi0_r0_split5_b & u0_m0_wo0_wi0_r0_split3_c;

    -- u0_m0_wo0_wi0_r0_memr5(DUALMEM,60)@13
    u0_m0_wo0_wi0_r0_memr5_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join5_q);
    u0_m0_wo0_wi0_r0_memr5_aa <= u0_m0_wo0_wi0_r0_wa10_q;
    u0_m0_wo0_wi0_r0_memr5_ab <= u0_m0_wo0_wi0_r0_ra10_resize_b;
    u0_m0_wo0_wi0_r0_memr5_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 56,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr5_aa,
        data_a => u0_m0_wo0_wi0_r0_memr5_ia,
        wren_a => u0_m0_wo0_wi0_r0_we12_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr5_ab,
        q_b => u0_m0_wo0_wi0_r0_memr5_iq
    );
    u0_m0_wo0_wi0_r0_memr5_q <= u0_m0_wo0_wi0_r0_memr5_iq(55 downto 0);

    -- u0_m0_wo0_wi0_r0_split5(BITSELECT,59)@13
    u0_m0_wo0_wi0_r0_split5_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr5_q(27 downto 0));
    u0_m0_wo0_wi0_r0_split5_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr5_q(55 downto 28));

    -- u0_m0_wo0_wi0_r0_join7(BITJOIN,61)@13
    u0_m0_wo0_wi0_r0_join7_q <= u0_m0_wo0_wi0_r0_split7_b & u0_m0_wo0_wi0_r0_split5_c;

    -- u0_m0_wo0_wi0_r0_memr7(DUALMEM,63)@13
    u0_m0_wo0_wi0_r0_memr7_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join7_q);
    u0_m0_wo0_wi0_r0_memr7_aa <= u0_m0_wo0_wi0_r0_wa10_q;
    u0_m0_wo0_wi0_r0_memr7_ab <= u0_m0_wo0_wi0_r0_ra10_resize_b;
    u0_m0_wo0_wi0_r0_memr7_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 56,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr7_aa,
        data_a => u0_m0_wo0_wi0_r0_memr7_ia,
        wren_a => u0_m0_wo0_wi0_r0_we12_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr7_ab,
        q_b => u0_m0_wo0_wi0_r0_memr7_iq
    );
    u0_m0_wo0_wi0_r0_memr7_q <= u0_m0_wo0_wi0_r0_memr7_iq(55 downto 0);

    -- u0_m0_wo0_wi0_r0_split7(BITSELECT,62)@13
    u0_m0_wo0_wi0_r0_split7_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr7_q(27 downto 0));
    u0_m0_wo0_wi0_r0_split7_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr7_q(55 downto 28));

    -- u0_m0_wo0_wi0_r0_join9(BITJOIN,64)@13
    u0_m0_wo0_wi0_r0_join9_q <= u0_m0_wo0_wi0_r0_split9_b & u0_m0_wo0_wi0_r0_split7_c;

    -- u0_m0_wo0_wi0_r0_we21_1(REG,38)@13
    u0_m0_wo0_wi0_r0_we21_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we21_1_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we21_1_q <= u0_m0_wo0_wi0_r0_we12_2_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we21_2(REG,39)@13
    u0_m0_wo0_wi0_r0_we21_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we21_2_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we21_2_q <= u0_m0_wo0_wi0_r0_we21_1_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we21_3(REG,40)@13
    u0_m0_wo0_wi0_r0_we21_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we21_3_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we21_3_q <= u0_m0_wo0_wi0_r0_we21_2_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we21_4(REG,41)@13
    u0_m0_wo0_wi0_r0_we21_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we21_4_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we21_4_q <= u0_m0_wo0_wi0_r0_we21_3_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we21_5(REG,42)@13
    u0_m0_wo0_wi0_r0_we21_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we21_5_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we21_5_q <= u0_m0_wo0_wi0_r0_we21_4_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we21_6(REG,43)@13
    u0_m0_wo0_wi0_r0_we21_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we21_6_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we21_6_q <= u0_m0_wo0_wi0_r0_we21_5_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we21_7(REG,44)@13
    u0_m0_wo0_wi0_r0_we21_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we21_7_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we21_7_q <= u0_m0_wo0_wi0_r0_we21_6_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we21_8(REG,45)@13
    u0_m0_wo0_wi0_r0_we21_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we21_8_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we21_8_q <= u0_m0_wo0_wi0_r0_we21_7_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we12_1(REG,35)@13
    u0_m0_wo0_wi0_r0_we12_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we12_1_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we12_1_q <= u0_m0_wo0_wi0_r0_we21_8_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we12_2(REG,36)@13
    u0_m0_wo0_wi0_r0_we12_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we12_2_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_wi0_r0_we12_2_q <= u0_m0_wo0_wi0_r0_we12_1_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we12(LOGICAL,37)@13
    u0_m0_wo0_wi0_r0_we12_q <= u0_m0_wo0_wi0_r0_we12_2_q and u0_m0_wo0_compute_q;

    -- u0_m0_wo0_wi0_r0_wa10(COUNTER,48)@13
    -- low=0, high=15, step=1, init=6
    u0_m0_wo0_wi0_r0_wa10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa10_i <= TO_UNSIGNED(6, 4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_we12_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa10_i <= u0_m0_wo0_wi0_r0_wa10_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa10_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa10_i, 4)));

    -- u0_m0_wo0_wi0_r0_memr9(DUALMEM,66)@13
    u0_m0_wo0_wi0_r0_memr9_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join9_q);
    u0_m0_wo0_wi0_r0_memr9_aa <= u0_m0_wo0_wi0_r0_wa10_q;
    u0_m0_wo0_wi0_r0_memr9_ab <= u0_m0_wo0_wi0_r0_ra10_resize_b;
    u0_m0_wo0_wi0_r0_memr9_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 56,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr9_aa,
        data_a => u0_m0_wo0_wi0_r0_memr9_ia,
        wren_a => u0_m0_wo0_wi0_r0_we12_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr9_ab,
        q_b => u0_m0_wo0_wi0_r0_memr9_iq
    );
    u0_m0_wo0_wi0_r0_memr9_q <= u0_m0_wo0_wi0_r0_memr9_iq(55 downto 0);

    -- u0_m0_wo0_wi0_r0_split9(BITSELECT,65)@13
    u0_m0_wo0_wi0_r0_split9_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(27 downto 0));
    u0_m0_wo0_wi0_r0_split9_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(55 downto 28));

    -- d_u0_m0_wo0_wi0_r0_split9_c_16_wraddr(REG,360)@13 + 1
    d_u0_m0_wo0_wi0_r0_split9_c_16_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_r0_split9_c_16_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_r0_split9_c_16_wraddr_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_split9_c_16_mem(DUALMEM,358)@13 + 2
    d_u0_m0_wo0_wi0_r0_split9_c_16_mem_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split9_c);
    d_u0_m0_wo0_wi0_r0_split9_c_16_mem_aa <= d_u0_m0_wo0_wi0_r0_split9_c_16_wraddr_q;
    d_u0_m0_wo0_wi0_r0_split9_c_16_mem_ab <= d_u0_m0_wo0_wi0_r0_split9_c_16_rdcnt_q;
    d_u0_m0_wo0_wi0_r0_split9_c_16_mem_reset0 <= areset;
    d_u0_m0_wo0_wi0_r0_split9_c_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 28,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 28,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_r0_split9_c_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo0_wi0_r0_split9_c_16_mem_reset0,
        clock1 => clk,
        address_a => d_u0_m0_wo0_wi0_r0_split9_c_16_mem_aa,
        data_a => d_u0_m0_wo0_wi0_r0_split9_c_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => d_u0_m0_wo0_wi0_r0_split9_c_16_mem_ab,
        q_b => d_u0_m0_wo0_wi0_r0_split9_c_16_mem_iq
    );
    d_u0_m0_wo0_wi0_r0_split9_c_16_mem_q <= d_u0_m0_wo0_wi0_r0_split9_c_16_mem_iq(27 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_bs5(BITSELECT,150)@16
    u0_m0_wo0_mtree_mult1_10_bs5_in <= STD_LOGIC_VECTOR("0" & d_u0_m0_wo0_wi0_r0_split9_c_16_mem_q);
    u0_m0_wo0_mtree_mult1_10_bs5_b <= u0_m0_wo0_mtree_mult1_10_bs5_in(28 downto 18);

    -- u0_m0_wo0_ca10(COUNTER,82)@13
    -- low=0, high=9, step=1, init=0
    u0_m0_wo0_ca10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca10_i <= TO_UNSIGNED(0, 4);
            u0_m0_wo0_ca10_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca10_i = TO_UNSIGNED(8, 4)) THEN
                    u0_m0_wo0_ca10_eq <= '1';
                ELSE
                    u0_m0_wo0_ca10_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca10_eq = '1') THEN
                    u0_m0_wo0_ca10_i <= u0_m0_wo0_ca10_i + 7;
                ELSE
                    u0_m0_wo0_ca10_i <= u0_m0_wo0_ca10_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca10_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca10_i, 4)));

    -- d_u0_m0_wo0_ca10_q_14(DELAY,348)@13 + 1
    d_u0_m0_wo0_ca10_q_14 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_ca10_q, xout => d_u0_m0_wo0_ca10_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_ca10_q_15(DELAY,349)@14 + 1
    d_u0_m0_wo0_ca10_q_15 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_ca10_q_14_q, xout => d_u0_m0_wo0_ca10_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm10(LOOKUP,96)@15 + 1
    u0_m0_wo0_cm10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm10_q <= "00000000000000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca10_q_15_q) IS
                WHEN "0000" => u0_m0_wo0_cm10_q <= "00000000000000000000";
                WHEN "0001" => u0_m0_wo0_cm10_q <= "00000000000000000000";
                WHEN "0010" => u0_m0_wo0_cm10_q <= "00000000000000000000";
                WHEN "0011" => u0_m0_wo0_cm10_q <= "00000000000000000000";
                WHEN "0100" => u0_m0_wo0_cm10_q <= "00000000000000000000";
                WHEN "0101" => u0_m0_wo0_cm10_q <= "00000000000000000000";
                WHEN "0110" => u0_m0_wo0_cm10_q <= "00000000000000000000";
                WHEN "0111" => u0_m0_wo0_cm10_q <= "00000000000000000000";
                WHEN "1000" => u0_m0_wo0_cm10_q <= "00000000000000000000";
                WHEN "1001" => u0_m0_wo0_cm10_q <= "01111111111111111111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm10_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_10_bs4(BITSELECT,149)@16
    u0_m0_wo0_mtree_mult1_10_bs4_in <= STD_LOGIC_VECTOR(u0_m0_wo0_cm10_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_10_bs4_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_10_bs4_in(17 downto 0));

    -- u0_m0_wo0_mtree_mult1_10_bs6(BITSELECT,151)@16
    u0_m0_wo0_mtree_mult1_10_bs6_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm10_q(19 downto 18));

    -- u0_m0_wo0_mtree_mult1_10_bs2(BITSELECT,147)@16
    u0_m0_wo0_mtree_mult1_10_bs2_in <= d_u0_m0_wo0_wi0_r0_split9_c_16_mem_q(17 downto 0);
    u0_m0_wo0_mtree_mult1_10_bs2_b <= u0_m0_wo0_mtree_mult1_10_bs2_in(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_ma3_cma(CHAINMULTADD,297)@16 + 2
    u0_m0_wo0_mtree_mult1_10_ma3_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_10_ma3_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_10_ma3_cma_ena1 <= u0_m0_wo0_mtree_mult1_10_ma3_cma_ena0;
    u0_m0_wo0_mtree_mult1_10_ma3_cma_l(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_10_ma3_cma_a0(0),19));
    u0_m0_wo0_mtree_mult1_10_ma3_cma_l(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_10_ma3_cma_a0(1),19));
    u0_m0_wo0_mtree_mult1_10_ma3_cma_p(0) <= u0_m0_wo0_mtree_mult1_10_ma3_cma_l(0) * u0_m0_wo0_mtree_mult1_10_ma3_cma_c0(0);
    u0_m0_wo0_mtree_mult1_10_ma3_cma_p(1) <= u0_m0_wo0_mtree_mult1_10_ma3_cma_l(1) * u0_m0_wo0_mtree_mult1_10_ma3_cma_c0(1);
    u0_m0_wo0_mtree_mult1_10_ma3_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_10_ma3_cma_p(0),31);
    u0_m0_wo0_mtree_mult1_10_ma3_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_10_ma3_cma_p(1),31);
    u0_m0_wo0_mtree_mult1_10_ma3_cma_w(0) <= u0_m0_wo0_mtree_mult1_10_ma3_cma_u(0) + u0_m0_wo0_mtree_mult1_10_ma3_cma_u(1);
    u0_m0_wo0_mtree_mult1_10_ma3_cma_x(0) <= u0_m0_wo0_mtree_mult1_10_ma3_cma_w(0);
    u0_m0_wo0_mtree_mult1_10_ma3_cma_y(0) <= u0_m0_wo0_mtree_mult1_10_ma3_cma_x(0);
    u0_m0_wo0_mtree_mult1_10_ma3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_ma3_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_10_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_10_ma3_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_10_ma3_cma_a0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_10_bs2_b),18);
                u0_m0_wo0_mtree_mult1_10_ma3_cma_a0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_10_bs4_b),18);
                u0_m0_wo0_mtree_mult1_10_ma3_cma_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_10_bs6_b),11);
                u0_m0_wo0_mtree_mult1_10_ma3_cma_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_10_bs5_b),11);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_ma3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_10_ma3_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_10_ma3_cma_s(0) <= u0_m0_wo0_mtree_mult1_10_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_10_ma3_cma_s(0)(29 downto 0)), xout => u0_m0_wo0_mtree_mult1_10_ma3_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_10_ma3_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_10_ma3_cma_qq(29 downto 0));

    -- u0_m0_wo0_mtree_mult1_10_align_12(BITSHIFT,157)@18
    u0_m0_wo0_mtree_mult1_10_align_12_qint <= u0_m0_wo0_mtree_mult1_10_ma3_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_10_align_12_q <= u0_m0_wo0_mtree_mult1_10_align_12_qint(47 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_bs10(BITSELECT,155)@16
    u0_m0_wo0_mtree_mult1_10_bs10_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => d_u0_m0_wo0_wi0_r0_split9_c_16_mem_q(27)) & d_u0_m0_wo0_wi0_r0_split9_c_16_mem_q));
    u0_m0_wo0_mtree_mult1_10_bs10_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_10_bs10_in(28 downto 18));

    -- u0_m0_wo0_mtree_mult1_10_im8_cma(CHAINMULTADD,296)@16 + 2
    u0_m0_wo0_mtree_mult1_10_im8_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_10_im8_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_10_im8_cma_ena1 <= u0_m0_wo0_mtree_mult1_10_im8_cma_ena0;
    u0_m0_wo0_mtree_mult1_10_im8_cma_p(0) <= u0_m0_wo0_mtree_mult1_10_im8_cma_a0(0) * u0_m0_wo0_mtree_mult1_10_im8_cma_c0(0);
    u0_m0_wo0_mtree_mult1_10_im8_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_10_im8_cma_p(0),22);
    u0_m0_wo0_mtree_mult1_10_im8_cma_w(0) <= u0_m0_wo0_mtree_mult1_10_im8_cma_u(0);
    u0_m0_wo0_mtree_mult1_10_im8_cma_x(0) <= u0_m0_wo0_mtree_mult1_10_im8_cma_w(0);
    u0_m0_wo0_mtree_mult1_10_im8_cma_y(0) <= u0_m0_wo0_mtree_mult1_10_im8_cma_x(0);
    u0_m0_wo0_mtree_mult1_10_im8_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_im8_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_10_im8_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_10_im8_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_10_im8_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_10_bs10_b),11);
                u0_m0_wo0_mtree_mult1_10_im8_cma_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_10_bs6_b),11);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_im8_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_im8_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_10_im8_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_10_im8_cma_s(0) <= u0_m0_wo0_mtree_mult1_10_im8_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_im8_cma_delay : dspba_delay
    GENERIC MAP ( width => 22, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_10_im8_cma_s(0)(21 downto 0)), xout => u0_m0_wo0_mtree_mult1_10_im8_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_10_im8_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_10_im8_cma_qq(12 downto 0));

    -- u0_m0_wo0_mtree_mult1_10_bs1(BITSELECT,146)@16
    u0_m0_wo0_mtree_mult1_10_bs1_in <= u0_m0_wo0_cm10_q(17 downto 0);
    u0_m0_wo0_mtree_mult1_10_bs1_b <= u0_m0_wo0_mtree_mult1_10_bs1_in(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_im0_cma(CHAINMULTADD,295)@16 + 2
    u0_m0_wo0_mtree_mult1_10_im0_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_10_im0_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_10_im0_cma_ena1 <= u0_m0_wo0_mtree_mult1_10_im0_cma_ena0;
    u0_m0_wo0_mtree_mult1_10_im0_cma_p(0) <= u0_m0_wo0_mtree_mult1_10_im0_cma_a0(0) * u0_m0_wo0_mtree_mult1_10_im0_cma_c0(0);
    u0_m0_wo0_mtree_mult1_10_im0_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_10_im0_cma_p(0),36);
    u0_m0_wo0_mtree_mult1_10_im0_cma_w(0) <= u0_m0_wo0_mtree_mult1_10_im0_cma_u(0);
    u0_m0_wo0_mtree_mult1_10_im0_cma_x(0) <= u0_m0_wo0_mtree_mult1_10_im0_cma_w(0);
    u0_m0_wo0_mtree_mult1_10_im0_cma_y(0) <= u0_m0_wo0_mtree_mult1_10_im0_cma_x(0);
    u0_m0_wo0_mtree_mult1_10_im0_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_im0_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_10_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_10_im0_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_10_im0_cma_a0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_10_bs1_b),18);
                u0_m0_wo0_mtree_mult1_10_im0_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_10_bs2_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_im0_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_im0_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_10_im0_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_10_im0_cma_s(0) <= u0_m0_wo0_mtree_mult1_10_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_10_im0_cma_s(0)(35 downto 0)), xout => u0_m0_wo0_mtree_mult1_10_im0_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_10_im0_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_10_im0_cma_qq(35 downto 0));

    -- u0_m0_wo0_mtree_mult1_10_join_11(BITJOIN,156)@18
    u0_m0_wo0_mtree_mult1_10_join_11_q <= u0_m0_wo0_mtree_mult1_10_im8_cma_q & u0_m0_wo0_mtree_mult1_10_im0_cma_q;

    -- u0_m0_wo0_mtree_mult1_10_result_add_0_0(ADD,159)@18 + 1
    u0_m0_wo0_mtree_mult1_10_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 49 => u0_m0_wo0_mtree_mult1_10_join_11_q(48)) & u0_m0_wo0_mtree_mult1_10_join_11_q));
    u0_m0_wo0_mtree_mult1_10_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 48 => u0_m0_wo0_mtree_mult1_10_align_12_q(47)) & u0_m0_wo0_mtree_mult1_10_align_12_q));
    u0_m0_wo0_mtree_mult1_10_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_10_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_10_result_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_10_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_result_add_0_0_q <= u0_m0_wo0_mtree_mult1_10_result_add_0_0_o(49 downto 0);

    -- u0_m0_wo0_wi0_r0_ra21_count1_lut(LOOKUP,30)@12
    u0_m0_wo0_wi0_r0_ra21_count1_lut_combproc: PROCESS (u0_m0_wo0_wi0_r0_ra10_count1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra10_count1_q) IS
            WHEN "0000" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "00101";
            WHEN "0001" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "00100";
            WHEN "0010" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "00011";
            WHEN "0011" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "00010";
            WHEN "0100" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "00001";
            WHEN "0101" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "00000";
            WHEN "0110" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "01111";
            WHEN "0111" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "01110";
            WHEN "1000" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "01101";
            WHEN "1001" => u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= "01100";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra21_count1_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra21_count1_lutreg(REG,31)@12
    u0_m0_wo0_wi0_r0_ra21_count1_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra21_count1_lutreg_q <= "00101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra21_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra21_count1_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra21_add_0_0(ADD,33)@12 + 1
    u0_m0_wo0_wi0_r0_ra21_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra10_count0_q);
    u0_m0_wo0_wi0_r0_ra21_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra21_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra21_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra21_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra21_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra21_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra21_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra21_add_0_0_q <= u0_m0_wo0_wi0_r0_ra21_add_0_0_o(5 downto 0);

    -- u0_m0_wo0_wi0_r0_ra21_resize(BITSELECT,34)@13
    u0_m0_wo0_wi0_r0_ra21_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra21_add_0_0_q(3 downto 0));
    u0_m0_wo0_wi0_r0_ra21_resize_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra21_resize_in(3 downto 0));

    -- u0_m0_wo0_wi0_r0_wa12(COUNTER,49)@13
    -- low=0, high=15, step=1, init=7
    u0_m0_wo0_wi0_r0_wa12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa12_i <= TO_UNSIGNED(7, 4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_we12_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa12_i <= u0_m0_wo0_wi0_r0_wa12_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa12_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa12_i, 4)));

    -- u0_m0_wo0_wi0_r0_memr12(DUALMEM,67)@13
    u0_m0_wo0_wi0_r0_memr12_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split9_b);
    u0_m0_wo0_wi0_r0_memr12_aa <= u0_m0_wo0_wi0_r0_wa12_q;
    u0_m0_wo0_wi0_r0_memr12_ab <= u0_m0_wo0_wi0_r0_ra21_resize_b;
    u0_m0_wo0_wi0_r0_memr12_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 28,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 28,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr12_aa,
        data_a => u0_m0_wo0_wi0_r0_memr12_ia,
        wren_a => u0_m0_wo0_wi0_r0_we12_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr12_ab,
        q_b => u0_m0_wo0_wi0_r0_memr12_iq
    );
    u0_m0_wo0_wi0_r0_memr12_q <= u0_m0_wo0_wi0_r0_memr12_iq(27 downto 0);

    -- u0_m0_wo0_wi0_r0_join13(BITJOIN,68)@13
    u0_m0_wo0_wi0_r0_join13_q <= u0_m0_wo0_wi0_r0_split13_b & u0_m0_wo0_wi0_r0_memr12_q;

    -- u0_m0_wo0_wi0_r0_we21(LOGICAL,46)@13
    u0_m0_wo0_wi0_r0_we21_q <= u0_m0_wo0_wi0_r0_we21_8_q and u0_m0_wo0_compute_q;

    -- u0_m0_wo0_wi0_r0_wa21(COUNTER,50)@13
    -- low=0, high=15, step=1, init=7
    u0_m0_wo0_wi0_r0_wa21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa21_i <= TO_UNSIGNED(7, 4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_we21_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa21_i <= u0_m0_wo0_wi0_r0_wa21_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa21_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa21_i, 4)));

    -- u0_m0_wo0_wi0_r0_memr13(DUALMEM,70)@13
    u0_m0_wo0_wi0_r0_memr13_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join13_q);
    u0_m0_wo0_wi0_r0_memr13_aa <= u0_m0_wo0_wi0_r0_wa21_q;
    u0_m0_wo0_wi0_r0_memr13_ab <= u0_m0_wo0_wi0_r0_ra21_resize_b;
    u0_m0_wo0_wi0_r0_memr13_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 56,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr13_aa,
        data_a => u0_m0_wo0_wi0_r0_memr13_ia,
        wren_a => u0_m0_wo0_wi0_r0_we21_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr13_ab,
        q_b => u0_m0_wo0_wi0_r0_memr13_iq
    );
    u0_m0_wo0_wi0_r0_memr13_q <= u0_m0_wo0_wi0_r0_memr13_iq(55 downto 0);

    -- u0_m0_wo0_wi0_r0_split13(BITSELECT,69)@13
    u0_m0_wo0_wi0_r0_split13_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr13_q(27 downto 0));
    u0_m0_wo0_wi0_r0_split13_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr13_q(55 downto 28));

    -- d_u0_m0_wo0_wi0_r0_split13_b_14(DELAY,347)@13 + 1
    d_u0_m0_wo0_wi0_r0_split13_b_14 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split13_b, xout => d_u0_m0_wo0_wi0_r0_split13_b_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_split7_c_14(DELAY,343)@13 + 1
    d_u0_m0_wo0_wi0_r0_split7_c_14 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split7_c, xout => d_u0_m0_wo0_wi0_r0_split7_c_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_sym_add8(ADD,105)@14 + 1
    u0_m0_wo0_sym_add8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => d_u0_m0_wo0_wi0_r0_split7_c_14_q(27)) & d_u0_m0_wo0_wi0_r0_split7_c_14_q));
    u0_m0_wo0_sym_add8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => d_u0_m0_wo0_wi0_r0_split13_b_14_q(27)) & d_u0_m0_wo0_wi0_r0_split13_b_14_q));
    u0_m0_wo0_sym_add8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add8_a) + SIGNED(u0_m0_wo0_sym_add8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add8_q <= u0_m0_wo0_sym_add8_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_a0_merged_bit_select(BITSELECT,336)@15
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add8_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add8_q(28 downto 18));

    -- u0_m0_wo0_cm8(LOOKUP,94)@14 + 1
    u0_m0_wo0_cm8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm8_q <= "00000110000011001100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca10_q_14_q) IS
                WHEN "0000" => u0_m0_wo0_cm8_q <= "00000110000011001100";
                WHEN "0001" => u0_m0_wo0_cm8_q <= "11110111110010111000";
                WHEN "0010" => u0_m0_wo0_cm8_q <= "11110111111001001101";
                WHEN "0011" => u0_m0_wo0_cm8_q <= "00000011111010000000";
                WHEN "0100" => u0_m0_wo0_cm8_q <= "00001000010111010001";
                WHEN "0101" => u0_m0_wo0_cm8_q <= "11111111110001000111";
                WHEN "0110" => u0_m0_wo0_cm8_q <= "11111000101011101010";
                WHEN "0111" => u0_m0_wo0_cm8_q <= "11111101011101110101";
                WHEN "1000" => u0_m0_wo0_cm8_q <= "00000101011100101000";
                WHEN "1001" => u0_m0_wo0_cm8_q <= "00000100010000111101";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm8_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_b0_merged_bit_select(BITSELECT,326)@15
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm8_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm8_q(19 downto 18));

    -- d_u0_m0_wo0_wi0_r0_memr12_q_14(DELAY,346)@13 + 1
    d_u0_m0_wo0_wi0_r0_memr12_q_14 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr12_q, xout => d_u0_m0_wo0_wi0_r0_memr12_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_split9_b_14(DELAY,344)@13 + 1
    d_u0_m0_wo0_wi0_r0_split9_b_14 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split9_b, xout => d_u0_m0_wo0_wi0_r0_split9_b_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_sym_add9(ADD,106)@14 + 1
    u0_m0_wo0_sym_add9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => d_u0_m0_wo0_wi0_r0_split9_b_14_q(27)) & d_u0_m0_wo0_wi0_r0_split9_b_14_q));
    u0_m0_wo0_sym_add9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => d_u0_m0_wo0_wi0_r0_memr12_q_14_q(27)) & d_u0_m0_wo0_wi0_r0_memr12_q_14_q));
    u0_m0_wo0_sym_add9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add9_a) + SIGNED(u0_m0_wo0_sym_add9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add9_q <= u0_m0_wo0_sym_add9_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_a0_merged_bit_select(BITSELECT,337)@15
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add9_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add9_q(28 downto 18));

    -- u0_m0_wo0_cm9(LOOKUP,95)@14 + 1
    u0_m0_wo0_cm9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm9_q <= "01010101001100101110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca10_q_14_q) IS
                WHEN "0000" => u0_m0_wo0_cm9_q <= "01010101001100101110";
                WHEN "0001" => u0_m0_wo0_cm9_q <= "00000010001110110000";
                WHEN "0010" => u0_m0_wo0_cm9_q <= "11011000001101111011";
                WHEN "0011" => u0_m0_wo0_cm9_q <= "11101110000111110111";
                WHEN "0100" => u0_m0_wo0_cm9_q <= "00010010001110101011";
                WHEN "0101" => u0_m0_wo0_cm9_q <= "00010011001111111101";
                WHEN "0110" => u0_m0_wo0_cm9_q <= "11111010000101010000";
                WHEN "0111" => u0_m0_wo0_cm9_q <= "11101111010010010101";
                WHEN "1000" => u0_m0_wo0_cm9_q <= "11111110010111001000";
                WHEN "1001" => u0_m0_wo0_cm9_q <= "00001100101100000000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm9_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_b0_merged_bit_select(BITSELECT,327)@15
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_q(19 downto 18));

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma(CHAINMULTADD,302)@15 + 2
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_ena1 <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_ena0;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_p(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_a0(0) * u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_c0(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_p(1) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_a0(1) * u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_c0(1);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_p(0),37);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_p(1),37);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_w(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_u(0) + u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_u(1);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_x(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_w(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_y(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_x(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_a0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_a0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_s(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_s(0)(36 downto 0)), xout => u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_qq(36 downto 0));

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma(CHAINMULTADD,317)@15 + 2
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_c0(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_c0(1);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_p(0),14);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_p(1),14);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_a0_merged_bit_select_c),11);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 14, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_s(0)(13 downto 0)), xout => u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_qq(13 downto 0));

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b18(BITSHIFT,276)@17
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b18_qint <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b18_merged_cma_q & "000000000000000000000000000000000000";
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b18_q <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b18_qint(49 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1(ADD,278)@17 + 1
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 50 => u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b18_q(49)) & u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b18_q));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000" & u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_cma_q));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_q <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_o(50 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma(CHAINMULTADD,316)@15 + 2
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_p(0),31);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_p(1),31);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_b0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_s(0)(29 downto 0)), xout => u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_qq(29 downto 0));

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b0(BITSHIFT,274)@17
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b0_qint <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a18_b0_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b0_q <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b0_qint(47 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma(CHAINMULTADD,315)@15 + 2
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_p(0),22);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_p(1),22);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 21, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_s(0)(20 downto 0)), xout => u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_qq(20 downto 0));

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a0_b18(BITSHIFT,272)@17
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a0_b18_qint <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_1_mpart_a0_b18_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a0_b18_q <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a0_b18_qint(38 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0(ADD,277)@17 + 1
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 39 => u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a0_b18_q(38)) & u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a0_b18_q));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b0_q(47)) & u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_replace_shiftup_a18_b0_q));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_q <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_o(48 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0(ADD,279)@18 + 1
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 49 => u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_q(48)) & u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_0_q));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 51 => u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_q(50)) & u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_0_1_q));
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_q <= u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_o(51 downto 0);

    -- u0_m0_wo0_mtree_add1_2(ADD,126)@19 + 1
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_u0_m0_wo0_mtree_add0_4_u0_m0_wo0_mtree_mult1_9_merged_adder_tree_add_1_0_q(50 downto 0));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 50 => u0_m0_wo0_mtree_mult1_10_result_add_0_0_q(49)) & u0_m0_wo0_mtree_mult1_10_result_add_0_0_q));
    u0_m0_wo0_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(50 downto 0);

    -- u0_m0_wo0_wi0_r0_join15(BITJOIN,71)@13
    u0_m0_wo0_wi0_r0_join15_q <= u0_m0_wo0_wi0_r0_split15_b & u0_m0_wo0_wi0_r0_split13_c;

    -- u0_m0_wo0_wi0_r0_memr15(DUALMEM,73)@13
    u0_m0_wo0_wi0_r0_memr15_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join15_q);
    u0_m0_wo0_wi0_r0_memr15_aa <= u0_m0_wo0_wi0_r0_wa21_q;
    u0_m0_wo0_wi0_r0_memr15_ab <= u0_m0_wo0_wi0_r0_ra21_resize_b;
    u0_m0_wo0_wi0_r0_memr15_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 56,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr15_aa,
        data_a => u0_m0_wo0_wi0_r0_memr15_ia,
        wren_a => u0_m0_wo0_wi0_r0_we21_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr15_ab,
        q_b => u0_m0_wo0_wi0_r0_memr15_iq
    );
    u0_m0_wo0_wi0_r0_memr15_q <= u0_m0_wo0_wi0_r0_memr15_iq(55 downto 0);

    -- u0_m0_wo0_wi0_r0_split15(BITSELECT,72)@13
    u0_m0_wo0_wi0_r0_split15_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr15_q(27 downto 0));
    u0_m0_wo0_wi0_r0_split15_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr15_q(55 downto 28));

    -- u0_m0_wo0_sym_add6(ADD,103)@13 + 1
    u0_m0_wo0_sym_add6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split5_c(27)) & u0_m0_wo0_wi0_r0_split5_c));
    u0_m0_wo0_sym_add6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split15_b(27)) & u0_m0_wo0_wi0_r0_split15_b));
    u0_m0_wo0_sym_add6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add6_a) + SIGNED(u0_m0_wo0_sym_add6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add6_q <= u0_m0_wo0_sym_add6_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_a0_merged_bit_select(BITSELECT,334)@14
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add6_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add6_q(28 downto 18));

    -- u0_m0_wo0_cm6(LOOKUP,92)@13 + 1
    u0_m0_wo0_cm6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm6_q <= "11111100110010111100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "0000" => u0_m0_wo0_cm6_q <= "11111100110010111100";
                WHEN "0001" => u0_m0_wo0_cm6_q <= "11111111111000010000";
                WHEN "0010" => u0_m0_wo0_cm6_q <= "00000010110101010110";
                WHEN "0011" => u0_m0_wo0_cm6_q <= "00000001001011011011";
                WHEN "0100" => u0_m0_wo0_cm6_q <= "11111101111001011100";
                WHEN "0101" => u0_m0_wo0_cm6_q <= "11111110001001010101";
                WHEN "0110" => u0_m0_wo0_cm6_q <= "00000001001100001011";
                WHEN "0111" => u0_m0_wo0_cm6_q <= "00000010000111100000";
                WHEN "1000" => u0_m0_wo0_cm6_q <= "11111111101110110001";
                WHEN "1001" => u0_m0_wo0_cm6_q <= "11111101111111101100";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm6_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_b0_merged_bit_select(BITSELECT,324)@14
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm6_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm6_q(19 downto 18));

    -- u0_m0_wo0_sym_add7(ADD,104)@13 + 1
    u0_m0_wo0_sym_add7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split7_b(27)) & u0_m0_wo0_wi0_r0_split7_b));
    u0_m0_wo0_sym_add7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split13_c(27)) & u0_m0_wo0_wi0_r0_split13_c));
    u0_m0_wo0_sym_add7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add7_a) + SIGNED(u0_m0_wo0_sym_add7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add7_q <= u0_m0_wo0_sym_add7_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_a0_merged_bit_select(BITSELECT,335)@14
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add7_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add7_q(28 downto 18));

    -- u0_m0_wo0_cm7(LOOKUP,93)@13 + 1
    u0_m0_wo0_cm7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm7_q <= "11111100110011001011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "0000" => u0_m0_wo0_cm7_q <= "11111100110011001011";
                WHEN "0001" => u0_m0_wo0_cm7_q <= "11111011000001110111";
                WHEN "0010" => u0_m0_wo0_cm7_q <= "00000000111110001001";
                WHEN "0011" => u0_m0_wo0_cm7_q <= "00000100110010000110";
                WHEN "0100" => u0_m0_wo0_cm7_q <= "00000000111011101110";
                WHEN "0101" => u0_m0_wo0_cm7_q <= "11111100000101010101";
                WHEN "0110" => u0_m0_wo0_cm7_q <= "11111101101100010010";
                WHEN "0111" => u0_m0_wo0_cm7_q <= "00000010101000101110";
                WHEN "1000" => u0_m0_wo0_cm7_q <= "00000011000011111011";
                WHEN "1001" => u0_m0_wo0_cm7_q <= "11111110110010100010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm7_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_b0_merged_bit_select(BITSELECT,325)@14
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm7_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm7_q(19 downto 18));

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma(CHAINMULTADD,301)@14 + 2
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_ena1 <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_ena0;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_p(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_a0(0) * u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_c0(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_p(1) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_a0(1) * u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_c0(1);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_p(0),37);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_p(1),37);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_w(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_u(0) + u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_u(1);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_x(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_w(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_y(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_x(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_a0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_a0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_s(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_s(0)(36 downto 0)), xout => u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_qq(36 downto 0));

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma(CHAINMULTADD,314)@14 + 2
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_c0(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_c0(1);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_p(0),14);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_p(1),14);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_a0_merged_bit_select_c),11);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 14, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_s(0)(13 downto 0)), xout => u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_qq(13 downto 0));

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b18(BITSHIFT,252)@16
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b18_qint <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b18_merged_cma_q & "000000000000000000000000000000000000";
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b18_q <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b18_qint(49 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1(ADD,254)@16 + 1
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 50 => u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b18_q(49)) & u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b18_q));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000" & u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_cma_q));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_q <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_o(50 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma(CHAINMULTADD,313)@14 + 2
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_p(0),31);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_p(1),31);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_b0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_s(0)(29 downto 0)), xout => u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_qq(29 downto 0));

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b0(BITSHIFT,250)@16
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b0_qint <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a18_b0_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b0_q <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b0_qint(47 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma(CHAINMULTADD,312)@14 + 2
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_p(0),22);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_p(1),22);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 21, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_s(0)(20 downto 0)), xout => u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_qq(20 downto 0));

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a0_b18(BITSHIFT,248)@16
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a0_b18_qint <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_1_mpart_a0_b18_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a0_b18_q <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a0_b18_qint(38 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0(ADD,253)@16 + 1
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 39 => u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a0_b18_q(38)) & u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a0_b18_q));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b0_q(47)) & u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_replace_shiftup_a18_b0_q));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_q <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_o(48 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0(ADD,255)@17 + 1
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 49 => u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_q(48)) & u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_0_q));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 51 => u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_q(50)) & u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_0_1_q));
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_q <= u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_o(51 downto 0);

    -- u0_m0_wo0_wi0_r0_join17(BITJOIN,74)@13
    u0_m0_wo0_wi0_r0_join17_q <= u0_m0_wo0_wi0_r0_split17_b & u0_m0_wo0_wi0_r0_split15_c;

    -- u0_m0_wo0_wi0_r0_memr17(DUALMEM,76)@13
    u0_m0_wo0_wi0_r0_memr17_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join17_q);
    u0_m0_wo0_wi0_r0_memr17_aa <= u0_m0_wo0_wi0_r0_wa21_q;
    u0_m0_wo0_wi0_r0_memr17_ab <= u0_m0_wo0_wi0_r0_ra21_resize_b;
    u0_m0_wo0_wi0_r0_memr17_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 56,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr17_aa,
        data_a => u0_m0_wo0_wi0_r0_memr17_ia,
        wren_a => u0_m0_wo0_wi0_r0_we21_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr17_ab,
        q_b => u0_m0_wo0_wi0_r0_memr17_iq
    );
    u0_m0_wo0_wi0_r0_memr17_q <= u0_m0_wo0_wi0_r0_memr17_iq(55 downto 0);

    -- u0_m0_wo0_wi0_r0_split17(BITSELECT,75)@13
    u0_m0_wo0_wi0_r0_split17_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr17_q(27 downto 0));
    u0_m0_wo0_wi0_r0_split17_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr17_q(55 downto 28));

    -- u0_m0_wo0_sym_add4(ADD,101)@13 + 1
    u0_m0_wo0_sym_add4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split3_c(27)) & u0_m0_wo0_wi0_r0_split3_c));
    u0_m0_wo0_sym_add4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split17_b(27)) & u0_m0_wo0_wi0_r0_split17_b));
    u0_m0_wo0_sym_add4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add4_a) + SIGNED(u0_m0_wo0_sym_add4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add4_q <= u0_m0_wo0_sym_add4_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_a0_merged_bit_select(BITSELECT,332)@14
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add4_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add4_q(28 downto 18));

    -- u0_m0_wo0_cm4(LOOKUP,90)@13 + 1
    u0_m0_wo0_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm4_q <= "00000000110100100101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "0000" => u0_m0_wo0_cm4_q <= "00000000110100100101";
                WHEN "0001" => u0_m0_wo0_cm4_q <= "00000000110100101111";
                WHEN "0010" => u0_m0_wo0_cm4_q <= "11111111100101010000";
                WHEN "0011" => u0_m0_wo0_cm4_q <= "11111111000110111110";
                WHEN "0100" => u0_m0_wo0_cm4_q <= "00000000000010000011";
                WHEN "0101" => u0_m0_wo0_cm4_q <= "00000000110011010110";
                WHEN "0110" => u0_m0_wo0_cm4_q <= "00000000010001101110";
                WHEN "0111" => u0_m0_wo0_cm4_q <= "11111111011001011000";
                WHEN "1000" => u0_m0_wo0_cm4_q <= "11111111100001101000";
                WHEN "1001" => u0_m0_wo0_cm4_q <= "00000000010110011101";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm4_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_b0_merged_bit_select(BITSELECT,322)@14
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q(19 downto 18));

    -- u0_m0_wo0_sym_add5(ADD,102)@13 + 1
    u0_m0_wo0_sym_add5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split5_b(27)) & u0_m0_wo0_wi0_r0_split5_b));
    u0_m0_wo0_sym_add5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split15_c(27)) & u0_m0_wo0_wi0_r0_split15_c));
    u0_m0_wo0_sym_add5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add5_a) + SIGNED(u0_m0_wo0_sym_add5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add5_q <= u0_m0_wo0_sym_add5_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_a0_merged_bit_select(BITSELECT,333)@14
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add5_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add5_q(28 downto 18));

    -- u0_m0_wo0_cm5(LOOKUP,91)@13 + 1
    u0_m0_wo0_cm5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm5_q <= "11111111011110111101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "0000" => u0_m0_wo0_cm5_q <= "11111111011110111101";
                WHEN "0001" => u0_m0_wo0_cm5_q <= "00000001100110101110";
                WHEN "0010" => u0_m0_wo0_cm5_q <= "00000001000100100011";
                WHEN "0011" => u0_m0_wo0_cm5_q <= "11111110111101110100";
                WHEN "0100" => u0_m0_wo0_cm5_q <= "11111110101001011101";
                WHEN "0101" => u0_m0_wo0_cm5_q <= "00000000011010100000";
                WHEN "0110" => u0_m0_wo0_cm5_q <= "00000001010111100001";
                WHEN "0111" => u0_m0_wo0_cm5_q <= "00000000001001011110";
                WHEN "1000" => u0_m0_wo0_cm5_q <= "11111110110101011001";
                WHEN "1001" => u0_m0_wo0_cm5_q <= "11111111011011001111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm5_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_b0_merged_bit_select(BITSELECT,323)@14
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm5_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm5_q(19 downto 18));

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma(CHAINMULTADD,300)@14 + 2
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_ena1 <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_ena0;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_p(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_a0(0) * u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_c0(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_p(1) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_a0(1) * u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_c0(1);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_p(0),37);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_p(1),37);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_w(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_u(0) + u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_u(1);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_x(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_w(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_y(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_x(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_a0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_a0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_s(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_s(0)(36 downto 0)), xout => u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_qq(36 downto 0));

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma(CHAINMULTADD,311)@14 + 2
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_c0(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_c0(1);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_p(0),14);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_p(1),14);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_a0_merged_bit_select_c),11);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 14, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_s(0)(13 downto 0)), xout => u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_qq(13 downto 0));

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b18(BITSHIFT,228)@16
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b18_qint <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b18_merged_cma_q & "000000000000000000000000000000000000";
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b18_q <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b18_qint(49 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1(ADD,230)@16 + 1
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 50 => u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b18_q(49)) & u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b18_q));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000" & u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_cma_q));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_q <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_o(50 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma(CHAINMULTADD,310)@14 + 2
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_p(0),31);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_p(1),31);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_b0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_s(0)(29 downto 0)), xout => u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_qq(29 downto 0));

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b0(BITSHIFT,226)@16
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b0_qint <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a18_b0_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b0_q <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b0_qint(47 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma(CHAINMULTADD,309)@14 + 2
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_p(0),22);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_p(1),22);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 21, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_s(0)(20 downto 0)), xout => u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_qq(20 downto 0));

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a0_b18(BITSHIFT,224)@16
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a0_b18_qint <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_1_mpart_a0_b18_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a0_b18_q <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a0_b18_qint(38 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0(ADD,229)@16 + 1
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 39 => u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a0_b18_q(38)) & u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a0_b18_q));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b0_q(47)) & u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_replace_shiftup_a18_b0_q));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_q <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_o(48 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0(ADD,231)@17 + 1
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 49 => u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_q(48)) & u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_0_q));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 51 => u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_q(50)) & u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_0_1_q));
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_q <= u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_o(51 downto 0);

    -- u0_m0_wo0_mtree_add1_1(ADD,125)@18 + 1
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_u0_m0_wo0_mtree_add0_2_u0_m0_wo0_mtree_mult1_5_merged_adder_tree_add_1_0_q(50 downto 0));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_u0_m0_wo0_mtree_add0_3_u0_m0_wo0_mtree_mult1_7_merged_adder_tree_add_1_0_q(50 downto 0));
    u0_m0_wo0_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(50 downto 0);

    -- u0_m0_wo0_wi0_r0_join19(BITJOIN,77)@13
    u0_m0_wo0_wi0_r0_join19_q <= u0_m0_wo0_wi0_r0_split19_b & u0_m0_wo0_wi0_r0_split17_c;

    -- u0_m0_wo0_wi0_r0_memr19(DUALMEM,79)@13
    u0_m0_wo0_wi0_r0_memr19_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join19_q);
    u0_m0_wo0_wi0_r0_memr19_aa <= u0_m0_wo0_wi0_r0_wa21_q;
    u0_m0_wo0_wi0_r0_memr19_ab <= u0_m0_wo0_wi0_r0_ra21_resize_b;
    u0_m0_wo0_wi0_r0_memr19_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 56,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 56,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr19_aa,
        data_a => u0_m0_wo0_wi0_r0_memr19_ia,
        wren_a => u0_m0_wo0_wi0_r0_we21_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr19_ab,
        q_b => u0_m0_wo0_wi0_r0_memr19_iq
    );
    u0_m0_wo0_wi0_r0_memr19_q <= u0_m0_wo0_wi0_r0_memr19_iq(55 downto 0);

    -- u0_m0_wo0_wi0_r0_split19(BITSELECT,78)@13
    u0_m0_wo0_wi0_r0_split19_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr19_q(27 downto 0));
    u0_m0_wo0_wi0_r0_split19_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr19_q(55 downto 28));

    -- u0_m0_wo0_sym_add2(ADD,99)@13 + 1
    u0_m0_wo0_sym_add2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split1_c(27)) & u0_m0_wo0_wi0_r0_split1_c));
    u0_m0_wo0_sym_add2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split19_b(27)) & u0_m0_wo0_wi0_r0_split19_b));
    u0_m0_wo0_sym_add2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add2_a) + SIGNED(u0_m0_wo0_sym_add2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add2_q <= u0_m0_wo0_sym_add2_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_a0_merged_bit_select(BITSELECT,330)@14
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add2_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add2_q(28 downto 18));

    -- u0_m0_wo0_cm2(LOOKUP,88)@13 + 1
    u0_m0_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm2_q <= "00000000000010010010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "0000" => u0_m0_wo0_cm2_q <= "00000000000010010010";
                WHEN "0001" => u0_m0_wo0_cm2_q <= "11111111101111011001";
                WHEN "0010" => u0_m0_wo0_cm2_q <= "11111111110111100111";
                WHEN "0011" => u0_m0_wo0_cm2_q <= "00000000001010111110";
                WHEN "0100" => u0_m0_wo0_cm2_q <= "00000000001011011011";
                WHEN "0101" => u0_m0_wo0_cm2_q <= "11111111111011000111";
                WHEN "0110" => u0_m0_wo0_cm2_q <= "11111111110100011001";
                WHEN "0111" => u0_m0_wo0_cm2_q <= "11111111111111101000";
                WHEN "1000" => u0_m0_wo0_cm2_q <= "00000000001001101010";
                WHEN "1001" => u0_m0_wo0_cm2_q <= "00000000000100000111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_b0_merged_bit_select(BITSELECT,320)@14
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm2_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm2_q(19 downto 18));

    -- u0_m0_wo0_sym_add3(ADD,100)@13 + 1
    u0_m0_wo0_sym_add3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split3_b(27)) & u0_m0_wo0_wi0_r0_split3_b));
    u0_m0_wo0_sym_add3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split17_c(27)) & u0_m0_wo0_wi0_r0_split17_c));
    u0_m0_wo0_sym_add3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add3_a) + SIGNED(u0_m0_wo0_sym_add3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add3_q <= u0_m0_wo0_sym_add3_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_a0_merged_bit_select(BITSELECT,331)@14
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add3_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add3_q(28 downto 18));

    -- u0_m0_wo0_cm3(LOOKUP,89)@13 + 1
    u0_m0_wo0_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm3_q <= "00000000100011010011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "0000" => u0_m0_wo0_cm3_q <= "00000000100011010011";
                WHEN "0001" => u0_m0_wo0_cm3_q <= "11111111111001110001";
                WHEN "0010" => u0_m0_wo0_cm3_q <= "11111111011110101011";
                WHEN "0011" => u0_m0_wo0_cm3_q <= "11111111111000101110";
                WHEN "0100" => u0_m0_wo0_cm3_q <= "00000000011010010101";
                WHEN "0101" => u0_m0_wo0_cm3_q <= "00000000010000011100";
                WHEN "0110" => u0_m0_wo0_cm3_q <= "11111111101111011010";
                WHEN "0111" => u0_m0_wo0_cm3_q <= "11111111101011010110";
                WHEN "1000" => u0_m0_wo0_cm3_q <= "00000000000110011100";
                WHEN "1001" => u0_m0_wo0_cm3_q <= "00000000010100010110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm3_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_b0_merged_bit_select(BITSELECT,321)@14
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm3_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm3_q(19 downto 18));

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma(CHAINMULTADD,299)@14 + 2
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_ena1 <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_ena0;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_p(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_a0(0) * u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_c0(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_p(1) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_a0(1) * u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_c0(1);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_p(0),37);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_p(1),37);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_w(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_u(0) + u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_u(1);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_x(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_w(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_y(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_x(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_a0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_a0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_s(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_s(0)(36 downto 0)), xout => u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_qq(36 downto 0));

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma(CHAINMULTADD,308)@14 + 2
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_c0(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_c0(1);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_p(0),14);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_p(1),14);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_a0_merged_bit_select_c),11);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 14, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_s(0)(13 downto 0)), xout => u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_qq(13 downto 0));

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b18(BITSHIFT,204)@16
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b18_qint <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b18_merged_cma_q & "000000000000000000000000000000000000";
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b18_q <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b18_qint(49 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1(ADD,206)@16 + 1
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 50 => u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b18_q(49)) & u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b18_q));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000" & u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_cma_q));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_q <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_o(50 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma(CHAINMULTADD,307)@14 + 2
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_p(0),31);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_p(1),31);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_b0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_s(0)(29 downto 0)), xout => u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_qq(29 downto 0));

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b0(BITSHIFT,202)@16
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b0_qint <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a18_b0_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b0_q <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b0_qint(47 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma(CHAINMULTADD,306)@14 + 2
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_p(0),22);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_p(1),22);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 21, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_s(0)(20 downto 0)), xout => u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_qq(20 downto 0));

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a0_b18(BITSHIFT,200)@16
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a0_b18_qint <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_1_mpart_a0_b18_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a0_b18_q <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a0_b18_qint(38 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0(ADD,205)@16 + 1
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 39 => u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a0_b18_q(38)) & u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a0_b18_q));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b0_q(47)) & u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_replace_shiftup_a18_b0_q));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_q <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_o(48 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0(ADD,207)@17 + 1
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 49 => u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_q(48)) & u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_0_q));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 51 => u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_q(50)) & u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_0_1_q));
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_q <= u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_o(51 downto 0);

    -- u0_m0_wo0_wi0_r0_memr21(DUALMEM,80)@13
    u0_m0_wo0_wi0_r0_memr21_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split19_c);
    u0_m0_wo0_wi0_r0_memr21_aa <= u0_m0_wo0_wi0_r0_wa21_q;
    u0_m0_wo0_wi0_r0_memr21_ab <= u0_m0_wo0_wi0_r0_ra21_resize_b;
    u0_m0_wo0_wi0_r0_memr21_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 28,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 28,
        widthad_b => 4,
        numwords_b => 16,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Arria V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr21_aa,
        data_a => u0_m0_wo0_wi0_r0_memr21_ia,
        wren_a => u0_m0_wo0_wi0_r0_we21_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr21_ab,
        q_b => u0_m0_wo0_wi0_r0_memr21_iq
    );
    u0_m0_wo0_wi0_r0_memr21_q <= u0_m0_wo0_wi0_r0_memr21_iq(27 downto 0);

    -- u0_m0_wo0_sym_add0(ADD,97)@13 + 1
    u0_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_memr0_q(27)) & u0_m0_wo0_wi0_r0_memr0_q));
    u0_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_memr21_q(27)) & u0_m0_wo0_wi0_r0_memr21_q));
    u0_m0_wo0_sym_add0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add0_a) + SIGNED(u0_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add0_q <= u0_m0_wo0_sym_add0_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_a0_merged_bit_select(BITSELECT,328)@14
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add0_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add0_q(28 downto 18));

    -- u0_m0_wo0_cm0(LOOKUP,86)@13 + 1
    u0_m0_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "11111111111100110000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "0000" => u0_m0_wo0_cm0_q <= "11111111111100110000";
                WHEN "0001" => u0_m0_wo0_cm0_q <= "11111111111111110110";
                WHEN "0010" => u0_m0_wo0_cm0_q <= "00000000000010011001";
                WHEN "0011" => u0_m0_wo0_cm0_q <= "00000000000000100010";
                WHEN "0100" => u0_m0_wo0_cm0_q <= "11111111111100101100";
                WHEN "0101" => u0_m0_wo0_cm0_q <= "11111111111011011000";
                WHEN "0110" => u0_m0_wo0_cm0_q <= "11111111111101011000";
                WHEN "0111" => u0_m0_wo0_cm0_q <= "11111111111111111100";
                WHEN "1000" => u0_m0_wo0_cm0_q <= "00000000000000110110";
                WHEN "1001" => u0_m0_wo0_cm0_q <= "00000000000000011110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_b0_merged_bit_select(BITSELECT,318)@14
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q(19 downto 18));

    -- u0_m0_wo0_sym_add1(ADD,98)@13 + 1
    u0_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split1_b(27)) & u0_m0_wo0_wi0_r0_split1_b));
    u0_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_wi0_r0_split19_c(27)) & u0_m0_wo0_wi0_r0_split19_c));
    u0_m0_wo0_sym_add1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add1_a) + SIGNED(u0_m0_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add1_q <= u0_m0_wo0_sym_add1_o(28 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_a0_merged_bit_select(BITSELECT,329)@14
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_a0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add1_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_a0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add1_q(28 downto 18));

    -- u0_m0_wo0_cm1(LOOKUP,87)@13 + 1
    u0_m0_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "11111111111001100010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca10_q) IS
                WHEN "0000" => u0_m0_wo0_cm1_q <= "11111111111001100010";
                WHEN "0001" => u0_m0_wo0_cm1_q <= "11111111111010000000";
                WHEN "0010" => u0_m0_wo0_cm1_q <= "00000000000011000001";
                WHEN "0011" => u0_m0_wo0_cm1_q <= "00000000000110001100";
                WHEN "0100" => u0_m0_wo0_cm1_q <= "11111111111111111110";
                WHEN "0101" => u0_m0_wo0_cm1_q <= "11111111111010111000";
                WHEN "0110" => u0_m0_wo0_cm1_q <= "11111111111101111110";
                WHEN "0111" => u0_m0_wo0_cm1_q <= "00000000000011011000";
                WHEN "1000" => u0_m0_wo0_cm1_q <= "00000000000011000001";
                WHEN "1001" => u0_m0_wo0_cm1_q <= "11111111111110011001";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_b0_merged_bit_select(BITSELECT,319)@14
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_b0_merged_bit_select_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_q(17 downto 0));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_b0_merged_bit_select_c <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_q(19 downto 18));

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma(CHAINMULTADD,298)@14 + 2
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_ena1 <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_ena0;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_p(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_a0(0) * u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_c0(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_p(1) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_a0(1) * u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_c0(1);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_p(0),37);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_p(1),37);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_w(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_u(0) + u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_u(1);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_x(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_w(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_y(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_x(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_a0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_a0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_s(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_s(0)(36 downto 0)), xout => u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_qq(36 downto 0));

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma(CHAINMULTADD,305)@14 + 2
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_c0(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_c0(1);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_p(0),14);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_p(1),14);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_a0_merged_bit_select_c),11);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 14, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_s(0)(13 downto 0)), xout => u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_qq(13 downto 0));

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b18(BITSHIFT,180)@16
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b18_qint <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b18_merged_cma_q & "000000000000000000000000000000000000";
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b18_q <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b18_qint(49 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1(ADD,182)@16 + 1
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 50 => u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b18_q(49)) & u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b18_q));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000" & u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_cma_q));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_q <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_o(50 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma(CHAINMULTADD,304)@14 + 2
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_p(0),31);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_p(1),31);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_a0_merged_bit_select_c),11);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_b0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_b0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_s(0)(29 downto 0)), xout => u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_qq(29 downto 0));

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b0(BITSHIFT,178)@16
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b0_qint <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a18_b0_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a18_b0_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a18_b0_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b0_q <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b0_qint(47 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma(CHAINMULTADD,303)@14 + 2
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ena0 <= '1';
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ena1 <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ena0;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_r(0) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_c0(0),19));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_r(1) <= SIGNED(RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_c0(1),19));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_p(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0(0) * u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_r(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_p(1) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0(1) * u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_r(1);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_p(0),22);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_p(1),22);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_w(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_u(0) + u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_u(1);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_x(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_w(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_y(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_x(0);
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_b0_merged_bit_select_c),2);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_replace_split_a0_merged_bit_select_b),18);
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_replace_split_a0_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_s(0) <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 21, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_s(0)(20 downto 0)), xout => u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_qq(20 downto 0));

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a0_b18(BITSHIFT,176)@16
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a0_b18_qint <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_0_mpart_a0_b18_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_a0_b18_add_u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_1_mpart_a0_b18_merged_cma_q & "000000000000000000";
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a0_b18_q <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a0_b18_qint(38 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0(ADD,181)@16 + 1
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 39 => u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a0_b18_q(38)) & u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a0_b18_q));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b0_q(47)) & u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_replace_shiftup_a18_b0_q));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_q <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_o(48 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0(ADD,183)@17 + 1
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 49 => u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_q(48)) & u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_0_q));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 51 => u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_q(50)) & u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_0_1_q));
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_q <= u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_o(51 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,124)@18 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_u0_m0_wo0_mtree_add0_0_u0_m0_wo0_mtree_mult1_1_merged_adder_tree_add_1_0_q(50 downto 0));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_u0_m0_wo0_mtree_add0_1_u0_m0_wo0_mtree_mult1_3_merged_adder_tree_add_1_0_q(50 downto 0));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(50 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,127)@19 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 51 => u0_m0_wo0_mtree_add1_0_q(50)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 51 => u0_m0_wo0_mtree_add1_1_q(50)) & u0_m0_wo0_mtree_add1_1_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(51 downto 0);

    -- u0_m0_wo0_mtree_add3_0(ADD,128)@20 + 1
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((52 downto 52 => u0_m0_wo0_mtree_add2_0_q(51)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((52 downto 51 => u0_m0_wo0_mtree_add1_2_q(50)) & u0_m0_wo0_mtree_add1_2_q));
    u0_m0_wo0_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(52 downto 0);

    -- u0_m0_wo0_accum(ADD,130)@21 + 1
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((55 downto 53 => u0_m0_wo0_mtree_add3_0_q(52)) & u0_m0_wo0_mtree_add3_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_21_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(55 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,131)@20 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "001001";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "000000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 9;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(5 downto 5));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,132)@21
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_21_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,133)@21 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,135)@22
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,137)@22
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,138)@22 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_q;

END normal;
