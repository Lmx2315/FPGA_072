// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
//
// Revision Control Information
//
// $RCSfile: testbench_mac32_pcs_pma.v,v $
// $Source: /ipbu/cvs/sio/projects/TriSpeedEthernet/src/testbench/MAC_PCS/verilog/testbench_mac32_pcs_pma.v,v $
//
// $Revision: #1 $
// $Date: 2018/07/18 $
// Check in by : $Author: psgswbuild $
// Author      : SKNg/TTChong
//
// Project     : Triple Speed Ethernet - 10/100/1000 MAC +  1000 Base-X PCS / SGMII
//
// Description : 
//
// Testbench for 32-Bit Core 10/100/1000 MAC +  1000 Base-X PCS / SGMII + PMA
//
// 
// ALTERA Confidential and Proprietary
// Copyright 2007 (c) Altera Corporation
// All rights reserved
//
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

`timescale 1 ns / 10 ps

module tb ;


//  Core Settings 
//  WARNING: DO NOT MODIFY THESE PARAMETERS
//  -------------------------------
// $<RTL_PARAMETERS>
parameter ENABLE_MAGIC_DETECT = 0;
parameter ENABLE_MDIO = 0;
parameter ENABLE_SUP_ADDR = 0;
parameter CORE_VERSION = 4609;
parameter MDIO_CLK_DIV = 40;
parameter ENA_HASH = 1;
parameter STAT_CNT_ENA = 1;
parameter ENABLE_HD_LOGIC = 0;
parameter REDUCED_INTERFACE_ENA = 0;
parameter ENABLE_GMII_LOOPBACK = 0;
parameter ENABLE_MAC_FLOW_CTRL = 0;
parameter ENABLE_MAC_RX_VLAN = 0;
parameter ENABLE_MAC_TX_VLAN = 0;
parameter SYNCHRONIZER_DEPTH = 3;
parameter ENABLE_EXTENDED_STAT_REG = 0;
parameter ENABLE_MAC_TXADDR_SET = 1;
parameter CRC32GENDELAY = 6;
parameter CRC32S1L2_EXTERN = 0;
parameter CRC32DWIDTH = 8;
parameter CRC32CHECK16BIT = 0;
parameter CUST_VERSION = 0;
parameter RESET_LEVEL = 1;
parameter USE_SYNC_RESET = 1;
parameter TSTAMP_FP_WIDTH = 4;
parameter EG_ADDR = 11;
parameter ING_ADDR = 11;
parameter ENABLE_ENA = 32;
parameter ENABLE_MACLITE = 0;
parameter MACLITE_GIGE = 0;
parameter ENABLE_SHIFT16 = 0;
parameter RAM_TYPE = "AUTO";
parameter INSERT_TA = 0;
parameter MAX_CHANNELS = 0;
parameter REG_ADDR_WIDTH = 8;
parameter RX_AFULL_CHANNEL_WIDTH = 1;
parameter PHY_IDENTIFIER = 0;
parameter DEV_VERSION = 4609;
parameter ENABLE_SGMII = 0;
parameter EXPORT_PWRDN = 0;
parameter ENABLE_ALT_RECONFIG = 0;
parameter STARTING_CHANNEL_NUMBER = 0;
parameter DEVICE_FAMILY = "ARRIAV";
parameter RECONFIG_TOGXB_WIDTH = 140;
parameter RECONFIG_FROMGXB_WIDTH = 92;
// END_OF_RTL_PARAMETERS







//  Simulation Settings (Testbench)
//  -------------------------------

//  Multicast addresses 
parameter MCAST_TABLEN = 9; //  number of MAC addresses in the table
parameter MCAST_ADDRESSLIST = {

        48'h 887654332211, 
        48'h 886644352611, 
        48'h ABCDEF012313, 
        48'h 92456545ab15, 
        48'h 432680010217, 
        48'h adb589215439, 
        48'h ffeacfe3434B, 
        48'h ffccddaa3123, 
        48'h adb358415439}; //  rx_err/rx_en/rx_d(7:0)
        

parameter TB_MAX_LENGTH_TEST    = 1'b0 ;        // Enable Test with Frame Greater than Programmed size
parameter TB_MIN_LENGTH_TEST    = 1'b0 ;        // Enable Test with Frame Lower than Valid size
parameter TB_FORM_TEST          = 1'b0 ;        // Test Preamble Length
parameter TB_VARIABLE_PMBL      = 1'b0 ;        // Frame Reception with Variable Preamble

parameter ETH_MODE = 1000 ; //  Ethernet Operation Mode
parameter HD_ENA = 1'b 0 ; //  Enable Half Duplex Operation
parameter TB_RXFRAMES = 0 ; //  number of frames to send in RX path - If set to 0, generator is diabled and loopbackmode is active
parameter TB_RXIPG = 12 ; //  Inter Packet Gap used by RX generator
parameter TB_TXFRAMES = 5 ; //  number of frames to send in TX path (set to 0 to disable)
parameter TB_PAUSECONTROL = 1'b 1 ; //  react on PAUSE Frames coming from MAC
parameter TB_LENSTART = 100 ; //  length to start (incremented each new frame by TB_LENSTEP)
parameter TB_LENSTEP = 1 ; //  steps the length should increase with each frame
parameter TB_LENMAX = 1500 ; //  max. payload length for generation
parameter TB_ENA_PADDING = 1'b 1 ; //  enable padding of frames coming from RX PHY generator
parameter TB_ENA_VLAN = 0 ; //  enable generation of a VLAN frame every x frames
parameter TB_STOPREAD = 0 ; //  stop reading the RX fifo after x frames
parameter TB_HOLDREAD = 1000 ; //  clock cycles to wait after stopread before continuing to read
parameter TB_TRIGGERXOFF = 0 ; // when to trigger a pause frame using the xoff_gen command
parameter TB_TRIGGERXON = 0 ; // when to trigger a pause frame using the xon_gen command
parameter TB_TRIGGERPAUSE = 0 ; //  when to trigger a pause frame using the pause_gen command
parameter TB_MACLENMAX = 1518 ; //  max. frame length configuration of MAC
parameter TB_MACPAUSEQ = 15 ; //  pause quanta configuration of MAC
parameter TB_MACIGNORE_PAUSE = 1'b 0 ; //  Ignore Pause Frames
parameter TB_MACFWD_PAUSE = 1'b 0 ; //  Forward Pause Frames
parameter TB_MACFWD_CRC = 1'b 0 ; //  Forward CRC
parameter TB_MACINSERT_ADDR = 1'b 0 ; //  Insert MAC source address
parameter TB_ADDR_SEL = 0 ; // Select MAC source address
parameter TB_MACPADEN = 1'b 1 ; //  Enable Padding
parameter TB_MODPAUSEQ = 16 ; //  pause quanta configuration of MAC
parameter TB_ENA_VAR_IPG = 1'b 0 ; // Enable Variable IPG
parameter TX_FIFO_SECTION_EMPTY  = 16 ; //  Transmit FIFO Section Empty Threshold
parameter TX_FIFO_SECTION_FULL  = 16 ; //  Transmit FIFO Section Full Threshold
parameter RX_FIFO_SECTION_EMPTY  = 0 ; //  Receive FIFO Section Empty Threshold
parameter RX_FIFO_SECTION_FULL  = 16 ; //  Receive FIFO Section Full Threshold
parameter TX_FIFO_AE  = 8 ; //  Transmit FIFO Almost Empty Threshold
parameter TX_FIFO_AF  = 10 ; //  Transmit FIFO Almost Full Threshold
parameter RX_FIFO_AE  = 8 ; //  Receive FIFO Almost Empty Threshold
parameter RX_FIFO_AF  = 8 ; //  Receive FIFO Almost Full Threshold
parameter RX_COL_FRM  = 0 ; //  Colision on Frame Number
parameter RX_COL_GEN = 0 ; //  Colision on Nibble Number
parameter TX_COL_FRM = 0 ; //  Colision on Frame Number
parameter TX_COL_GEN = 0 ; //  Colision on Nibble Number
parameter TX_COL_NUM = 0 ; //  Number of Concecutive Collisions
parameter TX_COL_DELAY = 0 ; //  Delay Between Concecutive Collisions
parameter TB_MDIO_ADDR1 = 1 ; //  MDIO PHY 1 Address
parameter TB_PROMIS_ENA = 1'b 1 ; //  Enable Promiscuous Mode
parameter PERIOD_HASHCLK = 15; //  66MHz hash table programming
parameter TB_MDIO_SIMULATION = 1'b 0 ; // Enable MDIO Simulation
parameter TB_PCS_BYPASS = 1'b 1 ; // Bypass PCS
parameter TB_IPG_LENGTH = 12 ; // Enable Inverted Loopback
parameter LOC_HIGH = 4;
parameter LOC_LOW =4;
parameter GMII_HIGH =4; 
parameter GMII_LOW = 4;  
parameter TB_MACRX_ERR_DISC = 1;//  MAC function discards erroneous frames received, only when rx_section_full register = 0

//PCS
//---------------------------------------------------------------
parameter TB_TXIPG = 12 ; //  Inter Packet Gap used by RX generator
parameter TB_PHYERR = 1'b0; //  Generate PHY Error
parameter TB_CHAR_ERR = 0; //  Insert 10b Character Error
parameter TB_CHAR_ERR_NUM = 6; //  Number of Consecutive Character Error
parameter TB_ENA_AUTONEG = 1'b 0 ; //  Enable Auto-Negotiation
parameter TB_PCS_LINK_TIMER = 512 ; //  Link Timer
parameter TB_PARTNER_LINK_TIMER = 128 ; //  Link Timer
parameter TB_TX_ERR = 1'b 0 ; //  Enable GMII Error
parameter TB_PARTNER_PS1 = 1'b 1 ; //  Pause Support Encoding
parameter TB_PARTNER_PS2 = 1'b 0 ; //  Pause Support Encoding
parameter TB_PARTNER_RF1 = 1'b 0 ; //  Remote Fault Encoding
parameter TB_PARTNER_RF2 = 1'b 0 ; //  Remote Fault Encoding
parameter TB_PCS_PS1 = 1'b 1 ; //  Pause Support Encoding
parameter TB_PCS_PS2 = 1'b 0 ; //  Pause Support Encoding
parameter TB_PCS_RF1 = 1'b 0 ; //  Remote Fault Encoding
parameter TB_PCS_RF2 = 1'b 0 ; //  Remote Fault Encoding
parameter TB_ISOLATE = 1'b 0 ; //  Remote Fault Encoding
parameter TB_SGMII_ENA = 1'b 0 ; //  Enable SGMII Interface
parameter TB_SGMII_AUTO_CONF = 1'b 0 ; //  Enable SGMII Auto-Configuration
parameter TB_SGMII_1000 = 1'b 1 ; //  Enable SGMII Gigabit
parameter TB_SGMII_100 = 1'b 0 ; //  Enable SGMII 100Mbps
parameter TB_SGMII_10 = 1'b 0 ; //  Enable SGMII 10Mbps
parameter TB_SGMII_HD = 1'b 0 ; // Enable SGMII Half-Duplex Operation


//////////////// PCS

//  PCS Status
//  ----------

wire    led_crs;                //  Carrier Sense
wire    led_link;               //  Valid Link
wire    led_panel_link;         //  Valid Copper and Fiber Link
wire    led_col;                //  Collision
wire    led_an;                 //  Auto-Negotiation Status
wire    led_char_err;           //  Character Error
wire    led_disp_err;           //  Disparity Error

wire reconfig_clk;
wire reconfig_busy;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb;
wire reconfig_clk_0;
wire reconfig_busy_0;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_0;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_0;
wire reconfig_clk_1;
wire reconfig_busy_1;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_1;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_1;
wire reconfig_clk_2;
wire reconfig_busy_2;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_2;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_2;
wire reconfig_clk_3;
wire reconfig_busy_3;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_3;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_3;
wire reconfig_clk_4;
wire reconfig_busy_4;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_4;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_4;
wire reconfig_clk_5;
wire reconfig_busy_5;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_5;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_5;
wire reconfig_clk_6;
wire reconfig_busy_6;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_6;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_6;
wire reconfig_clk_7;
wire reconfig_busy_7;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_7;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_7;
wire reconfig_clk_8;
wire reconfig_busy_8;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_8;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_8;
wire reconfig_clk_9;
wire reconfig_busy_9;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_9;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_9;
wire reconfig_clk_10;
wire reconfig_busy_10;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_10;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_10;
wire reconfig_clk_11;
wire reconfig_busy_11;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_11;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_11;
wire reconfig_clk_12;
wire reconfig_busy_12;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_12;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_12;
wire reconfig_clk_13;
wire reconfig_busy_13;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_13;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_13;
wire reconfig_clk_14;
wire reconfig_busy_14;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_14;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_14;
wire reconfig_clk_15;
wire reconfig_busy_15;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_15;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_15;
wire reconfig_clk_16;
wire reconfig_busy_16;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_16;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_16;
wire reconfig_clk_17;
wire reconfig_busy_17;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_17;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_17;
wire reconfig_clk_18;
wire reconfig_busy_18;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_18;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_18;
wire reconfig_clk_19;
wire reconfig_busy_19;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_19;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_19;
wire reconfig_clk_20;
wire reconfig_busy_20;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_20;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_20;
wire reconfig_clk_21;
wire reconfig_busy_21;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_21;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_21;
wire reconfig_clk_22;
wire reconfig_busy_22;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_22;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_22;
wire reconfig_clk_23;
wire reconfig_busy_23;
wire [RECONFIG_TOGXB_WIDTH - 1:0]      reconfig_togxb_23;
wire [RECONFIG_FROMGXB_WIDTH - 1:0]    reconfig_fromgxb_23;

// Receive Recovered Clock
wire rx_recovclkout;
wire rx_recovclkout_0;
wire rx_recovclkout_1;
wire rx_recovclkout_2;
wire rx_recovclkout_3;
wire rx_recovclkout_4;
wire rx_recovclkout_5;
wire rx_recovclkout_6;
wire rx_recovclkout_7;
wire rx_recovclkout_8;
wire rx_recovclkout_9;
wire rx_recovclkout_10;
wire rx_recovclkout_11;
wire rx_recovclkout_12;
wire rx_recovclkout_13;
wire rx_recovclkout_14;
wire rx_recovclkout_15;
wire rx_recovclkout_16;
wire rx_recovclkout_17;
wire rx_recovclkout_18;
wire rx_recovclkout_19;
wire rx_recovclkout_20;
wire rx_recovclkout_21;
wire rx_recovclkout_22;
wire rx_recovclkout_23;

//  PCS Control
//  -----------

wire    sd_loopback;            //  SERDES Loopback Enable
wire    powerdown;              //  Powerdown Control                   

//  TBI Interface
//  -------------

wire    [9:0] tbi_rxd;          //  Non Aligned 10-Bit Characters                       
wire    [9:0] tbi_txd;          //  Transmit TBI Interface
wire    [9:0] tbi_rxd_pcs;      //  Non Aligned 10-Bit Characters                       
wire    [9:0] tbi_txd_pcs;      //  Transmit TBI Interface

//  SERIAL Interface
//  -------------

wire    rxp;                    //  Serial 1.25Gbps Receive Interface
wire    txp;                    //  Serial 1.25Gbps Transmit Interface


//  Clocks
//  ------

wire    tbi_rx_clk;             //  TBI Receive Clock
wire    tbi_tx_clk;             //  TBI Transmit Clock 


//////////////// MAC

//  FIFO and Magic Detection Status Signals
//  ---------------------------------------
wire   magic_wakeup;     //magic detection wakeup status
wire   ff_rx_a_full;        //receive fifo almost full
wire   ff_rx_a_empty;       //receive fifo almost empty
wire   ff_tx_a_full;        //transmit fifo almost full
wire   ff_tx_a_empty;       //transmit fifo almost empty

//  Atlantic II Interface
//  --------------
wire   [5:0] rx_err;
wire   [17:0] rx_err_stat;
wire   [3:0] rx_frm_type;


reg    reset; 
reg    reset_model = 1'b0; 
reg    reset_mdio  = 1'b0;

//  MDIO Interface
//  --------------

wire    mdc;                            //  2.5MHz MDIO Clock
reg     mdio_tmp;                       //  Management Data
tri1    mdio;                           //  Pulled Up Management Signal
wire    mdio_in;                        //  MDIO Input
wire    mdio_out;                       //  MDIO Output
wire    mdio_oen;                       //  MDIO Output Enable
wire    [4:0] phy_addr0;                //  PHY 0 Address
wire    [4:0] phy_addr1;                //  PHY 1 Address
wire    mdio0_done;                     //  Slave MDIO 0 Access Done
wire    mdio1_done;                     //  Slave MDIO 1 Access Done

//  Receive GMII Interface
//  ----------------------

reg     rx_clk;                         //  GMII Receive clock       
reg     rx_clk_1000;                    //  GMII Transmit clock       
reg     rx_clk_100;                     //  GMII Transmit clock       
reg     rx_clk_10;                      //  GMII Transmit clock 
reg     [7:0] gm_rx_data;               //  GMII Receive data        
reg     gm_rx_en;                       //  GMII Receive frame enable
reg     gm_rx_err;                      //  GMII Receive frame error
 
//  Transmit GMII Interface
//  -----------------------

reg     tx_clk;                         //  GMII Transmit clock       
reg     tx_clk_1000;                    //  GMII Transmit clock       
reg     tx_clk_100;                     //  GMII Transmit clock       
reg     tx_clk_10;                      //  GMII Transmit clock 
wire    ref_clk;
wire    cdr_ref_clk_0;                  //  CDR reference clock
wire    cdr_ref_clk_1;                  //  CDR reference clock
wire    cdr_ref_clk_2;                  //  CDR reference clock
wire    cdr_ref_clk_3;                  //  CDR reference clock
wire    cdr_ref_clk_4;                  //  CDR reference clock
wire    cdr_ref_clk_5;                  //  CDR reference clock
wire    cdr_ref_clk_6;                  //  CDR reference clock
wire    cdr_ref_clk_7;                  //  CDR reference clock
wire    cdr_ref_clk_8;                  //  CDR reference clock
wire    cdr_ref_clk_9;                  //  CDR reference clock
wire    cdr_ref_clk_10;                 //  CDR reference clock
wire    cdr_ref_clk_11;                 //  CDR reference clock
wire    cdr_ref_clk_12;                 //  CDR reference clock
wire    cdr_ref_clk_13;                 //  CDR reference clock
wire    cdr_ref_clk_14;                 //  CDR reference clock
wire    cdr_ref_clk_15;                 //  CDR reference clock
wire    cdr_ref_clk_16;                 //  CDR reference clock
wire    cdr_ref_clk_17;                 //  CDR reference clock
wire    cdr_ref_clk_18;                 //  CDR reference clock
wire    cdr_ref_clk_19;                 //  CDR reference clock
wire    cdr_ref_clk_20;                 //  CDR reference clock
wire    cdr_ref_clk_21;                 //  CDR reference clock
wire    cdr_ref_clk_22;                 //  CDR reference clock
wire    cdr_ref_clk_23;                 //  CDR reference clock
wire    [7:0] gm_tx_data;               //  GMII Transmit data        
wire    gm_tx_en;                       //  GMII Transmit frame enable
wire    gm_tx_err;                      //  GMII Transmit frame error

//  Receive MII Interface
//  ---------------------

reg     [3:0] m_rx_data;                //  MII Receive data        
reg     m_rx_en;                        //  MII Receive frame enable
reg     m_rx_err;                       //  MII Receive frame error 
wire    m_rx_crs;                       //  MII Carrier Sense
wire    m_rx_crs_hd;                    //  MII Carrier Sense
wire    m_rx_crs_fd;                    //  MII Carrier Sense
wire    m_rx_col;                       //  MII Collision
reg     m_rx_col_hd;                    //  MII Collision
wire    m_rx_col_fd;                    //  MII Collision
 
//  Transmit MII Interface
//  ----------------------

wire    [3:0] m_tx_data;                //  MII Transmit data        
wire    [7:0] m_tx_data_tmp;            //  MII Transmit data        
wire    m_tx_en;                        //  MII Transmit frame enable
wire    m_tx_err;                       //  MII Transmit frame error

//  Receive User Interface
//  ----------------------
     
reg     ff_rx_clk;                      //  Transmit Local Clock
wire    [ENABLE_ENA-1:0] ff_rx_data;    //  Data
wire    [(ENABLE_ENA/32):0] ff_rx_mod;  //  Data Modulo
wire    ff_rx_sop;                      //  Start of Packet
wire    ff_rx_eop;                      //  End of Packet
wire    ff_rx_err;                      //  Errored Packet Indication (Parity, POS-PHY Errored or Oversized Packet)
wire    [22:0] ff_rx_err_stat;          //  Errored Packet Status Word
wire    ff_rx_rdy;                      //  PHY Application Ready
wire    ff_rx_dval;                     //  Data Valid Strobe
wire    ff_rx_dsav;                     //  Data Available
wire    ff_rx_ucast;                    //  Unicast Frame Indication
wire    ff_rx_bcast;                    //  Broadcast Frame Indication
wire    ff_rx_mcast;                    //  Multicast Frame Indication
wire    ff_rx_vlan;                     //  VLAN Frame Indication
reg     ff_rx_ucast_reg;                //  Unicast Frame Indication
reg     ff_rx_bcast_reg;                //  Broadcast Frame Indication
reg     ff_rx_mcast_reg;                //  Multicast Frame Indication
reg     ff_rx_vlan_reg;                 //  VLAN Frame Indication
reg     ff_rx_ucast_reg2;               //  Unicast Frame Indication
reg     ff_rx_bcast_reg2;               //  Broadcast Frame Indication
reg     ff_rx_mcast_reg2;               //  Multicast Frame Indication
reg     ff_rx_vlan_reg2;                //  VLAN Frame Indication

//  Transmit User Interface
//  -----------------------
    
reg     ff_tx_clk;                      //  Transmit Local Clock    
wire    [ENABLE_ENA-1:0] ff_tx_data;    //  Data
wire    [(ENABLE_ENA/32):0] ff_tx_mod;  //  Data Modulo
wire    ff_tx_sop;                      //  Start of Packet
wire    ff_tx_eop;                      //  End of Packet
wire    ff_tx_err;                      //  Errored Packet
wire    ff_tx_wren;                     //  Write Enable
wire    ff_tx_crc_fwd;                  //  Forward Frame with CRC from Application

wire    ff_tx_rdy;                      //  FIFO Ready          
wire    ff_tx_septy;                    //  FIFO section empty
wire    tx_ff_uflow;                    //  TX FIFO underflow occured (Synchronous with tx_clk)
wire    ff_pause_gen;                   //  TX FIFO pause frame generation

//  Ethernet MAC Configuration
//  --------------------------

reg     xoff_gen;                       //  Xoff Pause frame generate 
reg     xon_gen;                        //  Xon Pause frame generate        
wire    [47:0] mac_addr;                //  Device Ethernet MAC address
wire    [47:0] sup_mac_addr_0;          //  Supplemental Ethernet MAC address
wire    [47:0] sup_mac_addr_1;          //  Supplemental Ethernet MAC address
wire    [47:0] sup_mac_addr_2;          //  Supplemental Ethernet MAC address
wire    [47:0] sup_mac_addr_3;          //  Supplemental Ethernet MAC address
wire    promis_en;                      //  Enable promiscuous mode: accept any frame
wire    [15:0] frm_length_max;          //  Maximium Received Frame length         
reg     ethernet_mode;                  //  Ethernet Mode (1 for Gigabit)

//  Event Triggers
//  --------------

wire    pause_rcv;                      //  Pause Frame Receive Indication
wire    frm_rcv;                        //  Frame Receive Indication
wire    frm_tx;                         //  Frame Transmit Indication
wire    frm_align_err;                  //  Received Frame Aligment Error Indication
wire    frm_type_err;                   //  Received Frame type Error Indication
wire    frm_length_err;                 //  Received Frame length Error Indication
wire    frm_crc_err;                    //  Received Frame CRC_32 Error Indication

//  Ethernet Generator Config (GMII RX)
//  -----------------------------------

wire    [7:0] gm_rxgen_rx_d;            //  gmii receive data
wire    gm_rxgen_rx_en;                 //  gmii receive frame enable  
wire    gm_rxgen_rx_err;                //  gmii receive frame error     
wire    [7:0] m_rxgen_rx_d;             //  mii receive data
wire    m_rxgen_rx_en;                  //  mii receive frame enable  
wire    m_rxgen_rx_err;                 //  mii receive frame error                     
wire    gm_mac_reverse;                 //  1: dst/src are sent MSB first
reg     [47:0] gm_dst;                  //  destination address
wire    [47:0] gm_src;                  //  source address     
wire    [4:0] gm_prmble_len;            //  length of preamble
wire    [15:0] gm_pquant;               //  Pause Quanta value
wire    [15:0] gm_vlan_ctl;             //  VLAN control info
reg     [15:0] gm_len;                  //  Length of payload
wire    [15:0] gm_frmtype;              //  if non-null: type field instead length      
wire    [7:0] gm_cntstart;              //  payload data counter start (first byte of payload)
wire    [7:0] gm_cntstep;               //  payload counter step (2nd byte in paylaod)
wire    gm_payload_err;                 //  generate payload pattern error (last payload byte is wrong)
wire    gm_prmbl_err; 
wire    gm_crc_err; 
wire    gm_pause_gen; 
wire    gm_vlan_en; 
wire    gm_stack_vlan_en; 
wire    gm_pad_en; 
wire    gm_phy_err; 
wire    gm_end_err;                     //  keep rx_dv high one cycle after end of frame
wire    [15:0] gm_ipg_len;              //  inter packet gap (delay after CRC)  
reg     [15:0] gm_ipg_cnt;
integer free_ipg_cnt;

//  FIFO Generator Config (user app FIFO TX)
//  ----------------------------------------

wire    ff_mac_reverse;                 //  1: dst/src are sent MSB first
wire    [47:0] ff_dst;                  //  destination address
wire    [47:0] ff_src;                  //  source address    
wire    [4:0] ff_prmble_len;            //  length of preamble
wire    [15:0] ff_pquant;               //  Pause Quanta value
wire    [15:0] ff_vlan_ctl;             //  VLAN control info
reg     [15:0] ff_len;                  //  Length of payload
wire    [15:0] ff_frmtype;              //  if non-null: type field instead length      
wire    [7:0] ff_cntstart;              //  payload data counter start (first byte of payload)
wire    [7:0] ff_cntstep;               //  payload counter step (2nd byte in paylaod)
wire    [15:0] ff_ipg_len;              //  inter packet gap (delay after CRC)         
wire    ff_payload_err;                 //  generate payload pattern error (last payload byte is wrong)
wire    ff_prmbl_err; 
wire    ff_crc_err; 
wire    ff_vlan_en; 
wire    ff_stack_vlan_en; 
wire    ff_pad_en; 
wire    ff_phy_err; 
wire    ff_end_err;                     //  keep rx_dv high one cycle after end of frame

//  Register Interface
//  ------------------

reg     reg_clk;                        //  25MHz Host Interface Clock
reg     reg_rd;                         //  Register Read Strobe
reg     reg_wr;                         //  Register Write Strobe
reg     [7:0] reg_addr;                 //  Register Address
reg     [31:0] reg_data_in;             //  Write Data for Host Bus
wire    [31:0] reg_data_out;            //  Read Data to Host Bus
wire    reg_busy;                       //  Interface Busy
reg     reg_busy_reg;                   //  Interface Busy
wire    magic_sleep_n;                     //  Enable Sleep Mode
wire    reg_wakeup;                     //  Wake Up Request

//  Half Duplex Colision Control
//  ----------------------------

integer rx_nib_cnt;                     //  Nibble Counter
integer tx_nib_cnt;                     //  Nibble Counter
wire    tx_col_reg;                     //  Packet Transmitted with Col                
wire    tx_col_reg_fd;                  //  Packet Transmitted with Col                
reg     tx_col_reg_hd;                  //  Packet Transmitted with Col

//  Ethernet TX Monitor
//  -------------------

wire    [47:0] mgm_dst;                 //  destination address
wire    [47:0] mgm_src;                 //  source address
wire    [13:0] mgm_prmble_len;          //  length of preamble
wire    [15:0] mgm_pquant;              //  Pause Quanta value
wire    [15:0] mgm_vlan_ctl;            //  VLAN control info
wire    [15:0] mgm_len;                 //  Length of payload
wire    [15:0] mgm_frmtype;             //  if non-null: type field instead length
wire    [7:0] mgm_payload; 
wire    mgm_payload_vld; 
wire    mgm_is_vlan;
wire    mgm_is_stack_vlan;  
wire    mgm_is_pause; 
wire    mgm_crc_err; 
wire    mgm_prmbl_err; 
wire    mgm_pad_err; 
wire    mgm_len_err; 
wire    mgm_payload_err; 
wire    mgm_frame_err; 
wire    mgm_pause_op_err; 
wire    mgm_pause_dst_err; 
wire    mgm_mac_err; 
wire    mgm_end_err; 
wire    mgm_frm_rcvd;
 
//  GMII Monitor
//  -------------

wire    [47:0] gm_mgm_dst;              //  destination address
wire    [47:0] gm_mgm_src;              //  source address
wire    [13:0] gm_mgm_prmble_len;       //  length of preamble
wire    [15:0] gm_mgm_pquant;           //  Pause Quanta value
wire    [15:0] gm_mgm_vlan_ctl;         //  VLAN control info
wire    [15:0] gm_mgm_len;              //  Length of payload
wire    [15:0] gm_mgm_frmtype;          //  if non-null: type field instead length
wire    [7:0] gm_mgm_payload; 
wire    gm_mgm_payload_vld; 
wire    gm_mgm_is_vlan; 
wire    gm_mgm_is_stack_vlan; 
wire    gm_mgm_is_pause; 
wire    gm_mgm_crc_err; 
wire    gm_mgm_prmbl_err; 
wire    gm_mgm_pad_err; 
wire    gm_mgm_len_err; 
wire    gm_mgm_payload_err; 
wire    gm_mgm_frame_err; 
wire    gm_mgm_pause_op_err; 
wire    gm_mgm_pause_dst_err; 
wire    gm_mgm_mac_err; 
wire    gm_mgm_end_err; 
wire    gm_mgm_frm_rcvd;                //  if '1' all signals/indicators are valid
        
//  MII Monitor
//  -----------

wire    [47:0] m_mgm_dst;               //  destination address
wire    [47:0] m_mgm_src;               //  source address
wire    [13:0] m_mgm_prmble_len;        //  length of preamble
wire    [15:0] m_mgm_pquant;            //  Pause Quanta value
wire    [15:0] m_mgm_vlan_ctl;          //  VLAN control info
wire    [15:0] m_mgm_len;               //  Length of payload
wire    [15:0] m_mgm_frmtype;           //  if non-null: type field instead length
wire    [7:0] m_mgm_payload; 
wire    m_mgm_payload_vld; 
wire    m_mgm_is_vlan; 
wire    m_mgm_is_stack_vlan; 
wire    m_mgm_is_pause; 
wire    m_mgm_crc_err; 
wire    m_mgm_prmbl_err; 
wire    m_mgm_pad_err; 
wire    m_mgm_len_err; 
wire    m_mgm_payload_err; 
wire    m_mgm_frame_err; 
wire    m_mgm_pause_op_err; 
wire    m_mgm_pause_dst_err; 
wire    m_mgm_mac_err; 
wire    m_mgm_end_err; 
wire    m_mgm_frm_rcvd;                 //  if '1' all signals/indicators are valid
         
//  FIFO Monitor RX (user appl) (Checking)
//  --------------------------------------

wire    [47:0] mff_dst;                 //  destination address
reg     [47:0] mff_dst_reg;             //  destination address
wire    [47:0] mff_src;                 //  source address
wire    [13:0] mff_prmble_len;          //  length of preamble
wire    [15:0] mff_pquant;              //  Pause Quanta value
wire    [15:0] mff_vlan_ctl;            //  VLAN control info
wire    [15:0] mff_len;                 //  Length of payload
wire    [15:0] mff_frmtype;             //  if non-null: type field instead length
wire    [7:0] mff_payload; 
wire    mff_payload_vld; 
wire    mff_is_vlan;
wire    mff_is_stack_vlan;  
wire    mff_is_pause; 
reg     mff_is_pause_reg;
wire    mff_crc_err; 
wire    mff_prmbl_err; 
wire    mff_pad_err; 
wire    mff_len_err; 
wire    mff_payload_err; 
reg     mff_payload_err_reg; 
wire    mff_frame_err; 
wire    mff_pause_op_err; 
wire    mff_pause_dst_err; 
wire    mff_mac_err; 
wire    mff_end_err;
reg     mff_end_err_reg;
wire    mff_frm_rcvd;                   //  if '1' all signals/indicators are valid
integer ff_frmlen;                      //  length of frame as it is coming from the FIFO

//  Simulation Command Signals
//  --------------------------

wire    gm_start_ether_gen;             //  Enable Frame Generation
wire    m_start_ether_gen;              //  Enable Frame Generation
wire    gm_ether_gen_done;              //  Ethernet Generation Completed
wire    gm_gm_ether_gen_done;           //  Ethernet Generation Completed
wire    m_gm_ether_gen_done;            //  Ethernet Generation Completed
wire    ff_start_ether_gen;             //  Enable Frame Generation
wire    ff_ether_gen_done;              //  Ethernet Generation Completed
wire    jumbo_enable;                   //  depending on TB_MACLENMAX 
           
//  Simulation Control
//  ------------------

wire    sim_done;                       //  1 when everything has finished
reg     sim_stop;                       //  when to stop the simulator after simulation is done (delayed after sim_done)
reg     sim_start;                      //  when to start simulation
integer delay_cnt;                      //  wait before start and after done until stop
integer hash_cnt;                       //  Hash table programming counter 
integer multicast_cnt;                  //  counter during setting of a multicast address
reg     multicast_wrong =0;                //  true if we currently use a multicast address not from the table
wire    promis_en_dly; 
reg     stop_rx_fifo_read;              //  FIFO read should be stopped now
wire    ff_rx_rdy_dly;                  //  delayed rx_rdy for message generation
integer rx_hold_cnt;                    //  timer counting cycles during fifo read stop
integer rx_fifo_cnt;                    //  incremented with each frame read from the FIFO
reg     tx_pause_wait;                  //  Pause frame received. TX should stop
integer tx_pause_cnt;                   //  timer counting pause delay
integer force_xoff_pause_cnt;           //  when to trigger a Xoff pause frame generation
integer force_xon_pause_cnt;            //  when to trigger a Xoff pause frame generation

//  TX PATH simulation
//  ------------------

integer txframe_cnt;                    //  number of frames transmitted/generated
reg     txsim_done;                     //  1 when everything has finished
reg     ff_tx_clk_gen_en;               //  clock enable for TX FIFO generator    
wire    ff_tx_clk_gen;                  //  clock for TX FIFO generator    
wire    ff_tx_wren_gen;                 //  write enable FIFO interface

//  TX: Verification information
//  ----------------------------

integer tx_good_sent;                   //  valid frames sent which should be counted as good on receive
integer tx_good_rcvd;                   //  should be same as good_sent at end of test        
integer tx_pause_rcvd; 
integer tx_pause_err_rcvd;              //  erroneous PAUSE frames
integer tx_align_err_rcvd;              //  should NEVER happen
integer gm_txcnt; 
integer tx_vlan_sent; 
integer tx_stack_vlan_sent; 
integer tx_frm_all; 
integer tx_vlan_rcvd;                   //  received by monitor
integer tx_stack_vlan_rcvd;                   //  received by monitor
integer tx_vlan_wrong_type_sent; 
integer tx_phy_err_rcvd;                //  GMII tx error signal detected
integer tx_crc_err_rcvd; 
integer tx_payload_err_sent; 
integer tx_payload_err_rcvd; 
integer tx_wrong_src_rcvd;              //  Wrong MAC SOURCE address received by monitor

//  RX PATH simulation
//  ------------------

reg     [31:0] rxframe_cnt;             //  number of frames transmitted/generated
reg     [3:0] last_err_stat;            //  latest FIFO error bits
reg     [15:0] ff_last_length;          //  length part of ff_rx_err_stat
wire    gm_sop;                         //  sop from GMII generator
reg     gm_sop_reg1;                    //  sop from GMII generator
reg     gm_sop_reg2;                    //  sop from GMII generator
wire    gm_gm_sop;                      //  sop from GMII generator
wire    m_gm_sop;                       //  sop from MII generator
reg     gm_sop_dly;                     //  delayed by 1
reg     gm_sop_dly2;                    //  delayed by 1
wire    gm_eop;                         //  eop from GMII generator
wire    gm_gm_eop;                      //  eop from GMII generator
wire    m_gm_eop;                       //  eop from MII generator
reg     gm_eop_dly;                     //  dito delayed by 1 clk 

//  RX: Determine when to expect the RX to act 
//  ------------------------------------------

reg     expect1;                        //  set after start of generator
reg     expect2;                        //  set when we expect something, cleared if done

//  RX: Verification information
//  ------------------------

wire    rx_is_good_frame;               //  true if valid frame (payload error is still a valid frame)
wire    rx_is_good_addr;                //  true if valid mac address is given
integer rx_good_sent;                   //  valid frames sent which should be counted as good on receive
integer rx_good_rcvd;                   //  should be same as good_sent at end of test
integer rx_pause_sent; 
integer rx_pause_rcvd; 
integer rx_align_err_sent; 
integer rx_align_err_rcvd; 
integer rx_crc_err_sent; 
integer rx_crc_err_rcvd; 
integer rx_gmii_err_sent; 
integer rx_gmii_err_rcvd; 
integer rx_length_err_rcvd; 
integer rx_length_mismatch_rcvd; 
integer rx_vlan_sent; 
integer rx_vlan_rcvd; 
integer rx_stack_vlan_sent; 
integer rx_stack_vlan_rcvd; 
integer rx_vlan_wrong_type_sent; 
integer rx_discard_sent;                //  frame sent that should have been discarded
integer rx_non_discard_rcvd;            //  frames discarded on receive
integer rx_discard_rcvd;                //  frame_cnt - non_discard_rcvd
integer rx_wrong_status_sent;           //  sent frame that will be pushed into FIFO but with error status
integer rx_wrong_status_rcvd; 
integer rx_payload_err_sent; 
integer rx_payload_err_rcvd; 
integer mff_rxcnt; 
integer rx_wrong_mac_sent; 
integer rx_wrong_mac_rcvd; 
integer rx_broadcast_sent; 
integer rx_broadcast_rcvd; 
integer rx_multicast_sent_total; 
integer rx_multicast_sent; 
integer rx_multicast_rcvd; 
integer rx_multicast_denied; 
integer rx_unexpected; 
integer rx_fifo_overflow_rcvd; 
integer rx_col_sent; 
integer tx_col_sent; 
integer rx_col_rcvd; 



//  Control State Machine
//  ---------------------

parameter stm_typ_idle = 0;
parameter stm_typ_read_ver = 1;
parameter stm_typ_wr_scratch = 2;
parameter stm_typ_rd_scratch = 3;
parameter stm_typ_write_mdio1 = 6;
parameter stm_typ_read_mdio1 = 7;
parameter stm_typ_mac_config = 8;
parameter stm_typ_wr_mac1 = 9;
parameter stm_typ_wr_mac2 = 10;
parameter stm_typ_wr_ipg_len = 65;
parameter stm_typ_lut_prog = 11;
parameter stm_typ_lut_prog_inc = 12;
parameter stm_typ_wr_frm_length = 13;
parameter stm_typ_wr_pause_quanta = 14;
parameter stm_typ_wr_mdio_addr1 = 16;
parameter stm_typ_sim = 17;
parameter stm_typ_end_sim_wait = 53;
parameter stm_typ_end_sim = 44;


//  Simulation Control for PCS
//  ------------------

parameter stm_typ_pcs_read_ver = 100;
parameter stm_typ_pcs_wr_scratch = 101;
parameter stm_typ_pcs_rd_scratch = 102;
parameter stm_typ_pcs_read_phy_control = 103;

parameter stm_typ_pcs_write_phy_control = 104;

parameter stm_typ_pcs_read_sync_status = 105;
parameter stm_typ_pcs_prog_ability = 106;
parameter stm_typ_pcs_prog_timer_1 = 107;
parameter stm_typ_pcs_prog_timer_2 = 108;
parameter stm_typ_pcs_autoneg_enable = 109;
parameter stm_typ_pcs_start_autoneg = 110;
parameter stm_typ_pcs_wait_autoneg = 111;
parameter stm_typ_pcs_read_autoneg_expansion = 112;
parameter stm_typ_pcs_read_autoneg_status = 113;
parameter stm_typ_pcs_read_part_ability = 114;
parameter stm_typ_pcs_wait_link = 115;
parameter stm_typ_pcs_stop_tbi = 117;
parameter stm_typ_pcs_start_tbi = 118;
parameter stm_typ_pcs_read_status = 119;
parameter stm_typ_pcs_read_status_2 = 120;
parameter stm_typ_pcs_ena_sw_reset = 121;
parameter stm_typ_pcs_read_sw_reset = 122;
parameter stm_typ_pcs_ena_isolate = 123;
parameter stm_typ_pcs_disable_isolate = 124;
parameter stm_typ_pcs_autoneg_disable = 126;
parameter stm_typ_pcs_if_control = 127;


// Read Statistic Counters
// -----------------------

parameter stm_typ_rd_pause_rx = 18;
parameter stm_typ_rd_pause_tx = 19;
parameter stm_typ_rd_frm_tx = 20;
parameter stm_typ_rd_frm_rx = 21;
parameter stm_typ_rd_crc_err = 22;
parameter stm_typ_rd_tx_octets = 23;
parameter stm_typ_rd_rx_octets = 24;
parameter stm_typ_rd_rx_all_octets = 66;
parameter stm_typ_rd_align_err = 25;
parameter stm_typ_rx_unicast = 26;
parameter stm_typ_rx_mltcast = 27;
parameter stm_typ_rx_brdcast = 28;
parameter stm_typ_tx_frm_discard = 29;
parameter stm_typ_tx_unicast = 30;
parameter stm_typ_tx_mltcast = 31;
parameter stm_typ_tx_brdcast = 32;
parameter stm_typ_rx_frm_err = 33;
parameter stm_typ_tx_frm_err = 34;
parameter stm_typ_rx_frm_drop = 35;
parameter stm_typ_rx_undersz_frm = 36;
parameter stm_typ_rx_oversz_frm = 37;
parameter stm_typ_rx_64_frm = 38;
parameter stm_typ_rx_65_127_frm = 39;
parameter stm_typ_rx_128_255_frm = 40;
parameter stm_typ_rx_256_511_frm = 41;
parameter stm_typ_rx_512_1023_frm = 42;
parameter stm_typ_rx_1024_1518_frm = 43;
parameter stm_typ_rx_1519_X_frm = 67;
parameter stm_typ_rx_jabber = 68;
parameter stm_typ_rx_fragment = 69;
parameter stm_typ_wr_sup_mac0_0 = 56;
parameter stm_typ_wr_sup_mac0_1 = 57;
parameter stm_typ_wr_sup_mac1_0 = 58;
parameter stm_typ_wr_sup_mac1_1 = 59;
parameter stm_typ_wr_sup_mac2_0 = 60;
parameter stm_typ_wr_sup_mac2_1 = 61;
parameter stm_typ_wr_sup_mac3_0 = 62;
parameter stm_typ_wr_sup_mac3_1 = 63;

// Programming FIFO thresholds
// ---------------------------

parameter stm_typ_wr_rx_ae = 45;
parameter stm_typ_wr_rx_af = 46;
parameter stm_typ_wr_tx_ae = 47;
parameter stm_typ_wr_tx_af = 48;
parameter stm_typ_wr_rx_se = 49;
parameter stm_typ_wr_rx_sf = 50;
parameter stm_typ_wr_tx_se = 51;
parameter stm_typ_wr_tx_sf = 52;
parameter stm_typ_sw_reset = 54;
parameter stm_typ_rd_sw_reset = 55;

reg     [6:0] state; 
reg     [6:0] nextstate; 
integer sim_cnt_end;   
reg     re_read_ena;  

//  Hash Table Program Control
//  --------------------------

reg     [6:0] lut_prog_cnt; 
reg     [5:0] p_hash_hash_code; 
reg     [47:0] p_hash_mcast_addr;   
             
//  global settings
//  ---------------

wire    m_rx_col_wire; 
wire    tx_col_reg_wire; 
integer  process_4_ln; 
integer  process_8_ln; 
integer  process_10_cnt; 
integer  process_12_ln; 
integer  process_15_mdl; 
integer  process_16_maxlen; 
integer  process_16_payloadlen; 
integer  process_16_payloadminlen; 

// register write/read test
//

reg [31:0] readback_scratch;
reg [31:0] readback_MDIO0_addr0;
reg [31:0] readback_MDIO1_addr0;

integer register_test;


assign ref_clk = tx_clk_1000;
assign jumbo_enable = TB_MACLENMAX > 1522 ? 1'b 1 : 1'b 0; //  enable monitors for long frames
assign reconfig_clk = ref_clk;
assign reconfig_busy = 1'b0;
assign reconfig_clk_0 = ref_clk;
assign cdr_ref_clk_0 = ref_clk;
assign reconfig_busy_0 = 1'b0;
assign reconfig_clk_1 = ref_clk;
assign cdr_ref_clk_1 = ref_clk;
assign reconfig_busy_1 = 1'b0;
assign reconfig_clk_2 = ref_clk;
assign cdr_ref_clk_2 = ref_clk;
assign reconfig_busy_2 = 1'b0;
assign reconfig_clk_3 = ref_clk;
assign cdr_ref_clk_3 = ref_clk;
assign reconfig_busy_3 = 1'b0;
assign reconfig_clk_4 = ref_clk;
assign cdr_ref_clk_4 = ref_clk;
assign reconfig_busy_4 = 1'b0;
assign reconfig_clk_5 = ref_clk;
assign cdr_ref_clk_5 = ref_clk;
assign reconfig_busy_5 = 1'b0;
assign reconfig_clk_6 = ref_clk;
assign cdr_ref_clk_6 = ref_clk;
assign reconfig_busy_6 = 1'b0;
assign reconfig_clk_7 = ref_clk;
assign cdr_ref_clk_7 = ref_clk;
assign reconfig_busy_7 = 1'b0;
assign reconfig_clk_8 = ref_clk;
assign cdr_ref_clk_8 = ref_clk;
assign reconfig_busy_8 = 1'b0;
assign reconfig_clk_9 = ref_clk;
assign cdr_ref_clk_9 = ref_clk;
assign reconfig_busy_9 = 1'b0;
assign reconfig_clk_10 = ref_clk;
assign cdr_ref_clk_10 = ref_clk;
assign reconfig_busy_10 = 1'b0;
assign reconfig_clk_11 = ref_clk;
assign cdr_ref_clk_11 = ref_clk;
assign reconfig_busy_11 = 1'b0;
assign reconfig_clk_12 = ref_clk;
assign cdr_ref_clk_12 = ref_clk;
assign reconfig_busy_12 = 1'b0;
assign reconfig_clk_13 = ref_clk;
assign cdr_ref_clk_13 = ref_clk;
assign reconfig_busy_13 = 1'b0;
assign reconfig_clk_14 = ref_clk;
assign cdr_ref_clk_14 = ref_clk;
assign reconfig_busy_14 = 1'b0;
assign reconfig_clk_15 = ref_clk;
assign cdr_ref_clk_15 = ref_clk;
assign reconfig_busy_15 = 1'b0;
assign reconfig_clk_16 = ref_clk;
assign cdr_ref_clk_16 = ref_clk;
assign reconfig_busy_16 = 1'b0;
assign reconfig_clk_17 = ref_clk;
assign cdr_ref_clk_17 = ref_clk;
assign reconfig_busy_17 = 1'b0;
assign reconfig_clk_18 = ref_clk;
assign cdr_ref_clk_18 = ref_clk;
assign reconfig_busy_18 = 1'b0;
assign reconfig_clk_19 = ref_clk;
assign cdr_ref_clk_19 = ref_clk;
assign reconfig_busy_19 = 1'b0;
assign reconfig_clk_20 = ref_clk;
assign cdr_ref_clk_20 = ref_clk;
assign reconfig_busy_20 = 1'b0;
assign reconfig_clk_21 = ref_clk;
assign cdr_ref_clk_21 = ref_clk;
assign reconfig_busy_21 = 1'b0;
assign reconfig_clk_22 = ref_clk;
assign cdr_ref_clk_22 = ref_clk;
assign reconfig_busy_22 = 1'b0;
assign reconfig_clk_23 = ref_clk;
assign cdr_ref_clk_23 = ref_clk;
assign reconfig_busy_23 = 1'b0;

if (DEVICE_FAMILY == "STRATIXV" || 
	DEVICE_FAMILY == "ARRIAV" ||
    DEVICE_FAMILY == "CYCLONEV")
 begin
    assign reconfig_togxb = 140'd0;
    assign reconfig_togxb_0 = 140'd0;
    assign reconfig_togxb_1 = 140'd0;
    assign reconfig_togxb_2 = 140'd0;
    assign reconfig_togxb_3 = 140'd0;
    assign reconfig_togxb_4 = 140'd0;
    assign reconfig_togxb_5 = 140'd0;
    assign reconfig_togxb_6 = 140'd0;
    assign reconfig_togxb_7 = 140'd0;
    assign reconfig_togxb_8 = 140'd0;
    assign reconfig_togxb_9 = 140'd0;
    assign reconfig_togxb_10 = 140'd0;
    assign reconfig_togxb_11 = 140'd0;
    assign reconfig_togxb_12 = 140'd0;
    assign reconfig_togxb_13 = 140'd0;
    assign reconfig_togxb_14 = 140'd0;
    assign reconfig_togxb_15 = 140'd0;
    assign reconfig_togxb_16 = 140'd0;
    assign reconfig_togxb_17 = 140'd0;
    assign reconfig_togxb_18 = 140'd0;
    assign reconfig_togxb_19 = 140'd0;
    assign reconfig_togxb_20 = 140'd0;
    assign reconfig_togxb_21 = 140'd0;
    assign reconfig_togxb_22 = 140'd0;
    assign reconfig_togxb_23 = 140'd0;
 end
else
 begin
    assign reconfig_togxb = 140'd2;
    assign reconfig_togxb_0 = 140'd2;
    assign reconfig_togxb_1 = 140'd2;
    assign reconfig_togxb_2 = 140'd2;
    assign reconfig_togxb_3 = 140'd2;
    assign reconfig_togxb_4 = 140'd2;
    assign reconfig_togxb_5 = 140'd2;
    assign reconfig_togxb_6 = 140'd2;
    assign reconfig_togxb_7 = 140'd2;
    assign reconfig_togxb_8 = 140'd2;
    assign reconfig_togxb_9 = 140'd2;
    assign reconfig_togxb_10 = 140'd2;
    assign reconfig_togxb_11 = 140'd2;
    assign reconfig_togxb_12 = 140'd2;
    assign reconfig_togxb_13 = 140'd2;
    assign reconfig_togxb_14 = 140'd2;
    assign reconfig_togxb_15 = 140'd2;
    assign reconfig_togxb_16 = 140'd2;
    assign reconfig_togxb_17 = 140'd2;
    assign reconfig_togxb_18 = 140'd2;
    assign reconfig_togxb_19 = 140'd2;
    assign reconfig_togxb_20 = 140'd2;
    assign reconfig_togxb_21 = 140'd2;
    assign reconfig_togxb_22 = 140'd2;
    assign reconfig_togxb_23 = 140'd2;
 end


//  Reset Control and start simulation
//  ----------------------------------

   //  Reset Control and start simulation
   //  ----------------------------------
   
        initial
        begin

                $display("\n - ---------------------------------------------------------------------------------------- -") ;
                $display("\n --     Testbench for 32-Bit Core 10/100/1000 MAC +  1000 Base-X PCS / SGMII + PMA      --") ;
                $display(" --   (c) ALTERA CORPORATION 2007  --") ;
                $display("\n - ---------------------------------------------------------------------------------------- -\n") ;
                
                if (TB_RXFRAMES > 0)
                begin
                
                        $display("    Error: 'TB_RXFRAMES' must be set to 0.  Only loopback simulation is supported by this testbench \n") ;
                        $stop ;
                        
                end


                if (ETH_MODE==1000 && HD_ENA==1'b1)
                begin
                
                        $display("    Error: Half Duplex must Disabled for Gigabit Operation\n") ;
                        $stop ;
                        
                end
                
                if (TB_MACPADEN==1'b1 & TB_MACFWD_CRC==1'b1)
                begin
                
                        $display("    Warning: Setting Padding Termination and Forward CRC Options may Results in Simulation Errors\n") ;
                                
                end  
                
                if (ETH_MODE==1000)
                begin
                
                        ethernet_mode <= 1'b1 ;
                        
                end
                
                else if (ETH_MODE==100)
                begin
                
                        ethernet_mode <= 1'b0 ;
                        
                end
                
                else if (ETH_MODE==10)
                begin
                
                        ethernet_mode <= 1'b0 ;
                        
                end  
                
                reset       <=1'b0 ;
                sim_start   <=1'b0 ;
                #(50)
                reset       <=1'b1 ;
                #(2000) ;
                reset       <=1'b0 ;
                #(3000) ;
                sim_start   <=1'b1 ;
        end

//  Clocks
//  ------

        always 
        begin
                
                ff_rx_clk <= 1'b 1; 
                #LOC_HIGH;
                ff_rx_clk <= 1'b 0; 
                #LOC_HIGH; 
        
        end

        always 
        begin
        
                ff_tx_clk <= 1'b 1; 
                #LOC_HIGH; 
                ff_tx_clk <= 1'b 0; 
                #LOC_HIGH; 
        
        end
     
assign ff_tx_crc_fwd = 1'b0 ; 
assign magic_sleep_n    = 1'b1 ;

// $<RTL_CORE_INSTANCE>
eth1 dut
(
   .ff_rx_eop (ff_rx_eop),
   .ff_rx_rdy (ff_rx_rdy),
   .ff_rx_mod (ff_rx_mod),
   .ff_rx_sop (ff_rx_sop),
   .ff_rx_data (ff_rx_data),
   .ff_rx_dval (ff_rx_dval),
   .rx_err (rx_err),
   .reg_data_in (reg_data_in),
   .reg_busy (reg_busy),
   .reg_rd (reg_rd),
   .reg_addr (reg_addr),
   .reg_data_out (reg_data_out),
   .reg_wr (reg_wr),
   .ref_clk (ref_clk),
   .ff_tx_mod (ff_tx_mod),
   .ff_tx_wren (ff_tx_wren),
   .ff_tx_err (ff_tx_err),
   .ff_tx_rdy (ff_tx_rdy),
   .ff_tx_sop (ff_tx_sop),
   .ff_tx_data (ff_tx_data),
   .ff_tx_eop (ff_tx_eop),
   .led_col (),
   .led_disp_err (led_disp_err),
   .led_char_err (led_char_err),
   .led_crs (led_crs),
   .led_link (led_link),
   .led_an (led_an),
   .led_panel_link (led_panel_link),
   .rxp (rxp),
   .txp (txp),
   .ff_rx_clk (ff_rx_clk),
   .rx_recovclkout (rx_recovclkout),
   .reconfig_fromgxb (reconfig_fromgxb),
   .reconfig_togxb (reconfig_togxb),
   .ff_tx_clk (ff_tx_clk),
   .clk (reg_clk),
   .reset (reset),
   .ff_tx_a_full (ff_tx_a_full),
   .ff_tx_a_empty (ff_tx_a_empty),
   .ff_rx_dsav (ff_rx_dsav),
   .rx_err_stat (rx_err_stat),
   .rx_frm_type (rx_frm_type),
   .ff_rx_a_full (ff_rx_a_full),
   .ff_tx_crc_fwd (ff_tx_crc_fwd),
   .ff_tx_septy (ff_tx_septy),
   .ff_rx_a_empty (ff_rx_a_empty),
   .tx_ff_uflow ()
);



assign  rxp = txp;



assign ff_rx_err_stat = { rx_err_stat[17], rx_err[5], rx_err_stat[15:0], rx_err_stat[16], rx_err[4:1]}; 
assign ff_rx_err      = rx_err [0];
assign ff_rx_vlan     = rx_frm_type [3];
assign ff_rx_bcast    = rx_frm_type [2];
assign ff_rx_mcast    = rx_frm_type [1];
assign ff_rx_ucast    = rx_frm_type [0];

assign tbi_rx_clk = rx_clk_1000;
assign tbi_tx_clk = tx_clk_1000;

                
assign mac_addr         = 48'h EE1122334450;
assign sup_mac_addr_0   = 48'h EE2233445560 ;
assign sup_mac_addr_1   = 48'h EE3344556670 ;
assign sup_mac_addr_2   = 48'h EE4455667780 ;           
assign sup_mac_addr_3   = 48'h EE5566778890 ;
assign frm_length_max   = TB_MACLENMAX;           

//  MDIO Slave Model
//  ----------------

generate
 if (ENABLE_MDIO == 1'b1)
  begin
assign mdio_in = mdio; 

always@(mdio_oen or mdio_out)
begin

        if (mdio_oen==1'b 1)
        begin
        
                mdio_tmp <= #(2) 1'b Z ;
                
        end
        else
        begin
        
                mdio_tmp <= #(2) mdio_out ;
                
        end
        
end

assign mdio = mdio_tmp ; 

        top_mdio_slave mdio_1 (
        
                .reset(reset),
                .mdc(mdc),
                .mdio(mdio),
                .dev_addr(phy_addr1),
                .conf_done(mdio1_done));
          
assign phy_addr1 = TB_MDIO_ADDR1; 
  end
endgenerate

// Checking FIFO Signals
// ---------------------
   
always@(reset or ff_rx_clk)
begin

        if (reset==1'b1)
        begin
                
                ff_rx_ucast_reg  <= 1'b0 ;
                ff_rx_bcast_reg  <= 1'b0 ;
                ff_rx_mcast_reg  <= 1'b0 ;
                ff_rx_vlan_reg   <= 1'b0 ;
                ff_rx_ucast_reg2 <= 1'b0 ;
                ff_rx_bcast_reg2 <= 1'b0 ;
                ff_rx_mcast_reg2 <= 1'b0 ;
                ff_rx_vlan_reg2  <= 1'b0 ; 
                
        end
        else
        begin
        
                if (ff_rx_sop==1'b1)
                begin
                
                        ff_rx_ucast_reg <= ff_rx_ucast ;
                        ff_rx_bcast_reg <= ff_rx_bcast ;
                        ff_rx_mcast_reg <= ff_rx_mcast ;
                        ff_rx_vlan_reg  <= ff_rx_vlan ;
                        
                end
                
                ff_rx_ucast_reg2 <= ff_rx_ucast_reg ;
                ff_rx_bcast_reg2 <= ff_rx_bcast_reg ;
                ff_rx_mcast_reg2 <= ff_rx_mcast_reg ;
                ff_rx_vlan_reg2  <= ff_rx_vlan_reg ;
                
        end
        
end

always@(ff_rx_clk)
begin

        if (ff_rx_clk==1'b1)
        begin

                if (mff_frm_rcvd==1'b1)
                begin
        
                        if (mff_dst_reg==48'hFFFFFFFFFFFF & ff_rx_bcast_reg2==1'b0)
                        begin
                        
                                $display("\n - Error: FIFO Broadcast Frame Error") ;
                                                                
                        end
                
                        if (mff_dst_reg!=48'hFFFFFFFFFFFF & mff_dst_reg[0]==1'b1 & ff_rx_mcast_reg2==1'b0 & mff_is_pause==1'b0)
                        begin
                        
                                $display("\n - Error: FIFO Multicast Frame Error") ;
                                                        
                        end
                
                        if (mff_dst_reg[0]==1'b0 & ff_rx_ucast_reg2==1'b0 & mff_is_pause==1'b0)
                        begin
                        
                                $display("\n - Error: FIFO Unicast Frame Error") ;
                                                                                        
                        end
                        
                        if (ff_rx_vlan_reg2==1'b1 & mff_is_vlan==1'b0)
                        begin
                        
                                $display("\n - Error: FIFO VLAN Frame Error") ;
                                                        
                        end
                
                end
                
        end
        
end 


//  Frame generator feeds TX FIFO (simulate user application) 
//  ---------------------------------------------------------

generate
 if (ENABLE_ENA == 32)
  begin
// 32-bit fifo data path
        top_ethgenerator32  ff_gen_32 (
        
                .reset(reset),
                .clk(ff_tx_clk_gen),
                .enable(ff_tx_rdy),
                .dout(ff_tx_data),
                .dval(ff_tx_wren_gen),
                .derror(ff_tx_err),
                .sop(ff_tx_sop),
                .eop(ff_tx_eop),
                .tmod(ff_tx_mod),
                .mac_reverse(ff_mac_reverse),
                .dst(ff_dst),
                .src(ff_src),
                .prmble_len(4'b0000),
                .pquant(ff_pquant),
                .vlan_ctl(ff_vlan_ctl),
                .len(ff_len),
                .frmtype(ff_frmtype),
                .cntstart(ff_cntstart),
                .cntstep(ff_cntstep),
                .ipg_len(ff_ipg_len),
                .payload_err(ff_payload_err),
                .prmbl_err(ff_prmbl_err),
                .crc_err(ff_crc_err),
                .vlan_en(ff_vlan_en),
                .stack_vlan(ff_stack_vlan_en),
                .pause_gen(ff_pause_gen),
                .pad_en(ff_pad_en),
                .phy_err(ff_phy_err),
                .end_err(ff_end_err),
                .data_only(1'b1),
                .start(ff_start_ether_gen),
                .done(ff_ether_gen_done));
          
        
        defparam ff_gen_32.ZERO_LATENCY   = ENABLE_MACLITE;
        defparam ff_gen_32.thold          = 2;
        defparam ff_gen_32.ENABLE_SHIFT16 = ENABLE_SHIFT16;
  end        
endgenerate
         
//  FIFO Monitor RX (user appl)
//  ---------------------------
 generate
  if (ENABLE_ENA == 32)
    begin

        top_ethmonitor32 ff_mon_32 (
        
                .reset(reset),
                .clk(ff_rx_clk),
                .din(ff_rx_data),
                .dval(ff_rx_dval),
                .derror(1'b0),
                .sop(ff_rx_sop),
                .eop(ff_rx_eop),
                .tmod(ff_rx_mod),
                .dst(mff_dst),
                .src(mff_src),
                .prmble_len(mff_prmble_len),
                .pquant(mff_pquant),
                .vlan_ctl(mff_vlan_ctl),
                .len(mff_len),
                .frmtype(mff_frmtype),
                .payload(mff_payload),
                .payload_vld(mff_payload_vld),
                .is_vlan(mff_is_vlan),
                .is_stack_vlan(mff_is_stack_vlan),
                .is_pause(mff_is_pause),
                .crc_err(mff_crc_err),
                .prmbl_err(mff_prmbl_err),
                .len_err(mff_len_err),
                .payload_err(mff_payload_err),
                .frame_err(mff_frame_err),
                .pause_op_err(mff_pause_op_err),
                .pause_dst_err(mff_pause_dst_err),
                .mac_err(mff_mac_err),
                .end_err(mff_end_err),
                .jumbo_en(jumbo_enable),
                .data_only(1'b1),
                .frm_rcvd(mff_frm_rcvd));   


        defparam ff_mon_32.ENABLE_SHIFT16 = ENABLE_SHIFT16;
    end
endgenerate


//  FIFO Generator model configuration (user application TX)
//  --------------------------------------------------------

assign ff_mac_reverse = 1'b 0; 
assign ff_dst = 48'h EE1122334450; 
assign ff_src = 48'h AA6655443322; 
assign ff_prmble_len = 5'b 01000; 
assign ff_pquant = TB_MODPAUSEQ ;
assign ff_vlan_ctl = 16'h 1234; 
assign ff_frmtype = 16'h 0000; 
assign ff_cntstart = 1'b 0; 
assign ff_cntstep = 1'b 1; 
assign ff_ipg_len = 16'h 4; 
assign ff_payload_err = 1'b 0; 
assign ff_prmbl_err = 1'b 0; 
assign ff_crc_err = 1'b 0; 
assign ff_vlan_en = TB_ENA_VLAN > 0 & txframe_cnt % TB_ENA_VLAN == TB_ENA_VLAN - 1'b 1 ? 1'b 1 : 1'b 0; 
assign ff_stack_vlan_en = TB_ENA_VLAN > 0 & txframe_cnt % (3*TB_ENA_VLAN) == TB_ENA_VLAN - 1'b 1 ? 1'b 1 : 1'b 0; 
assign ff_pad_en = 1'b 0; 
assign ff_phy_err = 1'b 0; 
assign ff_end_err = 1'b 0; 
assign ff_pause_gen = 1'b 0;

//  --------------------------------------------------------------------------------    
//  TX PATH Simulation
//  -------------------------------------------------------------------------------- 

//assign rxframe_cnt = txframe_cnt;
   
assign ff_tx_clk_gen = ff_tx_clk ; //  hold the generator if FIFO signals full
assign ff_tx_wren = ff_tx_wren_gen ; //  and stop writing during hold
assign ff_start_ether_gen = state == stm_typ_sim & sim_start == 1'b 1 & txsim_done == 1'b 0 & txframe_cnt < TB_TXFRAMES & HD_ENA == 1'b0 ? 1'b 1 : 
                        state == stm_typ_sim & sim_start == 1'b 1 & txsim_done == 1'b 0 & rxframe_cnt >= TB_RXFRAMES & txframe_cnt < TB_TXFRAMES & HD_ENA == 1'b1 ? 1'b 1 : 
                        1'b 0; //  START Generator
    
        always @(posedge reset or posedge ff_tx_clk)
        begin
   
                if (reset == 1'b 1)
                begin
      
                        txframe_cnt             <= 0;   
                        tx_vlan_sent            <= 0;
                        tx_stack_vlan_sent      <= 0;   
                        tx_payload_err_sent     <= 0;   
                        tx_good_sent            <= 0;   
                        txsim_done              <= 1'b 0;   
                        ff_len                  <= TB_LENSTART; 
                
                end
                
                else
                begin
                      
                   //  FIFO frame generator simulation finished
                   // -----------------------------------------

                        if (txframe_cnt >= TB_TXFRAMES & ff_ether_gen_done == 1'b 1 & rxframe_cnt >= TB_TXFRAMES)
                        begin
         
                                txsim_done <= 1'b 1;    //  STOP after last frame sent
         
                        end
         
                   //  configure generator for every frame
                   // ------------------------------------
       
                        if (ff_tx_sop == 1'b 1 & ff_tx_wren==1'b1 & ((ff_tx_rdy == 1'b1 & ENABLE_MACLITE == 1'b1) | ENABLE_MACLITE == 1'b0))
                        begin
         
                                txframe_cnt <= txframe_cnt + 1'b 1;                         //  TX FRAMEs sent to FIFO

                           //  increment payload length  
                           // --------------------------
      
                                process_4_ln = (ff_len + TB_LENSTEP) % (TB_LENMAX + 1'b 1); //  increment length for next frame
         
                                if (process_4_ln < 0)
                                begin

                                //  incase increment was negative
                                // ------------------------------
      
                                        process_4_ln = TB_LENMAX;   
            
                                end
                        
                                ff_len <= process_4_ln; //  update counters
                        
                                if (ff_vlan_en == 1'b 1 & ff_stack_vlan_en == 1'b 0)
                                begin
            
                                        tx_vlan_sent <= tx_vlan_sent + 1'b 1;   
            
                                end
                                
                                if (ff_vlan_en == 1'b 1 & ff_stack_vlan_en == 1'b 1)
                                begin
            
                                        tx_stack_vlan_sent <= tx_stack_vlan_sent + 1'b 1;   
            
                                end
         
                                if (ff_payload_err == 1'b 1)
                                begin
            
                                        tx_payload_err_sent <= tx_payload_err_sent + 1'b 1; 
                        
                                end
                        
                                if (ff_frmtype == 16'h 0000)
                                begin
            
                                        tx_good_sent <= tx_good_sent + 1'b 1;   
            
                                end
         
                        end
                  
                end

        end
   
   
//  -----------------------------------------------------------------------------------
//  TX/RX Pause Frame control block
//  -----------------------------------------------------------------------------------

always @(posedge reset or posedge tx_clk)
   begin : process_10
   if (reset == 1'b 1)
      begin
      tx_pause_wait <= 1'b 0;   
      tx_pause_cnt <= 0;    
      end
   else
      begin
      if (tx_pause_cnt != 0)
         begin
         if (gm_ether_gen_done == 1'b 1)
            begin
//  wait for TX to finish current frame
            tx_pause_cnt <= tx_pause_cnt - 1'b 1;   
            end
         end
      else
         begin
         tx_pause_wait <= 1'b 0;    
         end
      if (mgm_frm_rcvd == 1'b 1 & mgm_is_pause == 1'b 1 & 
    mgm_frame_err == 1'b 0 & mgm_crc_err == 1'b 0 & 
    TB_PAUSECONTROL == 1'b1)
         begin
         process_10_cnt = ({1'b 0, mgm_pquant});    
         tx_pause_cnt  <= process_10_cnt*64;    //  set pause counter
         tx_pause_wait <= 1'b 1;    //  stop TX
         end
      end
   end
   
//  Force Pause Frame Generation
//  ----------------------------
       
always @(posedge reset or posedge tx_clk)
   begin : process_11
   if (reset == 1'b 1)
      begin
      force_xoff_pause_cnt <= 0;    
      force_xon_pause_cnt <= 0;
      xoff_gen <= 1'b 0;
      xon_gen <= 1'b 0; 
      end
   else
      begin
      
     // Xoff Generation
     // ---------------
      
      if (TB_TRIGGERXOFF > 0 & state == stm_typ_sim & 
    HD_ENA == 1'b0)
         begin
         if (force_xoff_pause_cnt < TB_TRIGGERXOFF)
            begin
              force_xoff_pause_cnt <= force_xoff_pause_cnt + 1'b 1; 
            end
         else if (force_xoff_pause_cnt == TB_TRIGGERXOFF && ETH_MODE==1000)
            begin
              force_xoff_pause_cnt <= force_xoff_pause_cnt + 1'b 1;
            end
         else if ((force_xoff_pause_cnt == TB_TRIGGERXOFF||force_xoff_pause_cnt == TB_TRIGGERXOFF-1) && ETH_MODE!=1000)
            begin
              force_xoff_pause_cnt <= force_xoff_pause_cnt + 1'b 1;
            end
                        
         if (force_xoff_pause_cnt == TB_TRIGGERXOFF && ETH_MODE==1000)
            begin
            xoff_gen <= 1'b 1;  
            end
         else if ((force_xoff_pause_cnt == TB_TRIGGERXOFF || force_xoff_pause_cnt == TB_TRIGGERXOFF-1) && (ETH_MODE==100||ETH_MODE==10))
            begin
            xoff_gen <= 1'b 1;  
            end
         else
            begin
            xoff_gen <= 1'b 0;  
            end
         end
         
       // Xon Generation
       // --------------
       
      if (TB_TRIGGERXON > 0 & state == stm_typ_sim & 
    HD_ENA == 1'b0)
         begin
         if (force_xon_pause_cnt < TB_TRIGGERXON)
            begin
              force_xon_pause_cnt <= force_xon_pause_cnt + 1'b 1;   
            end
         else if (force_xon_pause_cnt == TB_TRIGGERXON && ETH_MODE==1000)
            begin
              force_xon_pause_cnt <= force_xon_pause_cnt + 1'b 1;
            end
         else if ((force_xon_pause_cnt == TB_TRIGGERXON||force_xon_pause_cnt == TB_TRIGGERXON-1) && ETH_MODE!=1000)
            begin
              force_xon_pause_cnt <= force_xon_pause_cnt + 1'b 1;
            end
                        
         if (force_xon_pause_cnt == TB_TRIGGERXON && ETH_MODE==1000)
            begin
            xon_gen <= 1'b 1;   
            end
         else if ((force_xon_pause_cnt == TB_TRIGGERXON || force_xon_pause_cnt == TB_TRIGGERXON-1) && (ETH_MODE==100||ETH_MODE==10))
            begin
            xon_gen <= 1'b 1;   
            end
         else
            begin
            xon_gen <= 1'b 0;   
            end
         end       
       
         
      end
   end  
                        
   
//  Total (Including Collision) Frames
//  ----------------------------------
always @(posedge reset or posedge tx_clk)
   begin : process_13
   if (reset == 1'b 1)
      begin
      tx_frm_all <= 0;  
      end
   else
      begin
      if (m_mgm_frm_rcvd == 1'b 1)
         begin
         tx_frm_all <= tx_frm_all + 1'b 1;  
         end
      end
   end
//  Expected signals: decide when we should expect something to happen
//  ------------------------------------------------------------------
always @(posedge rx_clk or posedge reset)
   begin : process_14
   if (reset == 1'b 1)
      begin
      expect1 <= 1'b 0; 
      expect2 <= 1'b 0; 
      end
   else
      begin
      if (gm_sop == 1'b 1 & expect2 == 1'b 0)
         begin
         expect2 <= 1'b 1;  //  immediately expect something
         expect1 <= 1'b 0;  //  and nothing else
         end
      else if (gm_sop == 1'b 1 )
         begin
         expect1 <= 1'b 1;  //  ok, when done later, immediately expect something else coming
         end
//  if a final event happend that indicates that something was received and
//  therefore some expected behaviour occured we can continue to watch
//  for new expected data
      if (pause_rcv == 1'b 1 | frm_type_err == 1'b 1 | 
    frm_align_err == 1'b 1 | ff_rx_eop == 1'b 1)
         begin
//  was: rx_stat_wren
         if (frm_align_err == 1'b 1 & expect1 == 1'b 1)
            begin
//  overlapped frame has an alignment error, but before the last frame
//  has been checked... so we have to do special things here
//  see alignment error checking behaviour.
            expect1 <= 1'b 0;   //  clear it, as it is processed now already
            end
         else
            begin
            expect2 <= 1'b 0;   //  pulse for at least 1 cycle    
            end
         end
//  if a new expectation was already inserted before we were done with the old, 
//  immediately restart it now as we have processed the last expected (2)
      if (expect1 == 1'b 1 & expect2 == 1'b 0)
         begin
//  there is something to expect !
         expect1 <= 1'b 0;  
         expect2 <= 1'b 1;  
         end
      end
   end


//  FIFO INTERFACE receive statistics counters
//  --------------------------------
always @(posedge ff_rx_clk or posedge reset)
   begin : process_17
   if (reset == 1'b 1)
      begin
      rxframe_cnt  <= 0;
      rx_good_rcvd <= 0;    
      rx_payload_err_rcvd <= 0; 
      rx_wrong_status_rcvd <= 0;    
      rx_length_err_rcvd <= 0;  
      rx_crc_err_rcvd <= 0; 
      rx_fifo_overflow_rcvd <= 0;   
      rx_gmii_err_rcvd <= 0;    
      rx_vlan_rcvd <= 0;
      rx_stack_vlan_rcvd <= 0;  
      rx_broadcast_rcvd <= 0;   
      rx_wrong_mac_rcvd <= 0;   
      rx_multicast_rcvd <= 0;   
      rx_non_discard_rcvd <= 0; 
      last_err_stat <= {4{1'b 0}};  
      ff_last_length <= {16{1'b 0}};    
      rx_length_mismatch_rcvd <= 0; 
      ff_frmlen <= 0;
      mff_payload_err_reg <= 1'b 0 ;
      mff_end_err_reg <= 1'b0 ; 
      mff_is_pause_reg <= 1'b0 ;
      mff_dst_reg <= 1'b0 ;
      end
   else
      begin
      
        mff_payload_err_reg <= mff_payload_err ;
        mff_end_err_reg <= mff_end_err ;
        mff_is_pause_reg <= mff_is_pause ;
        mff_dst_reg <= mff_dst ;
              
      if (ff_rx_eop == 1'b1)
        rxframe_cnt <= rxframe_cnt + 1;
       
              
//  count number of bytes received for the frame
      if (ff_rx_sop == 1'b 1)
         begin
         ff_frmlen <= 1;    
         end
      else if (ff_rx_dval == 1'b 1 )
         begin
         ff_frmlen <= ff_frmlen + 1'b 1;    
         end
      if (mff_frm_rcvd == 1'b 1 && mff_end_err_reg==1'b 0 && TB_MACPADEN==1'b1)
         begin
         mff_rxcnt <= mff_rxcnt + 1'b 1;    
         if (mff_payload_err == 1'b 1)
            begin
            rx_payload_err_rcvd <= rx_payload_err_rcvd + 1'b 1; 
            end
          //  verify that the status word length field really matches what we find in
          //  the frame.
         if (mff_len != ff_last_length & mff_is_pause == 1'b 0)
            begin
            rx_length_mismatch_rcvd <= rx_length_mismatch_rcvd + 1'b 1; 
            end
         if (last_err_stat == 4'b 0000)
            begin
          //  only good ones
                if(mff_dst==48'hFFFFFFFFFFFF)
                begin
                
                        rx_broadcast_rcvd <= rx_broadcast_rcvd+1;
                        
                end
                
                   if (ENABLE_SUP_ADDR)
                     begin
                        if(mff_dst_reg[0]==1'b0 & mac_addr != mff_dst_reg & sup_mac_addr_0 != mff_dst_reg & 
                           sup_mac_addr_1 != mff_dst_reg & sup_mac_addr_2 != mff_dst_reg & sup_mac_addr_3 != mff_dst_reg)
                        begin
            
                                rx_wrong_mac_rcvd <= rx_wrong_mac_rcvd+1'b1;     
                
                        end
                        else if(mff_dst_reg[0]==1'b1 & mff_is_pause==1'b0 & mff_dst_reg!=48'hFFFFFFFFFFFF)
                        begin
                
                                rx_multicast_rcvd <= rx_multicast_rcvd + 1'b1;
                
                        end
                    end    
                   else
                    begin                   
                        if (mff_dst_reg[0]==1'b0 & mac_addr != mff_dst_reg & sup_mac_addr_0 != mff_dst_reg & sup_mac_addr_1 != mff_dst_reg & sup_mac_addr_2 != mff_dst_reg & sup_mac_addr_3 != mff_dst_reg)
                        begin
            
                                rx_wrong_mac_rcvd <= rx_wrong_mac_rcvd+1'b1;     
                
                        end
                        else if(mff_dst[0]==1'b1 & mff_is_pause==1'b0 & mff_dst!=48'hFFFFFFFFFFFF)
                        begin
                
                                rx_multicast_rcvd <= rx_multicast_rcvd + 1;
                
                        end
                        
                   end
               
            end
         end
       else if (mff_frm_rcvd == 1'b 1 && TB_MACPADEN==1'b0)
         begin
         mff_rxcnt <= mff_rxcnt + 1'b 1;
         

                        if(mff_dst==48'hFFFFFFFFFFFF)
                        begin
                    
                                rx_broadcast_rcvd <= rx_broadcast_rcvd+1'b1;
    
                        end
                                                
                        if (ENABLE_SUP_ADDR)
                          begin    
                                if(mff_dst_reg[0]==1'b0 & (mac_addr != mff_dst_reg))
                                begin
                                            
                                        rx_wrong_mac_rcvd <= rx_wrong_mac_rcvd+1'b1;     
                    
                                end
                                else if(mff_dst_reg[0]==1'b1 & mff_is_pause==1'b0 & mff_dst_reg!=48'hFFFFFFFFFFFF)
                                begin
                
                                        rx_multicast_rcvd <= rx_multicast_rcvd + 1'b1;
                
                                end
                          end       
                        else
                          begin                        
                                if(mff_dst[0]==1'b0 & mac_addr != mff_dst & sup_mac_addr_0 != mff_dst & 
                                   sup_mac_addr_1 != mff_dst & sup_mac_addr_2 != mff_dst & sup_mac_addr_3 != mff_dst)
                                begin
            
                                        rx_wrong_mac_rcvd <= rx_wrong_mac_rcvd+1'b1;     
                    
                                end
                                else if(mff_dst[0]==1'b1 & mff_is_pause==1'b0 & mff_dst!=48'hFFFFFFFFFFFF)
                                begin
                
                                        rx_multicast_rcvd <= rx_multicast_rcvd + 1'b1;
                
                                end
                                
                          end
                  
         
         end                 
         
//  now check reception of good frames on FIFO interface
//  (we have no Preamble and CRC there, so do not check these errors on the MFF status)
      if (ff_rx_eop == 1'b 1 & mff_is_pause == 1'b 0)
         begin
//  good frames should come out
         rx_non_discard_rcvd <= rx_non_discard_rcvd + 1'b 1;    
         end
      if (ff_rx_eop == 1'b 1 & mff_is_pause == 1'b 0)
         begin
//  good frames should come out
//  remember the length as it was given from the FIFO
         ff_last_length <= ff_rx_err_stat[20:5];    
         rx_non_discard_rcvd <= rx_non_discard_rcvd + 1'b 1;    
         last_err_stat[3:0] <= ff_rx_err_stat[3:0]; //  save it for the monitor checks
         if (ff_rx_err_stat[3:0] == 0 & mff_is_pause == 1'b 0)
            begin
            rx_good_rcvd <= rx_good_rcvd + 1'b 1;   
            if (ff_rx_err_stat[4] == 1'b 1 & ff_rx_err_stat[22]== 1'b0 )
               begin
               rx_vlan_rcvd <= rx_vlan_rcvd + 1'b 1;    
               end
            
            if (ff_rx_err_stat[4] == 1'b 1 & ff_rx_err_stat[22] == 1'b 1)
               begin
               rx_stack_vlan_rcvd <= rx_stack_vlan_rcvd + 1'b 1;    
               end
            end
            
         else if (mff_is_pause == 1'b 0 )
            begin
//  some error occured
            rx_wrong_status_rcvd <= rx_wrong_status_rcvd + 1'b 1;   
            if (ff_rx_err_stat[0] == 1'b 1)
               begin
               rx_length_err_rcvd <= rx_length_err_rcvd + 1'b 1;    
               end
            else if (ff_rx_err_stat[1] == 1'b 1 )
               begin
               rx_crc_err_rcvd <= rx_crc_err_rcvd + 1'b 1;  
               end
            if (ff_rx_err_stat[2] == 1'b 1)
               begin
               rx_fifo_overflow_rcvd <= rx_fifo_overflow_rcvd + 1'b 1;  
               end
            if (ff_rx_err_stat[3] == 1'b 1)
               begin
               rx_gmii_err_rcvd <= rx_gmii_err_rcvd + 1'b 1;    
               end
            end
         end
      end
   end


assign promis_en = TB_PROMIS_ENA ? 1'b 1 : 1'b 0; 

//  Number of Received Pause Frames
//  -------------------------------
always @(posedge reset or posedge reg_clk)
   begin : process_19
   if (reset == 1'b 1)
      begin
      rx_pause_rcvd <= 0;   
      end
   else
      begin
      if (re_read_ena==1'b0 & state == stm_typ_rd_pause_rx & reg_busy == 1'b 0)
         begin
         rx_pause_rcvd <= reg_data_out; 
         end
      end
   end

//  Frames that should be discarded
//  -----------------------------------------------------
always @(posedge rx_clk or posedge reset)
   begin : process_21
   if (reset == 1'b 1)
      begin
      rx_discard_sent <= 0; 
      rx_discard_rcvd <= 0; 
      end
   else
      begin
      if (ff_tx_sop == 1'b 1)

         begin

         if (ff_dst[0] == 1'b 0 & ff_dst != mac_addr & ff_dst!=sup_mac_addr_0 & ff_dst!=sup_mac_addr_1 & 
             ff_dst!=sup_mac_addr_2 & ff_dst!=sup_mac_addr_3 & promis_en == 1'b 0 | 
             ff_dst[0] == 1'b 1 & multicast_wrong & ff_pause_gen == 1'b 0 & promis_en == 1'b 0 & ff_dst != 48'h FFFFFFFFFFFF | 
             ff_prmbl_err == 1'b 1 | 
             ff_pause_gen == 1'b 1) 

            begin
            rx_discard_sent <= rx_discard_sent + 1'b 1; 
            end
         end
      rx_discard_rcvd <= rxframe_cnt - rx_non_discard_rcvd; 
      end
   end
//  Block RX FIFO reading
//  ---------------------
assign ff_rx_rdy = stop_rx_fifo_read == 1'b 1 & rx_hold_cnt < TB_HOLDREAD & 
    ff_rx_dval == 1'b 0 ? 1'b 0 : 
    1'b 1; 
always @(posedge ff_rx_clk or posedge reset)
   begin : process_22
   if (reset == 1'b 1)
      begin
      stop_rx_fifo_read <= 1'b 0;   
      rx_hold_cnt <= 0; 
      rx_fifo_cnt <= 0; 
      end
   else
      begin
      if (ff_rx_sop == 1'b 1)
         begin
         rx_fifo_cnt <= rx_fifo_cnt + 1'b 1;    //  count each Frame read from the FIFO
         end
      if (TB_STOPREAD != 0 & TB_STOPREAD < rx_fifo_cnt & 
    stop_rx_fifo_read == 1'b 0)
         begin
         stop_rx_fifo_read <= 1'b 1;    
         end
      if (stop_rx_fifo_read == 1'b 1 & rx_hold_cnt < TB_HOLDREAD)
         begin
         rx_hold_cnt <= rx_hold_cnt + 1'b 1;    
         end
      end
   end
//  END RX 

// ---------------------- //
//  Control State Machine //
//  --------------------- //

always@(posedge reset or posedge reg_clk)
begin

        if (reset==1'b1)
        begin
                
                reg_busy_reg <= 1'b0 ;
                
        end
        else
        
                reg_busy_reg <= reg_busy ;
                
        end
        
always @(posedge reset or posedge reg_clk)
   begin : process_23
   if (reset == 1'b 1)
      begin
      state <= stm_typ_idle;    
      end
   else
      begin
      state <= nextstate;   
      end
   end

//---------------------------------------
always @(state or 
         sim_start or 
         reg_busy or 
         reg_busy_reg or 
         lut_prog_cnt or 
         txsim_done or 
         ff_rx_dsav or 
         gm_tx_en or 
         sim_cnt_end or
         led_link )
//---------------------------------------
begin : process_24
   case (state)
   stm_typ_idle:
      begin
      if (sim_start==1'b1)
      begin
         nextstate <= stm_typ_pcs_read_ver; 
      end
      else
       begin
         nextstate   <= stm_typ_idle ;
         re_read_ena <= 1'b0;
       end
      end 

   // PCS related

   stm_typ_pcs_read_ver:
    begin
    if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
       begin
       nextstate <= stm_typ_pcs_wr_scratch;   
       end
    else
       begin
       nextstate <= stm_typ_pcs_read_ver;   
       end
    end
   stm_typ_pcs_wr_scratch:
    begin
    if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
       begin
       nextstate <= stm_typ_pcs_rd_scratch;   
       end
    else
       begin
       nextstate <= stm_typ_pcs_wr_scratch;   
       end
    end
   stm_typ_pcs_rd_scratch:
    begin
    if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
       begin
       nextstate <= stm_typ_pcs_if_control;   
       end
    else
       begin
       nextstate <= stm_typ_pcs_rd_scratch;   
       end
    end
   stm_typ_pcs_if_control:
    begin
    if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
       begin
       nextstate <= stm_typ_pcs_wait_link; 
       end
    else
       begin
       nextstate <= stm_typ_pcs_if_control;   
       end
    end
   stm_typ_pcs_wait_link:
    begin
    if (led_link == 1'b 1)
       begin
       nextstate <= stm_typ_pcs_read_phy_control;   
       end
    else
       begin
       nextstate <= stm_typ_pcs_wait_link;   
       end
    end
   stm_typ_pcs_read_phy_control:
    begin
    if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
       begin
       nextstate <= stm_typ_pcs_read_sync_status;   
       end
    else
       begin
       nextstate <= stm_typ_pcs_read_phy_control;   
       end
    end
   stm_typ_pcs_read_sync_status:
    begin
    if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
       begin
       if (TB_ENA_AUTONEG)
          begin
          nextstate <= stm_typ_pcs_prog_ability;   
          end
       else
          begin
          nextstate <= stm_typ_pcs_autoneg_disable;   
          end
       end
    else
       begin
       nextstate <= stm_typ_pcs_read_sync_status;   
       end
    end
   stm_typ_pcs_autoneg_disable:
    begin
    if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
       begin
       nextstate <= stm_typ_read_ver;   

       end
    else
       begin
       nextstate <= stm_typ_pcs_autoneg_disable;   
       end
    end

   // MAC related

   stm_typ_read_ver:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_scratch;   
         end
      else
         begin
         nextstate <= stm_typ_read_ver; 
         end
      end
   stm_typ_wr_scratch:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rd_scratch;   
         end
      else
         begin
         nextstate <= stm_typ_wr_scratch;   
         end
      end
   stm_typ_rd_scratch:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_mac_config;   
         end
      else
         begin
         nextstate <= stm_typ_rd_scratch;   
         end
      end
   stm_typ_mac_config:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_mac1;  
         end
      else
         begin
         nextstate <= stm_typ_mac_config;   
         end
      end
   stm_typ_wr_mac1:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_mac2;  
         end
      else
         begin
         nextstate <= stm_typ_wr_mac1;  
         end
      end
   stm_typ_wr_mac2:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_ipg_len;   
         end
      else
         begin
         nextstate <= stm_typ_wr_mac2;  
         end
      end
   stm_typ_wr_ipg_len:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_frm_length;    
         end
      else
         begin
         nextstate <= stm_typ_wr_ipg_len;   
         end
      end
   stm_typ_wr_frm_length:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_pause_quanta;  
         end
      else
         begin
         nextstate <= stm_typ_wr_frm_length;    
         end
      end
   stm_typ_wr_pause_quanta:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_rx_se; 
         end
      else
         begin
         nextstate <= stm_typ_wr_pause_quanta;  
         end
      end
   stm_typ_wr_rx_se:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_rx_sf; 
         end
      else
         begin
         nextstate <= stm_typ_wr_rx_se; 
         end
      end
   stm_typ_wr_rx_sf:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_tx_se; 
         end
      else
         begin
         nextstate <= stm_typ_wr_rx_sf; 
         end
      end
   stm_typ_wr_tx_se:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_tx_sf; 
         end
      else
         begin
         nextstate <= stm_typ_wr_tx_se; 
         end
      end
   stm_typ_wr_tx_sf:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_rx_ae; 
         end
      else
         begin
         nextstate <= stm_typ_wr_tx_sf; 
         end
      end
   stm_typ_wr_rx_ae:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_rx_af; 
         end
      else
         begin
         nextstate <= stm_typ_wr_rx_ae; 
         end
      end
   stm_typ_wr_rx_af:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_tx_ae; 
         end
      else
         begin
         nextstate <= stm_typ_wr_rx_af; 
         end
      end
   stm_typ_wr_tx_ae:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_tx_af; 
         end
      else
         begin
         nextstate <= stm_typ_wr_tx_ae; 
         end
      end
   stm_typ_wr_tx_af:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
           if (TB_MDIO_SIMULATION==1'b1 && ENABLE_MDIO == 1'b1)
           begin
             nextstate <= stm_typ_wr_mdio_addr1;
           end
           else
           begin
         nextstate <= stm_typ_lut_prog; 
         end
         end
      else
         begin
         nextstate <= stm_typ_wr_tx_af; 
         end
      end
   stm_typ_wr_mdio_addr1:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_write_mdio1;  
         end
      else
         begin
         nextstate <= stm_typ_wr_mdio_addr1;    
         end
      end      
   stm_typ_write_mdio1:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_read_mdio1;   
         end
      else
         begin
         nextstate <= stm_typ_write_mdio1;  
         end
      end
   stm_typ_read_mdio1:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_lut_prog; 
         end
      else
         begin
         nextstate <= stm_typ_read_mdio1;   
         end
      end
   stm_typ_lut_prog_inc:
      begin
      if (lut_prog_cnt == MCAST_TABLEN)
         begin
         
           if (ENABLE_SUP_ADDR)
         
                nextstate <= stm_typ_wr_sup_mac0_0 ;
                
           else        
         
                nextstate <= stm_typ_sim;   
                
           
           
         end
      else
         begin
         nextstate <= stm_typ_lut_prog; 
         end
      end
   stm_typ_lut_prog:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_lut_prog_inc; 
         end
      else
         begin
         nextstate <= stm_typ_lut_prog; 
         end
      end
      
   stm_typ_wr_sup_mac0_0:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_sup_mac0_1;    
         end
      else
         begin
         nextstate <= stm_typ_wr_sup_mac0_0;    
         end
      end      
      
   stm_typ_wr_sup_mac0_1:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_sup_mac1_0;    
         end
      else
         begin
         nextstate <= stm_typ_wr_sup_mac0_1;    
         end
      end   
      
   stm_typ_wr_sup_mac1_0:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_sup_mac1_1;    
         end
      else
         begin
         nextstate <= stm_typ_wr_sup_mac1_0;    
         end
      end  
      
   stm_typ_wr_sup_mac1_1:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_sup_mac2_0;    
         end
      else
         begin
         nextstate <= stm_typ_wr_sup_mac1_1;    
         end
      end 
      
   stm_typ_wr_sup_mac2_0:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_sup_mac2_1;    
         end
      else
         begin
         nextstate <= stm_typ_wr_sup_mac2_0;    
         end
      end
      
   stm_typ_wr_sup_mac2_1:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_sup_mac3_0;    
         end
      else
         begin
         nextstate <= stm_typ_wr_sup_mac2_1;    
         end
      end
      
   stm_typ_wr_sup_mac3_0:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_wr_sup_mac3_1;    
         end
      else
         begin
         nextstate <= stm_typ_wr_sup_mac3_0;    
         end
      end
      
   stm_typ_wr_sup_mac3_1:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_sim;  
         end
      else
         begin
         nextstate <= stm_typ_wr_sup_mac3_1;    
         end
      end      
      
   stm_typ_sim:
      begin
      if (txsim_done == 1'b 1 & ff_rx_dsav != 1'b 1 )

         begin
         nextstate <= stm_typ_end_sim_wait; 
         end
      else
         begin
         nextstate <= stm_typ_sim;  
         end
      end
   stm_typ_end_sim_wait:
      begin
      if (sim_cnt_end> 1000)
         begin
            nextstate <= stm_typ_rd_pause_rx;
         end
      else
         begin
            nextstate <= stm_typ_end_sim_wait;
         end
      end
      
// Reading Statistic Registers
// ---------------------------

   stm_typ_rd_pause_rx:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
                if (STAT_CNT_ENA==1'b1)
                begin        
                        nextstate <= stm_typ_rd_frm_tx; 
                end
                else
                begin
                        nextstate <= stm_typ_end_sim;
                        
                end                
         end
      else
         begin
         nextstate <= stm_typ_rd_pause_rx;  
         end
      end             
   stm_typ_rd_frm_tx:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rd_frm_rx;    
         end
      else
         begin
         nextstate <= stm_typ_rd_frm_tx;    
         end
      end
   stm_typ_rd_frm_rx:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rd_crc_err;   
         end
      else
         begin
         nextstate <= stm_typ_rd_frm_rx;    
         end
      end      
   stm_typ_rd_crc_err:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rd_tx_octets; 
         end
      else
         begin
         nextstate <= stm_typ_rd_crc_err;   
         end
      end  
   stm_typ_rd_tx_octets:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rd_rx_octets; 
         end
      else
         begin
         nextstate <= stm_typ_rd_tx_octets; 
         end
      end        
   stm_typ_rd_rx_octets:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rd_align_err; 
         end
      else
         begin
         nextstate <= stm_typ_rd_rx_octets; 
         end
      end       
   stm_typ_rd_align_err:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rd_pause_tx;  
         end
      else
         begin
         nextstate <= stm_typ_rd_align_err; 
         end
      end  
   stm_typ_rd_pause_tx:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_unicast;   
         end
      else
         begin
         nextstate <= stm_typ_rd_pause_tx;  
         end
      end 
   stm_typ_rx_unicast:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_mltcast;   
         end
      else
         begin
         nextstate <= stm_typ_rx_unicast;   
         end
      end 
   stm_typ_rx_mltcast:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_brdcast;   
         end
      else
         begin
         nextstate <= stm_typ_rx_mltcast;   
         end
      end    
   stm_typ_rx_brdcast:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_tx_frm_discard;   
         end
      else
         begin
         nextstate <= stm_typ_rx_brdcast;   
         end
      end 
   stm_typ_tx_frm_discard:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_tx_unicast;   
         end
      else
         begin
         nextstate <= stm_typ_tx_frm_discard;   
         end
      end  
   stm_typ_tx_unicast:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_tx_mltcast;   
         end
      else
         begin
         nextstate <= stm_typ_tx_unicast;   
         end
      end 
   stm_typ_tx_mltcast:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_tx_brdcast;   
         end
      else
         begin
         nextstate <= stm_typ_tx_mltcast;   
         end
      end 
   stm_typ_tx_brdcast:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_frm_err;   
         end
      else
         begin
         nextstate <= stm_typ_tx_brdcast;   
         end
      end 
   stm_typ_rx_frm_err:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_tx_frm_err;   
         end
      else
         begin
         nextstate <= stm_typ_rx_frm_err;   
         end
      end 
   stm_typ_tx_frm_err:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_frm_drop;  
         end
      else
         begin
         nextstate <= stm_typ_tx_frm_err;   
         end
      end 
   stm_typ_rx_frm_drop:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_undersz_frm;   
         end
      else
         begin
         nextstate <= stm_typ_rx_frm_drop;  
         end
      end 
   stm_typ_rx_undersz_frm:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_oversz_frm;    
         end
      else
         begin
         nextstate <= stm_typ_rx_undersz_frm;   
         end
      end 
   stm_typ_rx_oversz_frm:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_64_frm;    
         end
      else
         begin
         nextstate <= stm_typ_rx_oversz_frm;    
         end
      end
   stm_typ_rx_64_frm:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_65_127_frm;    
         end
      else
         begin
         nextstate <= stm_typ_rx_64_frm;    
         end
      end 
   stm_typ_rx_65_127_frm:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_128_255_frm;   
         end
      else
         begin
         nextstate <= stm_typ_rx_65_127_frm;    
         end
      end
   stm_typ_rx_128_255_frm:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_256_511_frm;   
         end
      else
         begin
         nextstate <= stm_typ_rx_128_255_frm;   
         end
      end 
   stm_typ_rx_256_511_frm:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_512_1023_frm;  
         end
      else
         begin
         nextstate <= stm_typ_rx_256_511_frm;   
         end
      end 
   stm_typ_rx_512_1023_frm:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_1024_1518_frm; 
         end
      else
         begin
         nextstate <= stm_typ_rx_512_1023_frm;  
         end
      end   
   stm_typ_rx_1024_1518_frm:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_1519_X_frm;    
         end
      else
         begin
         nextstate <= stm_typ_rx_1024_1518_frm; 
         end
      end 
   stm_typ_rx_1519_X_frm:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_jabber;    
         end
      else
         begin
         nextstate <= stm_typ_rx_1519_X_frm;    
         end
      end  
   stm_typ_rx_jabber:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         nextstate <= stm_typ_rx_fragment;  
         end
      else
         begin
         nextstate <= stm_typ_rx_jabber;    
         end
      end 
   stm_typ_rx_fragment:
      begin
      if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
                
                if (re_read_ena==1'b1)
                begin
                
                        nextstate <= stm_typ_rd_sw_reset ;
                        
                end
                else
                begin
                
                        nextstate   <= stm_typ_sw_reset ;
                        re_read_ena <= 1'b1 ;
                        
                end                         
         end
      else
         begin
         nextstate <= stm_typ_rx_fragment;  
         end
      end 
      
   stm_typ_sw_reset:
   begin
   
        if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         
                nextstate <= stm_typ_rd_pause_rx ;
                                        
         end
         else
         begin
         
                nextstate <= stm_typ_sw_reset;  
                
         end
         
   end 
   
   stm_typ_rd_sw_reset:
   begin
   
        if (reg_busy == 1'b 0 && reg_busy_reg == 1'b1)
         begin
         
                nextstate <= stm_typ_end_sim ;
                                        
         end
         else
         begin
         
                nextstate <= stm_typ_rd_sw_reset;   
                
         end
         
   end               
                       
   stm_typ_end_sim:
      begin
      nextstate <= stm_typ_end_sim; 
      end
   endcase
   end
   
// Delay End of Simulation
// -----------------------

always@(posedge reset or posedge reg_clk)
begin
        if (reset==1'b 1)
        begin
        
                sim_cnt_end <= 0 ;
                
        end
        else
        begin
        
                if (state==stm_typ_end_sim_wait || state==stm_typ_end_sim)
                begin
        
                        sim_cnt_end <= sim_cnt_end+1'b1 ;
                        
                end
                else
                begin
                
                        sim_cnt_end <= 0 ;
                        
                end        
                
        end

end
   
//  LUT Table Address and PHY Port Counter
//  --------------------------------------

always @(posedge reset or posedge reg_clk)
   begin : process_25
   if (reset == 1'b 1)
      begin
      lut_prog_cnt     <= 0;
      end
   else
      begin
      if (nextstate == stm_typ_lut_prog_inc)
         begin
         
                lut_prog_cnt <= lut_prog_cnt + 1'b 1;   
         
         end

     end

end  
   
//  Register Interface
//  ------------------

always 
   begin : process_26
   reg_clk <= 1'b 1;    
   #( 10 ); 
   reg_clk <= 1'b 0;    
   #( 10 ); 
   end

always @(posedge reset or posedge reg_clk)
   begin : process_27
   if (reset == 1'b 1)
      begin
      reg_wr <= #(2)1'b 0;  
      reg_rd <= #(2)1'b 0;  
      reg_addr <= #(2) {8{1'b 0}};  
      reg_data_in <= #(2)  {32{1'b 0}}; 
      p_hash_hash_code <= {6{1'b 0}} ;  
      end
   else
      begin


      //PCS  registers programming

      if (nextstate == stm_typ_pcs_read_ver)
         begin
         reg_addr   <= #(2) 145;   
         reg_rd     <= #(2) 1'b 1;   
         reg_wr     <= #(2) 1'b 0;   
         reg_data_in<= #(2) {32{1'b 0}};   
         end
      else if (nextstate == stm_typ_pcs_if_control )
         begin
         reg_addr   <= #(2) 148;   

         reg_rd     <= #(2) 1'b 0;   
         reg_wr     <= #(2) 1'b 1;  
         reg_data_in[31:16]<= #(2) {16{1'b 0}};

          if (TB_SGMII_ENA==1'b1)
          begin
           reg_data_in[0] <= #(2) 1'b1;
          end
          else
          begin
           reg_data_in[0] <= #(2) 1'b0;
          end
          
          if (TB_SGMII_AUTO_CONF==1'b1)
          begin
           reg_data_in[1] <= #(2) 1'b1;
          end
          else
          begin
           reg_data_in[1] <= #(2) 1'b0;
          end
          
          if (TB_SGMII_AUTO_CONF==1'b1)
          begin
           reg_data_in[3:2] <= #(2) 2'b00;
          end         
          else if (TB_SGMII_1000==1'b1)
          begin
           reg_data_in[3:2] <= #(2) 2'b10;
          end
          else if (TB_SGMII_100==1'b1)
          begin
           reg_data_in[3:2] <= #(2) 2'b01;
          end
          else
          begin
           reg_data_in[3:2] <= #(2) 2'b00;
          end
          
          if (TB_SGMII_HD==1'b1)
          begin
           reg_data_in[4] <= #(2) 1'b1;
          end
          else
          begin
           reg_data_in[4] <= #(2) 1'b0;
          end
          
         reg_data_in[15:5]   <= #(2) 0;   
         end
      else if (nextstate == stm_typ_pcs_wr_scratch )
         begin
         reg_addr   <= #(2) 144;   
         reg_rd     <= #(2) 1'b 0;   
         reg_wr     <= #(2) 1'b 1;   
         reg_data_in[31:16]<= #(2) {16{1'b 0}};
         reg_data_in[15:0]<= #(2) 16'h AAAA;   
         end
      else if (nextstate == stm_typ_pcs_rd_scratch )
         begin
         reg_addr   <= #(2) 144;   
         reg_rd     <= #(2) 1'b 1;   
         reg_wr     <= #(2) 1'b 0;   
         reg_data_in<= #(2) {32{1'b 0}};   
         end
      else if (nextstate == stm_typ_pcs_read_sync_status | nextstate == stm_typ_pcs_read_status | 
         nextstate == stm_typ_pcs_read_status_2 )
         begin
         reg_addr   <= #(2) 129;   
         reg_rd     <= #(2) 1'b 1;   
         reg_wr     <= #(2) 1'b 0;   
         reg_data_in<= #(2) {32{1'b 0}};   
         end
      else if (nextstate == stm_typ_pcs_read_phy_control )
         begin
         reg_addr   <= #(2) 128;   
         reg_rd     <= #(2) 1'b 1;   
         reg_wr     <= #(2) 1'b 0;   
         reg_data_in<= #(2) {32{1'b 0}};
         end
      else if (nextstate == stm_typ_pcs_autoneg_disable )
         begin
         reg_addr   <= #(2) 128;   
         reg_rd     <= #(2) 1'b 0;   
         reg_wr     <= #(2) 1'b 1;   
         reg_data_in[31:16]<= #(2) {16{1'b 0}};
         reg_data_in<= #(2) 16'b 000000000000000;   
         end
      //MAC related
      else if (nextstate == stm_typ_read_ver)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 0;    
         reg_data_in <= #(2)  {32{1'b 0}};  
         end
      else if (nextstate == stm_typ_wr_scratch )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 1;    
         reg_data_in <= #(2)  32'h AAAAAAAA;    
         end
      else if (nextstate == stm_typ_rd_scratch )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 1;    
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_mac_config )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 2;
         reg_data_in <= #(2)  32'h 00000000;  

         reg_data_in[0] <= #(2) 1'b 1;       // Enable MAC  
         reg_data_in[1] <= #(2) 1'b 1;       // Enable MAC  

//  XON_Gen
//  ---------
         reg_data_in[2] <= #(2) xon_gen;    


//  Speed Selection
//  ---------------
         if (ETH_MODE == 1000)
            begin
            reg_data_in[3] <= #(2) 1'b 1;   
            end
         else
            begin
            reg_data_in[3] <= #(2) 1'b 0;   
            end

//  Unicast Filtering
//  -----------------
         if (TB_PROMIS_ENA == 1'b1)
            begin
            reg_data_in[4] <= #(2) 1'b 1;   
            end
         else
            begin
            reg_data_in[4] <= #(2) 1'b 0;   
            end
//  Enable Padding
//  --------------
         if (TB_MACPADEN == 1'b1)
            begin
            reg_data_in[5] <= #(2) 1'b 1;   
            end
         else
            begin
            reg_data_in[5] <= #(2) 1'b 0;   
            end
//  CRC Forwarding Enable
//  ---------------------
         if (TB_MACFWD_CRC == 1'b1)
            begin
            reg_data_in[6] <= #(2) 1'b 1;   
            end
         else
            begin
            reg_data_in[6] <= #(2) 1'b 0;   
            end
//  Enable Pause Frame Forwarding
//  -----------------------------
         if (TB_MACFWD_PAUSE == 1'b1)
            begin
            reg_data_in[7] <= #(2) 1'b 1;   
            end
         else
            begin
            reg_data_in[7] <= #(2) 1'b 0;   
            end
//  Ignore Pause Frames
//  -------------------
         if (TB_MACIGNORE_PAUSE == 1'b1)
            begin
            reg_data_in[8] <= #(2) 1'b 1;   
            end
         else
            begin
            reg_data_in[8] <= #(2) 1'b 0;   
            end
//  Source MAC Address Insertion
//  ----------------------------
         if (TB_MACINSERT_ADDR == 1'b1 & ENABLE_MAC_TXADDR_SET ==1'b1)
            begin
            reg_data_in[9] <= #(2) 1'b 1;   
            end
         else
            begin
            reg_data_in[9] <= #(2) 1'b 0;   
            end
//  Enable Half Duplex
//  ------------------
                 if (HD_ENA == 1'b 1 && ENABLE_HD_LOGIC ==1'b1)
            begin
            reg_data_in[10] <= #(2) 1'b 1;  
            end
         else
            begin
            reg_data_in[10] <= #(2) 1'b 0;  
            end
            
// Internal Loopback
// -----------------

   if (ENABLE_GMII_LOOPBACK)
     begin
         if (TB_RXFRAMES==0)
         begin
             
             reg_data_in[15] <= #(5) 1'b1;
             
         end
         else
         begin
        
                reg_data_in[15] <= #(5) 1'b0;  
                
         end      
     end        
   else
                     reg_data_in[15] <= #(5) 1'b0;
             
             
     
// Source MAC Address Selection 
// ----------------------------          

 
     if (ENABLE_SUP_ADDR)
             reg_data_in[18:16] <= #(5) TB_ADDR_SEL;
     else
             reg_data_in[18:16] <= #(5) 3'b000;
                   
                        
         // Magic Packet Enable
        //  ---------
            if (ENABLE_MAGIC_DETECT==1'b1) 
                reg_data_in[19] <= #(2) 1'b 1; 
            else
                    reg_data_in[19] <= #(2) 1'b 0;



//  XOFF_Gen
//  ---------
         reg_data_in[22] <= #(2) xoff_gen;  
        
        // 10Mbps Speed Selection
        //  ---------
            if (ETH_MODE == 10)
                   reg_data_in[25] <= #(2) 1'b 1;
            else
                   reg_data_in[25] <= #(2) 1'b 0;

        // Discard any errored in received frames
        //  ---------
            if (TB_MACRX_ERR_DISC == 1)
                   reg_data_in[26] <= #(2) 1'b 1;
            else
                   reg_data_in[26] <= #(2) 1'b 0;
    
    end
        
      else if (nextstate == stm_typ_wr_mac1 )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 3;    
         reg_data_in <= #(2)  mac_addr[31:0];   
         end
      else if (nextstate == stm_typ_wr_mac2 )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 4;    
         reg_data_in[15:0]  <= #(2) mac_addr[47:32];    
         reg_data_in[31:16] <= #(2) {16{1'b 0}};    
         end
         
      else if (nextstate == stm_typ_wr_ipg_len)
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 23;   
         reg_data_in <= #(2) TB_IPG_LENGTH; 
         end         
         
      else if (nextstate==stm_typ_wr_sup_mac0_0)
      begin
      
         reg_wr      <= #(2)1'b 1;  
         reg_rd      <= #(2) 1'b 0; 
         reg_addr    <= #(2) 192;   
         reg_data_in <= #(2) sup_mac_addr_0[31:0];           
         
      end
      
      else if (nextstate==stm_typ_wr_sup_mac0_1)
      begin
      
         reg_wr             <= #(2)1'b 1;   
         reg_rd             <= #(2) 1'b 0;  
         reg_addr           <= #(2) 193;    
         reg_data_in[15:0]  <= #(2) sup_mac_addr_0[47:32];
         reg_data_in[31:16] <= #(2) {16{1'b 0}};             
         
      end
      
      else if (nextstate==stm_typ_wr_sup_mac1_0)
      begin
      
         reg_wr      <= #(2)1'b 1;  
         reg_rd      <= #(2) 1'b 0; 
         reg_addr    <= #(2) 194;   
         reg_data_in <= #(2) sup_mac_addr_1[31:0];           
         
      end
      
      else if (nextstate==stm_typ_wr_sup_mac1_1)
      begin
      
         reg_wr             <= #(2)1'b 1;   
         reg_rd             <= #(2) 1'b 0;  
         reg_addr           <= #(2) 195;    
         reg_data_in[15:0]  <= #(2) sup_mac_addr_1[47:32];
         reg_data_in[31:16] <= #(2) {16{1'b 0}};             
         
      end
      
      else if (nextstate==stm_typ_wr_sup_mac2_0)
      begin
      
         reg_wr      <= #(2)1'b 1;  
         reg_rd      <= #(2) 1'b 0; 
         reg_addr    <= #(2) 196;   
         reg_data_in <= #(2) sup_mac_addr_2[31:0];           
         
      end
      
      else if (nextstate==stm_typ_wr_sup_mac2_1)
      begin
      
         reg_wr             <= #(2)1'b 1;   
         reg_rd             <= #(2) 1'b 0;  
         reg_addr           <= #(2) 197;    
         reg_data_in[15:0]  <= #(2) sup_mac_addr_2[47:32];
         reg_data_in[31:16] <= #(2) {16{1'b 0}};             
         
      end
      
      else if (nextstate==stm_typ_wr_sup_mac3_0)
      begin
      
         reg_wr      <= #(2)1'b 1;  
         reg_rd      <= #(2) 1'b 0; 
         reg_addr    <= #(2) 198;   
         reg_data_in <= #(2) sup_mac_addr_3[31:0];           
         
      end
      
      else if (nextstate==stm_typ_wr_sup_mac3_1)
      begin
      
         reg_wr             <= #(2)1'b 1;   
         reg_rd             <= #(2) 1'b 0;  
         reg_addr           <= #(2) 199;    
         reg_data_in[15:0]  <= #(2) sup_mac_addr_3[47:32];
         reg_data_in[31:16] <= #(2) {16{1'b 0}};             
         
      end         
         
         
      else if (nextstate == stm_typ_wr_frm_length )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 5;    
         reg_data_in[15:0]  <= #(2) TB_MACLENMAX;   
         reg_data_in[31:16] <= #(2) {16{1'b 0}};    
         end
      else if (nextstate == stm_typ_wr_pause_quanta )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 6;    
         reg_data_in[15:0]  <= #(2) TB_MACPAUSEQ;   
         reg_data_in[31:16] <= #(2) {16{1'b 0}};    
         end
      
      else if (nextstate == stm_typ_wr_rx_se )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 7;    
         reg_data_in[ING_ADDR-1:0] <= #(2) RX_FIFO_SECTION_EMPTY ;   
         reg_data_in[31:ING_ADDR]  <= #(2) 0;
         end
      else if (nextstate == stm_typ_wr_rx_sf )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 8;    
         reg_data_in[ING_ADDR-1:0] <= #(2) RX_FIFO_SECTION_FULL ;    
         reg_data_in[31:ING_ADDR]  <= #(2) 0 ;  
         end
      else if (nextstate == stm_typ_wr_tx_se )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 9;    
         reg_data_in[EG_ADDR-1:0] <= #(2) TX_FIFO_SECTION_EMPTY ;    
         reg_data_in[31:EG_ADDR]  <= #(2) 0 ;   
         end
      else if (nextstate == stm_typ_wr_tx_sf )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 10;   
         reg_data_in[EG_ADDR-1:0] <= #(2) TX_FIFO_SECTION_FULL ; 
         reg_data_in[31:EG_ADDR]  <= #(2) 0 ;   
         end
      else if (nextstate == stm_typ_wr_rx_ae )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 11;   
         reg_data_in[ING_ADDR-1:0] <= #(2) RX_FIFO_AE ;  
         reg_data_in[31:ING_ADDR]  <= #(2) 0 ;  
         end
      else if (nextstate == stm_typ_wr_rx_af )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 12;   
         reg_data_in[ING_ADDR-1:0] <= #(2) RX_FIFO_AF ;  
         reg_data_in[31:ING_ADDR]  <= #(2) 0 ;  
         end
      else if (nextstate == stm_typ_wr_tx_ae )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 13;   
         reg_data_in[EG_ADDR-1:0] <= #(2) TX_FIFO_AE ;   
         reg_data_in[31:EG_ADDR]  <= #(2) 0 ;   
         end
      else if (nextstate == stm_typ_wr_tx_af )
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 14;   
         reg_data_in[EG_ADDR-1:0] <= #(2) TX_FIFO_AF ;   
         reg_data_in[31:EG_ADDR]  <= #(2) 0 ;   
         end         
       else if (nextstate == stm_typ_wr_mdio_addr1 )
          begin
          reg_wr <= #(2)1'b 1;   
          reg_rd <= #(2) 1'b 0;  
          reg_addr <= #(2) 16;   
          reg_data_in[4:0]  <= #(2) TB_MDIO_ADDR1;   
          reg_data_in[31:5] <= #(2) {27{1'b 0}}; 
          end         
       else if (nextstate == stm_typ_write_mdio1 )
          begin
          reg_wr <= #(2)1'b 1;   
          reg_rd <= #(2) 1'b 0;  
          reg_addr <= #(2) 160;  
          reg_data_in <= #(2) 32'h 55555555; 
          end
       else if (nextstate == stm_typ_read_mdio1 )
          begin
          reg_wr <= #(2)1'b 0;   
          reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 160;  
          reg_data_in <= #(2) 32'h 00000000; 
          end
      else if (nextstate == stm_typ_lut_prog )
         begin
         
                case (lut_prog_cnt)
                
                        0:
                                begin
                                p_hash_mcast_addr = MCAST_ADDRESSLIST[47:0];
                                end
                        1:
                                begin
                                p_hash_mcast_addr = MCAST_ADDRESSLIST[48+47:48];
                                end
                        2:
                                begin
                                p_hash_mcast_addr = MCAST_ADDRESSLIST[2*48+47:2*48];
                                end
                        3:
                                begin
                                p_hash_mcast_addr = MCAST_ADDRESSLIST[3*48+47:3*48];
                                end
                        4:
                                begin
                                p_hash_mcast_addr = MCAST_ADDRESSLIST[4*48+47:4*48];
                                end
                        5:
                                begin
                                p_hash_mcast_addr = MCAST_ADDRESSLIST[5*48+47:5*48];
                                end
                        6:
                                begin
                                p_hash_mcast_addr = MCAST_ADDRESSLIST[6*48+47:6*48];
                                end
                        7:
                                begin
                                p_hash_mcast_addr = MCAST_ADDRESSLIST[7*48+47:7*48];
                                end
                        default:
                                begin
                                p_hash_mcast_addr = MCAST_ADDRESSLIST[8*48+47:8*48];
                                end
               endcase
               
                p_hash_hash_code[0] = ^(p_hash_mcast_addr[7:0]);    
                p_hash_hash_code[1] = ^(p_hash_mcast_addr[15:8]);   
                p_hash_hash_code[2] = ^(p_hash_mcast_addr[23:16]);  
                p_hash_hash_code[3] = ^(p_hash_mcast_addr[31:24]);  
                p_hash_hash_code[4] = ^(p_hash_mcast_addr[39:32]);  
                p_hash_hash_code[5] = ^(p_hash_mcast_addr[47:40]);
         
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr[7:6] <= 2'b 01;   
         reg_addr[5:0] <= p_hash_hash_code ;    
         reg_data_in <= #(2)  32'h 00000001;    
         end
      else if (nextstate == stm_typ_rd_pause_rx )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 33;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rd_pause_tx )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 32;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_unicast )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 36;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rd_frm_tx )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 26;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rd_frm_rx )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 27;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rd_crc_err )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 28;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rd_align_err )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 29;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rd_tx_octets )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 30;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rd_rx_octets )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 31;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_mltcast )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 37;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_brdcast )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 38;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_tx_frm_discard )
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 39;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_tx_unicast)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 40;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_tx_mltcast)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 41;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_tx_brdcast)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 42;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_frm_err)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 34;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_tx_frm_err)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 35;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_frm_drop)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 43;   
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_undersz_frm)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 46 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_oversz_frm)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 47 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_64_frm)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 48 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_65_127_frm)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 49 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_128_255_frm)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 50 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_256_511_frm)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 51 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_512_1023_frm)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 52 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_1024_1518_frm)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 53 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_1519_X_frm)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 54 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_jabber)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 55 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_rx_fragment)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 56 ;  
         reg_data_in <= #(2)  32'h 00000000;    
         end
      else if (nextstate == stm_typ_sw_reset)
         begin
         reg_wr <= #(2)1'b 1;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) 2 ;   
         
         reg_data_in[12:0]  <= #(2)  13'b 0000000000011;
         reg_data_in[13]    <= #(2)  1'b1;
         reg_data_in[30:14] <= #(2)  0;
         reg_data_in[31]    <= #(2)  1'b1;
            
         end
      else if (nextstate == stm_typ_rd_sw_reset)
         begin
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 1;  
         reg_addr <= #(2) 2 ;   // fix for SPR 254641      
         reg_data_in <= #(2)  32'h 00000000;            
         end
      else
         begin // fix for SPR 254641
         reg_wr <= #(2)1'b 0;   
         reg_rd <= #(2) 1'b 0;  
         reg_addr <= #(2) {8{1'b 0}};   
         reg_data_in <= #(2)  {32{1'b 0}}; 
         end
      end
   end
   
//  Core Registers
//  --------------

   // Statistics
   // ----------
   
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_pause_rx && reg_busy==1'b0)
                begin

                        $display("\n - ---------------------------------------------------------------------------------------- -\n") ;
                        $display(" Core Statistic Counters\n") ;
                        $display("    - Number of Received Pause Frames : %d", reg_data_out) ;
                                                
                end 
                
        end  
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_sw_reset && reg_busy==1'b0)
                begin

                        $display("-\n ---------------------------------------------------------------------------------------- -\n") ;
                        
                        if (reg_data_out[13]==1'b0)
                        begin       
                        
                                        
                                $display("   - SW Reset Register Cleared") ;
                                
                        end
                        else
                        begin
                                
                                $display("   - Error: SW Reset Register NOT Cleared") ;
                                        
                        end 

                        if (reg_data_out[0]==1'b0)
                        begin       
                        
                                        
                                $display("   - MAC Transmit Disabled") ;
                                
                        end
                        else
                        begin
                                
                                $display("   - Error: MAC Transmit NOT Disabled") ;
                                        
                        end
                        
                        if (reg_data_out[1]==1'b0)
                        begin       
                        
                                        
                                $display("   - MAC Receive Disabled") ;
                                
                        end
                        else
                        begin
                                
                                $display("   - Error: MAC Receive NOT Disabled") ;
                                        
                        end 
                                                
                end 
                
        end
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_pause_tx && reg_busy==1'b0)
                begin

                        $display("    - Number of Transmitted Pause Frames : %d", reg_data_out) ;
                                                
                end 
                
        end
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_frm_tx && reg_busy==1'b0)
                begin

                        $display("    - Number of Transmitted Correct Frames - With Pause Frames : %d", reg_data_out) ;
                                                
                end 
                
        end  
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_frm_rx && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Correct Frames - With Pause Frames : %d", reg_data_out) ;
                                                
                end 
                
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_crc_err && reg_busy==1'b0)
                begin

                        $display("    - Number of Frames Received with CRC Error : %d", reg_data_out) ;
                                                
                end 
                
        end
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_align_err && reg_busy==1'b0)
                begin

                        $display("    - Number of Frames Received with an Alignment Error : %d", reg_data_out) ;
                                                
                end 
                
        end  
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_tx_octets && reg_busy==1'b0)
                begin

                        $display("    - Number of Transmitted Octets : %d", reg_data_out) ;
                                                
                end 
                
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_rx_octets && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Octets : %d", reg_data_out) ;
                                                
                end 
                
        end    
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_unicast && reg_busy==1'b0 )
                begin

                        $display("    - Number of Received Unicast Frames : %d", reg_data_out) ;
                                                
                end 
                
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_mltcast && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Multicast Frames : %d", reg_data_out) ;
                                                
                end 
                
        end  
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_brdcast && reg_busy==1'b0 )
                begin

                        $display("    - Number of Received Broadcast Frames : %d", reg_data_out) ;
                                                
                end 
                
        end  
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_tx_unicast && reg_busy==1'b0 )
                begin

                        $display("    - Number of Transmitted Unicast Frames : %d", reg_data_out) ;
                                                
                end 
                
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_tx_mltcast && reg_busy==1'b0 )
                begin

                        $display("    - Number of Transmitted Multicast Frames : %d", reg_data_out) ;
                                                
                end 
                
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_tx_brdcast && reg_busy==1'b0 )
                begin

                        $display("    - Number of Transmitted Broadcast Frames : %d", reg_data_out) ;
                                                
                end 
                
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_frm_err && reg_busy==1'b0 )
                begin

                        $display("    - Number of Frames Received with an Error : %d", reg_data_out) ;
                                                
                end 
     
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_tx_frm_err && reg_busy==1'b0 )
                begin

                        $display("    - Number of Frames Transmitted with an Error : %d", reg_data_out) ;
                                                
                end 
     
        end
        
   // RMON Counters
   // -------------
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_frm_drop && reg_busy==1'b0) 
                begin

                        $display("\n RMON Counters\n") ;
                        $display("    - Number of Frames Dropped Because of FIFO Overflow : %d", reg_data_out) ;
                                                
                end 
     
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_undersz_frm && reg_busy==1'b0 )
                begin

                        $display("    - Number of Received Undersized Frames : %d", reg_data_out) ;
                                                
                end 
     
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_oversz_frm && reg_busy==1'b0 )
                begin

                        $display("    - Number of Received Oversized Frames : %d", reg_data_out) ;
                                                
                end 
     
        end
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_64_frm && reg_busy==1'b0)
                begin

                        $display("    - Number of Received 64-Bytes Frames : %d", reg_data_out) ;
                                                
                end 
     
        end  
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_65_127_frm && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Frames with Size Between 65 and 127 Bytes : %d", reg_data_out) ;
                                                
                end 
     
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_128_255_frm && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Frames with Size Between 128 and 255 Bytes : %d", reg_data_out) ;
                                                
                end 
     
        end
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_256_511_frm && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Frames with Size Between 256 and 511 Bytes : %d", reg_data_out) ;
                                                
                end 
     
        end 
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_512_1023_frm && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Frames with Size Between 512 and 1023 Bytes : %d", reg_data_out) ;
                                                
                end 
     
        end  
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_1024_1518_frm && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Frames with Size Between 1024 and 1518 Bytes : %d", reg_data_out) ;
                                                
                end 
     
        end
        
                always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_1519_X_frm && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Frames with Size Between 1519 and Max Frame Length : %d", reg_data_out) ;
                                                
                end 
     
        end
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_jabber && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Jabber Frames (Oversize with Wrong CRC) : %d", reg_data_out) ;
                                                
                end 
     
        end
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rx_fragment && reg_busy==1'b0)
                begin

                        $display("    - Number of Received Fragments (Undersized with Wrong CRC) : %d", reg_data_out) ;
                                                
                end 
     
        end
        
        always@(state)                        
        begin
        
                if (state==stm_typ_sw_reset)
                begin
                
                        $display("\n- ---------------------------------------------------------------------------------------- -\n") ;
                        $display(" - Clearing Statistics") ;
                        
                end
                
        end         

   // Core Version
   // ------------

        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_read_ver && reg_busy==1'b0)
                begin
                
            $display(" - Altera Design Version : %0d.%0d ", reg_data_out[15:8], reg_data_out[7:0] ) ;
                                                
                end 
                
        end
        
   // Scratch Register
   // ----------------
        
        always@(state or nextstate)
        begin
        
                if (state==stm_typ_wr_scratch && nextstate==stm_typ_rd_scratch )
                begin
                
                        $display("\n - Write Scratch : 0xaaaaaaaa") ;
                                                
                end 
                
        end
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_rd_scratch && reg_busy==1'b0)
                begin
                        readback_scratch <= reg_data_out;
                        $display(" - Read Scratch : 0x%h", reg_data_out) ;
                                                
                end 
                
        end     

   // Core Configuration
   // ------------------
   
        always@(state)
        begin
                
                if (state==stm_typ_wr_sup_mac0_0)
                begin
                
                        $display("\n - Setting Supplemental MAC Addresses") ;
                        
                end
                
        end    
   
        always@(state)                        
        begin
        
                if (state==stm_typ_lut_prog && lut_prog_cnt==1)
                begin
                
                        $display(" - Load Hash Table") ;
                        
                end
                
        end 
   
        always@(state)
        begin
        
                if (state==stm_typ_mac_config)
                begin
                
                        $display("\n - MAC Configuration") ;
                                                
                end 
                
        end  
        
        always@(state)
        begin
        
                if (state==stm_typ_wr_mac1)
                begin
                
                        $display("\n - Write MAC Address") ;
                                                
                end 
                
        end 
        
        always@(state)
        begin
        
                if (state==stm_typ_wr_frm_length)
                begin
                
                        $display("\n - Write Maximum Frame Length") ;
                                                
                end 
                
        end 
        
        always@(state)
        begin
        
                if (state==stm_typ_wr_pause_quanta)
                begin
                
                        $display("\n - Write Pause Quanta") ;
                                                
                end 
                
        end  
        
   // MDIO Test
   // ---------
        
        
        always@(state)
        begin
        
                if (state==stm_typ_wr_mdio_addr1)
                begin
                
                        $display(" - Programming MDIO Base Address 1 : 0x%h", TB_MDIO_ADDR1) ;
                                                
                end 
                
        end
        
        
        always@(state)
        begin
        
                if (state==stm_typ_write_mdio1)
                begin
                
                        $display("\n - Writing MDIO Slave 1 Register 0 : 0x00005555") ;
                                                
                end 
                
        end 
        
        always@(state)
        begin
        
                if (state==stm_typ_wr_rx_se)
                begin
                
                        $display("\n - Setting FIFO Thresholds\n") ;
                                                
                end 
                
        end 
        
        
        always@(posedge(reg_clk))
        begin
        
                if (state==stm_typ_read_mdio1 && reg_busy==1'b0 )
                begin
                
                        readback_MDIO1_addr0 <= reg_data_out;
                        $display(" - Reading MDIO Slave 1 Register 0 : 0x%h\n", reg_data_out) ;
                                                
                end 
                
        end   
        
        always@(state)
        begin
        
                if (state==stm_typ_sim)
                begin
                
                        $display("\n - ---------------------------------------------------------------------------------------- -\n") ;
                                                
                end 
                
        end                         
   
//  -----------------------
//  register test status
//  -----------------------


always @(posedge reset or state or nextstate)

   begin

       if (reset == 1'b 1)
          begin
          register_test <= 0;   
          end
       else
          begin
              if (nextstate == stm_typ_end_sim_wait & state == stm_typ_sim)
                begin
                    // expected scratch register readback is 0xaaaaaaaa
                    // expected MDIO slave 1 address 0 register readback is 0x00005555
                    //
                    if (readback_scratch != 32'haaaaaaaa)
                      begin
                         $display("\n      Register test failed on SCRATCH register") ;
                         register_test <= 1;
                      end

                    if (TB_MDIO_SIMULATION == 1'b1 && ENABLE_MDIO == 1'b1)
                       begin
                       if ( (readback_MDIO1_addr0 != 32'h00005555) )
                        begin

                         $display("\n      Register test failed on MDIO Slave 1 register") ;
                         register_test <= 1;

                        end 
    
                       end
    
               end
          end
   end


   
//  Global Simulation STOP
//  ----------------------

always @(posedge reset or posedge rx_clk)
   begin : process_28
   if (reset == 1'b 1)
      begin
      delay_cnt <= 0;   
      sim_stop <= 1'b 0;    
      end
   else
      begin
      if (state == stm_typ_end_sim)
         begin
         delay_cnt <= delay_cnt + 1'b 1;    
         if (delay_cnt > 200)
            begin
            sim_stop <= 1'b 1;  
            end
         end
      end
   end

   // Clock Assignments
   // -----------------
        
        always 
        begin
   
                tx_clk_1000 <= 1'b 1;   
                #(4); 
                tx_clk_1000 <= 1'b 0;   
                #(4); 
                end

        always 
        begin
   
                rx_clk_1000 <= 1'b 0;   
                #(4); 
                rx_clk_1000 <= 1'b 1;   
                #(4); 
   
        end
        
        always 
        begin
   
                tx_clk_100 <= 1'b 1;    
                #(20); 
                tx_clk_100 <= 1'b 0;    
                #(20); 
                end

        always 
        begin
   
                rx_clk_100 <= 1'b 0;    
                #(20); 
                rx_clk_100 <= 1'b 1;    
                #(20); 
   
        end
        
        always 
        begin
   
                tx_clk_10 <= 1'b 1; 
                #(200); 
                tx_clk_10 <= 1'b 0; 
                #(200); 
                end

        always 
        begin
   
                rx_clk_10 <= 1'b 0; 
                #(200); 
                rx_clk_10 <= 1'b 1; 
                #(200); 
   
        end
       
        always@(tx_clk_1000 or tx_clk_100 or tx_clk_10)
        begin
        
                if (ETH_MODE==1000)
                begin
                
                        tx_clk <= tx_clk_1000 ;
                        
                end
                
                else if (ETH_MODE==100)
                begin
                
                        tx_clk <= tx_clk_100 ;        
                        
                end
                
                else if (ETH_MODE==10)
                begin 
                
                        tx_clk <= tx_clk_10 ;
                        
                end
                
        end
        
        always@(rx_clk_1000 or rx_clk_100 or rx_clk_10 or tx_clk_1000 or tx_clk_100 or tx_clk_10)                     
        begin
        
                if (TB_RXFRAMES==0)
                begin
                
                        if (ETH_MODE==1000)
                        begin
                
                                rx_clk <= tx_clk_1000 ;
                        
                        end
                
                        else if (ETH_MODE==100)
                        begin
                
                                rx_clk <= tx_clk_100 ;        
                        
                        end
                
                        else if (ETH_MODE==10)
                        begin 
                
                                rx_clk <= tx_clk_10 ;
                        
                        end
                        
                end
                        
                else
                begin      
        
                        if (ETH_MODE==1000)
                        begin
                
                                rx_clk <= rx_clk_1000 ;
                        
                        end
                
                        else if (ETH_MODE==100)
                        begin
                
                                rx_clk <= rx_clk_100 ;        
                        
                        end
                
                        else if (ETH_MODE==10)
                        begin 
                
                                rx_clk <= rx_clk_10 ;
                        
                        end
                        
                end
                
        end 
        
   // GMII Interface
   // --------------
        
        always@(gm_rxgen_rx_d or gm_tx_data)
        begin
        
           if (ENABLE_GMII_LOOPBACK)
             begin
                if (TB_RXFRAMES==0)
                begin
                
                        gm_rx_data <= 8'h0 ;
                        
                end
                
                else
                begin
                
                        gm_rx_data <= gm_rxgen_rx_d ; 
                        
                end
             end
           else
             begin     
                if (TB_RXFRAMES==0)
                begin
                
                        gm_rx_data <= gm_tx_data ;
                        
                end
                
                else
                begin
                
                        gm_rx_data <= gm_rxgen_rx_d ; 
                        
                end
             end                
                
                
        end
        
        always@(gm_rxgen_rx_en or gm_tx_en)
        begin
        
           if (ENABLE_GMII_LOOPBACK)
             begin
                if (TB_RXFRAMES==0)
                begin
                
                        gm_rx_en <= 1'b0 ;
                        
                end
                
                else
                begin
                
                        gm_rx_en <= gm_rxgen_rx_en ; 
                        
                end
             end           
           else
             begin        
                if (TB_RXFRAMES==0)
                begin
                
                        gm_rx_en <= gm_tx_en ;
                        
                end
                
                else
                begin
                
                        gm_rx_en <= gm_rxgen_rx_en ; 
                        
                end
                
             end                        
                
        end
        
        always@(gm_rxgen_rx_err or gm_tx_err)
        begin
        
           if (ENABLE_GMII_LOOPBACK)
             begin
                if (TB_RXFRAMES==0)
                begin
                
                        gm_rx_err <= 1'b0 ;
                        
                end
                
                else
                begin
                
                        gm_rx_err <= gm_rxgen_rx_err ; 
                        
                end
             end            
           else
             begin        
                if (TB_RXFRAMES==0)
                begin
                
                        gm_rx_err <= gm_tx_err ;
                        
                end
                
                else
                begin
                
                        gm_rx_err <= gm_rxgen_rx_err ; 
                        
                end
                
             end           
                
        end 

   // MII Interface
   // -------------
   
        always@(m_rxgen_rx_d or m_tx_data)
        begin
        
           if (ENABLE_GMII_LOOPBACK)
             begin             
                if (TB_RXFRAMES==0)
                begin
                
                        m_rx_data <= 4'h0 ;
                        
                end
                
                else
                begin
                
                        m_rx_data <= m_rxgen_rx_d ; 
                        
                end
             end         
           else
             begin        
                if (TB_RXFRAMES==0)
                begin
                
                        m_rx_data <= m_tx_data ;
                        
                end
                
                else
                begin
                
                        m_rx_data <= m_rxgen_rx_d ; 
                        
                end
                
            end           
                
        end
        
        always@(m_rxgen_rx_en or m_tx_en)
        begin
        
           if (ENABLE_GMII_LOOPBACK)
             begin
                if (TB_RXFRAMES==0)
                begin
                
                        m_rx_en <= 1'b0 ;
                        
                end
                
                else
                begin
                
                        m_rx_en <= m_rxgen_rx_en ; 
                        
                end
             end           
           else
             begin        
                if (TB_RXFRAMES==0)
                begin
                
                        m_rx_en <= m_tx_en ;
                        
                end
                
                else
                begin
                
                        m_rx_en <= m_rxgen_rx_en ; 
                        
                end
                
             end           
                
        end
        
        always@(m_rxgen_rx_err or m_tx_err)
        begin
        
           if (ENABLE_GMII_LOOPBACK)
             begin
                if (TB_RXFRAMES==0)
                begin
                
                        m_rx_err <= 1'b0 ;
                        
                end
                
                else
                begin
                
                        m_rx_err <= m_rxgen_rx_err ; 
                        
                end
             end            
           else 
             begin
                if (TB_RXFRAMES==0)
                begin
                
                        m_rx_err <= m_tx_err ;
                        
                end
                
                else
                begin
                
                        m_rx_err <= m_rxgen_rx_err ; 
                        
                end
                
             end           
                
        end

// Simulation Information
// ----------------------

        always@(ff_rx_rdy)
        begin
        
                if (ff_rx_rdy==1'b0)
                begin
                
                        $display($time, "ns - Pause Rx FIFO Read") ; 
                        
                end
                else if (ff_rx_rdy==1'b1 && $time>1)
                begin
                
                        $display($time, "ns - Re-Start Rx FIFO Read") ; 
                        
                end 
                
        end        

        always@(mff_is_pause)                
        begin
        
                if (mff_is_pause==1'b1)
                begin
                
                        $display($time, "ns - Pause Frame Received on FIFO Interface") ; 
                        
                end       
                                                      
        end 
        
        always@(m_rx_col)                
        begin
        
                if (m_rx_col==1'b1)
                begin
                
                        $display($time, "ns - Collision, Frame Re-Transmitted after Back Off Period") ; 
                        
                end       
                                                      
        end 
        
        always@(posedge rx_clk)
        begin
        
                if (expect2==1'b0 & TB_RXFRAMES>0)
                begin
                
                        if (pause_rcv==1'b1 || frm_align_err==1'b1 || frm_type_err==1'b1 || frm_length_err==1'b1 || frm_crc_err==1'b1)
                        begin
                
                                $display($time, "ns - Warning") ;
                        
                                if (pause_rcv==1'b1)
                                begin
                        
                                        $display("\n      Unexpected RX pause_rcv") ;
                                
                                
                                end
                        
                                if (frm_align_err==1'b1)
                                begin
                        
                                        $display("\n      Unexpected RX frm_align_err") ;
                                
                                end
                        
                                if (frm_type_err==1'b1)
                                begin
                        
                                        $display("\n      Unexpected RX frm_type_err") ;
                                
                                end 
                        
                                if (frm_crc_err==1'b1)
                                begin
                        
                                        $display("\n      Unexpected RX frm_crc_err") ;
                                
                                end
                        
                        end
                        
                end
                
        end               

//  -----------------------
//  Global Simulation STOP
//  -----------------------

always @(posedge reset or posedge rx_clk)
   begin
   if (reset == 1'b 1)
      begin
      delay_cnt <= 0;   
      sim_stop <= 1'b 0;    
      end
   else
      begin
      if (txsim_done == 1'b 1 & ff_rx_dsav != 1'b 1 )

         begin
//  Generators done and FIFO empty
         delay_cnt <= delay_cnt + 1'b 1;    
         if (sim_cnt_end > 500 & state == stm_typ_end_sim)
         begin
            
            sim_stop <= 1'b 1;
            
            $display("\n- ---------------------------------------------------------------------------------------- -") ;
            
            
            if (TB_TXFRAMES > 0)
            begin
            
                $display("\n Statistics MAC Tx Path\n") ;
                $display("     - Frames sent in TX path total: ", txframe_cnt) ;
                $display("     - Tx_good_sent: ", tx_good_sent) ;
                $display("     - Tx_vlan_sent: ", tx_vlan_sent) ;
                $display("     - Tx_stack_vlan_sent: ", tx_stack_vlan_sent) ;
                $display("     - Payload_err_sent: ", tx_payload_err_sent) ;
                
            end
            
            if (TB_RXFRAMES == 0)
            begin
            
                $display("\n Statistics MAC Rx Path - Loopback Test\n") ;
                $display("     - Rx_good_rcvd: ", rx_good_rcvd) ;
                $display("     - Rx_vlan_rcvd: ", rx_vlan_rcvd) ;
                $display("     - Rx_stack_vlan_rcvd: ", rx_stack_vlan_rcvd) ;
                $display("     - Rx_fifo_overflow_rcvd: ", rx_fifo_overflow_rcvd) ;
                $display("     - Rx_payload_err_rcvd: ", rx_payload_err_rcvd) ;
                $display("     - Rx_crc_err_rcvd: ", rx_crc_err_rcvd) ;
                
            end
            
            
            if (TB_RXFRAMES == 0)
            begin
            
                if ((rx_good_rcvd           == tx_good_sent) &
                    (rx_payload_err_rcvd    == tx_payload_err_sent) &
                    (tx_good_sent           == TB_TXFRAMES) &
                    (register_test          == 0)  )
                
                begin
            
                        $display("\n -- Loopback Simulation Ended with no Error") ;
                
                end
                else
                begin
                
                        $display("\n -- Loopback Simulation Ended with Error !") ;
                        
                end
                
                $display("\n- ---------------------------------------------------------------------------------------- -") ;              
                $display("\n End of Simulation - Break \n") ;
                $stop ;
                
            end                       

            $display("\n- ---------------------------------------------------------------------------------------- -") ;  
            
            $display("\n End of Simulation - Break \n") ;
            $stop ;
            end
         end
         
      end
      
      if (promis_en != promis_en_dly)
      begin
      
        if (promis_en==1'b1)
        begin
        
                $display("\n Promiscuous Mode enabled with multicast sent: ", rx_multicast_sent) ;
                $display("      rcvd: ", rx_multicast_rcvd) ;
                $display("      denied:", rx_multicast_denied) ;
                $display("\n") ;
                
        end 
        
      end          
      
   end
   
   always@(posedge xoff_gen)
   begin
   
         if (xoff_gen==1'b1)
         begin
      
                $display($time, "ns - Xoff Pause Frame Generation Requested with Command Pin") ;
        
        end
   
   end
   
   always@(posedge xon_gen)
   begin
   
         if (xon_gen==1'b1)
         begin
      
                $display($time, "ns - Xon Pause Frame Generation Requested with Command Pin") ;
        
        end
   
   end

endmodule // module tb
