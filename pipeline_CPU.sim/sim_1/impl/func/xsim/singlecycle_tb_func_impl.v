// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed May 26 17:45:30 2021
// Host        : LAPTOP-0FSA8U4L running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/University/CPU/SingleCycle/SingleCycle.sim/sim_1/impl/func/xsim/singlecycle_tb_func_impl.v
// Design      : SingleCycle
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Control
   (Jump,
    D,
    \pc_reg[1] ,
    \q_reg[146] ,
    \q_reg[146]_0 ,
    \q_reg[145] ,
    \q_reg[140] ,
    \q_reg[140]_0 ,
    Q,
    \q_reg[141] ,
    \q_reg[147] ,
    \q_reg[147]_0 ,
    \q_reg[146]_1 ,
    \q_reg[49] ,
    \q_reg[49]_0 ,
    AR,
    \q_reg[144] ,
    E);
  output Jump;
  output [8:0]D;
  input \pc_reg[1] ;
  input \q_reg[146] ;
  input \q_reg[146]_0 ;
  input \q_reg[145] ;
  input \q_reg[140] ;
  input \q_reg[140]_0 ;
  input [2:0]Q;
  input \q_reg[141] ;
  input \q_reg[147] ;
  input \q_reg[147]_0 ;
  input \q_reg[146]_1 ;
  input \q_reg[49] ;
  input \q_reg[49]_0 ;
  input [0:0]AR;
  input [2:0]\q_reg[144] ;
  input [0:0]E;

  wire Jump;
  wire \pc_reg[1] ;
  wire \q_reg[146] ;
  wire \q_reg[146]_0 ;

  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    Jump_reg
       (.CLR(\q_reg[146]_0 ),
        .D(\pc_reg[1] ),
        .G(\q_reg[146] ),
        .GE(1'b1),
        .Q(Jump));
endmodule

module D_Trigger
   (Q,
    \q_reg[60]_0 ,
    \q_reg[60]_1 ,
    E,
    \q_reg[61]_0 ,
    \q_reg[61]_1 ,
    \q_reg[60]_2 ,
    \q_reg[62]_0 ,
    \q_reg[62]_1 ,
    \q_reg[59]_0 ,
    \q_reg[61]_2 ,
    \q_reg[49]_0 ,
    \q_reg[49]_1 ,
    \q_reg[49]_2 ,
    AR,
    \q_reg[58]_0 ,
    D,
    clk_IBUF_BUFG,
    \q_reg[32]_0 ,
    lopt,
    lopt_1,
    lopt_2,
    lopt_3,
    lopt_4,
    lopt_5);
  output [31:0]Q;
  output \q_reg[60]_0 ;
  output \q_reg[60]_1 ;
  output [0:0]E;
  output \q_reg[61]_0 ;
  output \q_reg[61]_1 ;
  output \q_reg[60]_2 ;
  output \q_reg[62]_0 ;
  output \q_reg[62]_1 ;
  output \q_reg[59]_0 ;
  output [2:0]\q_reg[61]_2 ;
  output \q_reg[49]_0 ;
  output \q_reg[49]_1 ;
  output \q_reg[49]_2 ;
  output [0:0]AR;
  output \q_reg[58]_0 ;
  input [31:0]D;
  input clk_IBUF_BUFG;
  input [0:0]\q_reg[32]_0 ;
  output lopt;
  output lopt_1;
  output lopt_2;
  output lopt_3;
  output lopt_4;
  output lopt_5;

  wire [31:0]D;
  wire [31:0]Q;
  wire clk_IBUF_BUFG;
  wire [0:0]\q_reg[32]_0 ;
  wire \q_reg[58]_0 ;
  wire \q_reg[58]_lopt_replica_1 ;
  wire \q_reg[59]_lopt_replica_1 ;
  wire \q_reg[60]_0 ;
  wire \q_reg[60]_lopt_replica_1 ;
  wire \q_reg[61]_0 ;
  wire \q_reg[61]_lopt_replica_1 ;
  wire \q_reg[62]_lopt_replica_1 ;
  wire \q_reg[63]_lopt_replica_1 ;

  assign lopt = \q_reg[58]_lopt_replica_1 ;
  assign lopt_1 = \q_reg[59]_lopt_replica_1 ;
  assign lopt_2 = \q_reg[60]_lopt_replica_1 ;
  assign lopt_3 = \q_reg[61]_lopt_replica_1 ;
  assign lopt_4 = \q_reg[62]_lopt_replica_1 ;
  assign lopt_5 = \q_reg[63]_lopt_replica_1 ;
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h01)) 
    Jump_reg_i_1
       (.I0(Q[29]),
        .I1(Q[28]),
        .I2(Q[31]),
        .O(\q_reg[61]_0 ));
  LUT6 #(
    .INIT(64'h0000000044300006)) 
    Jump_reg_i_2
       (.I0(Q[28]),
        .I1(Q[27]),
        .I2(Q[29]),
        .I3(Q[31]),
        .I4(Q[26]),
        .I5(Q[30]),
        .O(\q_reg[60]_0 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    Jump_reg_i_4
       (.I0(Q[26]),
        .I1(Q[28]),
        .I2(Q[29]),
        .I3(Q[27]),
        .I4(Q[30]),
        .I5(Q[31]),
        .O(\q_reg[58]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[9]),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[26]),
        .Q(Q[26]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[58]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[26]),
        .Q(\q_reg[58]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[27]),
        .Q(Q[27]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[59]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[27]),
        .Q(\q_reg[59]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[28]),
        .Q(Q[28]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[60]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[28]),
        .Q(\q_reg[60]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[29]),
        .Q(Q[29]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[61]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[29]),
        .Q(\q_reg[61]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[30]),
        .Q(Q[30]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[62]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[30]),
        .Q(\q_reg[62]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[31]),
        .Q(Q[31]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[63]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\q_reg[32]_0 ),
        .D(D[31]),
        .Q(\q_reg[63]_lopt_replica_1 ));
endmodule

module DataRoad
   (Q,
    \q_reg[60] ,
    \q_reg[60]_0 ,
    E,
    \q_reg[61] ,
    \q_reg[61]_0 ,
    \q_reg[60]_1 ,
    \q_reg[62] ,
    \q_reg[62]_0 ,
    \q_reg[59] ,
    \q_reg[61]_1 ,
    \q_reg[49] ,
    \q_reg[49]_0 ,
    \q_reg[49]_1 ,
    AR,
    \q_reg[58] ,
    clk_IBUF_BUFG,
    \pc_reg[7] ,
    \pc_reg[7]_0 ,
    D,
    Jump,
    lopt,
    lopt_1,
    lopt_2,
    lopt_3,
    lopt_4,
    lopt_5);
  output [31:0]Q;
  output \q_reg[60] ;
  output \q_reg[60]_0 ;
  output [0:0]E;
  output \q_reg[61] ;
  output \q_reg[61]_0 ;
  output \q_reg[60]_1 ;
  output \q_reg[62] ;
  output \q_reg[62]_0 ;
  output \q_reg[59] ;
  output [2:0]\q_reg[61]_1 ;
  output \q_reg[49] ;
  output \q_reg[49]_0 ;
  output \q_reg[49]_1 ;
  output [0:0]AR;
  output \q_reg[58] ;
  input clk_IBUF_BUFG;
  input [0:0]\pc_reg[7] ;
  input [0:0]\pc_reg[7]_0 ;
  input [8:0]D;
  input Jump;
  output lopt;
  output lopt_1;
  output lopt_2;
  output lopt_3;
  output lopt_4;
  output lopt_5;

  wire [31:0]Inst;
  wire Jump;
  wire [31:0]Q;
  wire clk_IBUF_BUFG;
  wire lopt;
  wire lopt_1;
  wire lopt_2;
  wire lopt_3;
  wire lopt_4;
  wire lopt_5;
  wire [0:0]\pc_reg[7] ;
  wire [0:0]\pc_reg[7]_0 ;
  wire \q_reg[58] ;
  wire \q_reg[60] ;
  wire \q_reg[61] ;
  wire \NLW_IF_ID_q_reg[49]_0_UNCONNECTED ;
  wire \NLW_IF_ID_q_reg[49]_1_UNCONNECTED ;
  wire \NLW_IF_ID_q_reg[49]_2_UNCONNECTED ;
  wire \NLW_IF_ID_q_reg[59]_0_UNCONNECTED ;
  wire \NLW_IF_ID_q_reg[60]_1_UNCONNECTED ;
  wire \NLW_IF_ID_q_reg[60]_2_UNCONNECTED ;
  wire \NLW_IF_ID_q_reg[61]_1_UNCONNECTED ;
  wire \NLW_IF_ID_q_reg[62]_0_UNCONNECTED ;
  wire \NLW_IF_ID_q_reg[62]_1_UNCONNECTED ;
  wire [0:0]NLW_IF_ID_AR_UNCONNECTED;
  wire [0:0]NLW_IF_ID_E_UNCONNECTED;
  wire [2:0]\NLW_IF_ID_q_reg[61]_2_UNCONNECTED ;

  D_Trigger IF_ID
       (.AR(NLW_IF_ID_AR_UNCONNECTED[0]),
        .D(Inst),
        .E(NLW_IF_ID_E_UNCONNECTED[0]),
        .Q(Q),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .lopt(lopt),
        .lopt_1(lopt_1),
        .lopt_2(lopt_2),
        .lopt_3(lopt_3),
        .lopt_4(lopt_4),
        .lopt_5(lopt_5),
        .\q_reg[32]_0 (\pc_reg[7] ),
        .\q_reg[49]_0 (\NLW_IF_ID_q_reg[49]_0_UNCONNECTED ),
        .\q_reg[49]_1 (\NLW_IF_ID_q_reg[49]_1_UNCONNECTED ),
        .\q_reg[49]_2 (\NLW_IF_ID_q_reg[49]_2_UNCONNECTED ),
        .\q_reg[58]_0 (\q_reg[58] ),
        .\q_reg[59]_0 (\NLW_IF_ID_q_reg[59]_0_UNCONNECTED ),
        .\q_reg[60]_0 (\q_reg[60] ),
        .\q_reg[60]_1 (\NLW_IF_ID_q_reg[60]_1_UNCONNECTED ),
        .\q_reg[60]_2 (\NLW_IF_ID_q_reg[60]_2_UNCONNECTED ),
        .\q_reg[61]_0 (\q_reg[61] ),
        .\q_reg[61]_1 (\NLW_IF_ID_q_reg[61]_1_UNCONNECTED ),
        .\q_reg[61]_2 (\NLW_IF_ID_q_reg[61]_2_UNCONNECTED [2:0]),
        .\q_reg[62]_0 (\NLW_IF_ID_q_reg[62]_0_UNCONNECTED ),
        .\q_reg[62]_1 (\NLW_IF_ID_q_reg[62]_1_UNCONNECTED ));
  PC pc
       (.D(Inst),
        .Jump(Jump),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\pc_reg[7]_0 (\pc_reg[7] ),
        .\pc_reg[7]_1 (\pc_reg[7]_0 ));
endmodule

(* CHECK_LICENSE_TYPE = "Inst_mem_1,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
module Inst_mem_1
   (a,
    d,
    clk,
    we,
    spo);
  input [7:0]a;
  input [7:0]d;
  input clk;
  input we;
  output [7:0]spo;

  wire [7:0]a;
  wire clk;
  wire [7:0]d;
  wire [7:0]spo;
  wire we;
  wire NLW_U0_i_ce_UNCONNECTED;
  wire NLW_U0_qdpo_ce_UNCONNECTED;
  wire NLW_U0_qdpo_clk_UNCONNECTED;
  wire NLW_U0_qdpo_rst_UNCONNECTED;
  wire NLW_U0_qdpo_srst_UNCONNECTED;
  wire NLW_U0_qspo_ce_UNCONNECTED;
  wire NLW_U0_qspo_rst_UNCONNECTED;
  wire NLW_U0_qspo_srst_UNCONNECTED;
  wire [7:0]NLW_U0_dpo_UNCONNECTED;
  wire [7:0]NLW_U0_dpra_UNCONNECTED;
  wire [7:0]NLW_U0_qdpo_UNCONNECTED;
  wire [7:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_CLK = "1" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "8" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "256" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_i_ce = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "Inst_mem_1.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_pipeline_stages = "0" *) 
  (* c_qualify_we = "0" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "8" *) 
  (* is_du_within_envelope = "true" *) 
  Inst_mem_1_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(NLW_U0_dpo_UNCONNECTED[7:0]),
        .dpra(NLW_U0_dpra_UNCONNECTED[7:0]),
        .i_ce(NLW_U0_i_ce_UNCONNECTED),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[7:0]),
        .qdpo_ce(NLW_U0_qdpo_ce_UNCONNECTED),
        .qdpo_clk(NLW_U0_qdpo_clk_UNCONNECTED),
        .qdpo_rst(NLW_U0_qdpo_rst_UNCONNECTED),
        .qdpo_srst(NLW_U0_qdpo_srst_UNCONNECTED),
        .qspo(NLW_U0_qspo_UNCONNECTED[7:0]),
        .qspo_ce(NLW_U0_qspo_ce_UNCONNECTED),
        .qspo_rst(NLW_U0_qspo_rst_UNCONNECTED),
        .qspo_srst(NLW_U0_qspo_srst_UNCONNECTED),
        .spo(spo),
        .we(we));
endmodule

(* CHECK_LICENSE_TYPE = "Inst_mem_1,dist_mem_gen_v8_0_13,{}" *) (* ORIG_REF_NAME = "Inst_mem_1" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
module Inst_mem_1_HD19
   (clk,
    we,
    a,
    d,
    spo);
  input clk;
  input we;
  input [7:0]a;
  input [7:0]d;
  output [7:0]spo;

  wire [7:0]a;
  wire clk;
  wire [7:0]d;
  wire [7:0]spo;
  wire we;
  wire NLW_U0_i_ce_UNCONNECTED;
  wire NLW_U0_qdpo_ce_UNCONNECTED;
  wire NLW_U0_qdpo_clk_UNCONNECTED;
  wire NLW_U0_qdpo_rst_UNCONNECTED;
  wire NLW_U0_qdpo_srst_UNCONNECTED;
  wire NLW_U0_qspo_ce_UNCONNECTED;
  wire NLW_U0_qspo_rst_UNCONNECTED;
  wire NLW_U0_qspo_srst_UNCONNECTED;
  wire [7:0]NLW_U0_dpo_UNCONNECTED;
  wire [7:0]NLW_U0_dpra_UNCONNECTED;
  wire [7:0]NLW_U0_qdpo_UNCONNECTED;
  wire [7:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_CLK = "1" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "8" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "256" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_i_ce = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "Inst_mem_1.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_pipeline_stages = "0" *) 
  (* c_qualify_we = "0" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "8" *) 
  (* is_du_within_envelope = "true" *) 
  Inst_mem_1_dist_mem_gen_v8_0_13_HD20 U0
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(NLW_U0_dpo_UNCONNECTED[7:0]),
        .dpra(NLW_U0_dpra_UNCONNECTED[7:0]),
        .i_ce(NLW_U0_i_ce_UNCONNECTED),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[7:0]),
        .qdpo_ce(NLW_U0_qdpo_ce_UNCONNECTED),
        .qdpo_clk(NLW_U0_qdpo_clk_UNCONNECTED),
        .qdpo_rst(NLW_U0_qdpo_rst_UNCONNECTED),
        .qdpo_srst(NLW_U0_qdpo_srst_UNCONNECTED),
        .qspo(NLW_U0_qspo_UNCONNECTED[7:0]),
        .qspo_ce(NLW_U0_qspo_ce_UNCONNECTED),
        .qspo_rst(NLW_U0_qspo_rst_UNCONNECTED),
        .qspo_srst(NLW_U0_qspo_srst_UNCONNECTED),
        .spo(spo),
        .we(we));
endmodule

(* CHECK_LICENSE_TYPE = "Inst_mem_1,dist_mem_gen_v8_0_13,{}" *) (* ORIG_REF_NAME = "Inst_mem_1" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
module Inst_mem_1_HD23
   (clk,
    we,
    a,
    d,
    spo);
  input clk;
  input we;
  input [7:0]a;
  input [7:0]d;
  output [7:0]spo;

  wire [7:0]a;
  wire clk;
  wire [7:0]d;
  wire [7:0]spo;
  wire we;
  wire NLW_U0_i_ce_UNCONNECTED;
  wire NLW_U0_qdpo_ce_UNCONNECTED;
  wire NLW_U0_qdpo_clk_UNCONNECTED;
  wire NLW_U0_qdpo_rst_UNCONNECTED;
  wire NLW_U0_qdpo_srst_UNCONNECTED;
  wire NLW_U0_qspo_ce_UNCONNECTED;
  wire NLW_U0_qspo_rst_UNCONNECTED;
  wire NLW_U0_qspo_srst_UNCONNECTED;
  wire [7:0]NLW_U0_dpo_UNCONNECTED;
  wire [7:0]NLW_U0_dpra_UNCONNECTED;
  wire [7:0]NLW_U0_qdpo_UNCONNECTED;
  wire [7:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_CLK = "1" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "8" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "256" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_i_ce = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "Inst_mem_1.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_pipeline_stages = "0" *) 
  (* c_qualify_we = "0" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "8" *) 
  (* is_du_within_envelope = "true" *) 
  Inst_mem_1_dist_mem_gen_v8_0_13_HD24 U0
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(NLW_U0_dpo_UNCONNECTED[7:0]),
        .dpra(NLW_U0_dpra_UNCONNECTED[7:0]),
        .i_ce(NLW_U0_i_ce_UNCONNECTED),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[7:0]),
        .qdpo_ce(NLW_U0_qdpo_ce_UNCONNECTED),
        .qdpo_clk(NLW_U0_qdpo_clk_UNCONNECTED),
        .qdpo_rst(NLW_U0_qdpo_rst_UNCONNECTED),
        .qdpo_srst(NLW_U0_qdpo_srst_UNCONNECTED),
        .qspo(NLW_U0_qspo_UNCONNECTED[7:0]),
        .qspo_ce(NLW_U0_qspo_ce_UNCONNECTED),
        .qspo_rst(NLW_U0_qspo_rst_UNCONNECTED),
        .qspo_srst(NLW_U0_qspo_srst_UNCONNECTED),
        .spo(spo),
        .we(we));
endmodule

(* CHECK_LICENSE_TYPE = "Inst_mem_1,dist_mem_gen_v8_0_13,{}" *) (* ORIG_REF_NAME = "Inst_mem_1" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
module Inst_mem_1_HD27
   (clk,
    we,
    a,
    d,
    spo);
  input clk;
  input we;
  input [7:0]a;
  input [7:0]d;
  output [7:0]spo;

  wire [7:0]a;
  wire clk;
  wire [7:0]d;
  wire [7:0]spo;
  wire we;
  wire NLW_U0_i_ce_UNCONNECTED;
  wire NLW_U0_qdpo_ce_UNCONNECTED;
  wire NLW_U0_qdpo_clk_UNCONNECTED;
  wire NLW_U0_qdpo_rst_UNCONNECTED;
  wire NLW_U0_qdpo_srst_UNCONNECTED;
  wire NLW_U0_qspo_ce_UNCONNECTED;
  wire NLW_U0_qspo_rst_UNCONNECTED;
  wire NLW_U0_qspo_srst_UNCONNECTED;
  wire [7:0]NLW_U0_dpo_UNCONNECTED;
  wire [7:0]NLW_U0_dpra_UNCONNECTED;
  wire [7:0]NLW_U0_qdpo_UNCONNECTED;
  wire [7:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_CLK = "1" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "8" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "256" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_i_ce = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "Inst_mem_1.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_pipeline_stages = "0" *) 
  (* c_qualify_we = "0" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "8" *) 
  (* is_du_within_envelope = "true" *) 
  Inst_mem_1_dist_mem_gen_v8_0_13_HD28 U0
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(NLW_U0_dpo_UNCONNECTED[7:0]),
        .dpra(NLW_U0_dpra_UNCONNECTED[7:0]),
        .i_ce(NLW_U0_i_ce_UNCONNECTED),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[7:0]),
        .qdpo_ce(NLW_U0_qdpo_ce_UNCONNECTED),
        .qdpo_clk(NLW_U0_qdpo_clk_UNCONNECTED),
        .qdpo_rst(NLW_U0_qdpo_rst_UNCONNECTED),
        .qdpo_srst(NLW_U0_qdpo_srst_UNCONNECTED),
        .qspo(NLW_U0_qspo_UNCONNECTED[7:0]),
        .qspo_ce(NLW_U0_qspo_ce_UNCONNECTED),
        .qspo_rst(NLW_U0_qspo_rst_UNCONNECTED),
        .qspo_srst(NLW_U0_qspo_srst_UNCONNECTED),
        .spo(spo),
        .we(we));
endmodule

module PC
   (D,
    clk_IBUF_BUFG,
    \pc_reg[7]_0 ,
    \pc_reg[7]_1 ,
    Jump);
  output [31:0]D;
  input clk_IBUF_BUFG;
  input [0:0]\pc_reg[7]_0 ;
  input [0:0]\pc_reg[7]_1 ;
  input Jump;

  wire [31:0]D;
  wire Inst_mem_2_i_8_n_0;
  wire Jump;
  wire clk_IBUF_BUFG;
  wire [7:1]new_pc;
  wire [7:1]next_pc;
  wire next_pc_carry_i_1_n_0;
  wire next_pc_carry_n_0;
  wire [7:1]pc_3;
  wire [0:0]\pc_reg[7]_0 ;
  wire [0:0]\pc_reg[7]_1 ;
  wire \pc_reg_n_0_[1] ;
  wire \pc_reg_n_0_[2] ;
  wire \pc_reg_n_0_[3] ;
  wire \pc_reg_n_0_[4] ;
  wire \pc_reg_n_0_[5] ;
  wire \pc_reg_n_0_[6] ;
  wire \pc_reg_n_0_[7] ;
  wire [2:0]NLW_next_pc_carry_CO_UNCONNECTED;
  wire [3:0]NLW_next_pc_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_next_pc_carry__0_O_UNCONNECTED;

  (* IMPORTED_FROM = "d:/University/CPU/SingleCycle/SingleCycle.gen/sources_1/ip/Inst_mem_1/Inst_mem_1.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
  Inst_mem_1 Inst_mem_0
       (.a({\pc_reg_n_0_[7] ,\pc_reg_n_0_[6] ,\pc_reg_n_0_[5] ,\pc_reg_n_0_[4] ,\pc_reg_n_0_[3] ,\pc_reg_n_0_[2] ,\pc_reg_n_0_[1] ,1'b0}),
        .clk(clk_IBUF_BUFG),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .spo(D[7:0]),
        .we(1'b0));
  (* IMPORTED_FROM = "d:/University/CPU/SingleCycle/SingleCycle.gen/sources_1/ip/Inst_mem_1/Inst_mem_1.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
  Inst_mem_1_HD19 Inst_mem_1
       (.a({\pc_reg_n_0_[7] ,\pc_reg_n_0_[6] ,\pc_reg_n_0_[5] ,\pc_reg_n_0_[4] ,\pc_reg_n_0_[3] ,\pc_reg_n_0_[2] ,\pc_reg_n_0_[1] ,1'b1}),
        .clk(clk_IBUF_BUFG),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .spo(D[15:8]),
        .we(1'b0));
  (* IMPORTED_FROM = "d:/University/CPU/SingleCycle/SingleCycle.gen/sources_1/ip/Inst_mem_1/Inst_mem_1.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
  Inst_mem_1_HD23 Inst_mem_2
       (.a({pc_3,1'b0}),
        .clk(clk_IBUF_BUFG),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .spo(D[23:16]),
        .we(1'b0));
  LUT3 #(
    .INIT(8'h78)) 
    Inst_mem_2_i_1
       (.I0(Inst_mem_2_i_8_n_0),
        .I1(\pc_reg_n_0_[6] ),
        .I2(\pc_reg_n_0_[7] ),
        .O(pc_3[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    Inst_mem_2_i_2
       (.I0(\pc_reg_n_0_[4] ),
        .I1(\pc_reg_n_0_[2] ),
        .I2(\pc_reg_n_0_[1] ),
        .I3(\pc_reg_n_0_[3] ),
        .I4(\pc_reg_n_0_[5] ),
        .I5(\pc_reg_n_0_[6] ),
        .O(pc_3[6]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    Inst_mem_2_i_3
       (.I0(\pc_reg_n_0_[3] ),
        .I1(\pc_reg_n_0_[1] ),
        .I2(\pc_reg_n_0_[2] ),
        .I3(\pc_reg_n_0_[4] ),
        .I4(\pc_reg_n_0_[5] ),
        .O(pc_3[5]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    Inst_mem_2_i_4
       (.I0(\pc_reg_n_0_[2] ),
        .I1(\pc_reg_n_0_[1] ),
        .I2(\pc_reg_n_0_[3] ),
        .I3(\pc_reg_n_0_[4] ),
        .O(pc_3[4]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h78)) 
    Inst_mem_2_i_5
       (.I0(\pc_reg_n_0_[1] ),
        .I1(\pc_reg_n_0_[2] ),
        .I2(\pc_reg_n_0_[3] ),
        .O(pc_3[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    Inst_mem_2_i_6
       (.I0(\pc_reg_n_0_[1] ),
        .I1(\pc_reg_n_0_[2] ),
        .O(pc_3[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT1 #(
    .INIT(2'h1)) 
    Inst_mem_2_i_7
       (.I0(\pc_reg_n_0_[1] ),
        .O(pc_3[1]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    Inst_mem_2_i_8
       (.I0(\pc_reg_n_0_[5] ),
        .I1(\pc_reg_n_0_[3] ),
        .I2(\pc_reg_n_0_[1] ),
        .I3(\pc_reg_n_0_[2] ),
        .I4(\pc_reg_n_0_[4] ),
        .O(Inst_mem_2_i_8_n_0));
  (* IMPORTED_FROM = "d:/University/CPU/SingleCycle/SingleCycle.gen/sources_1/ip/Inst_mem_1/Inst_mem_1.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
  Inst_mem_1_HD27 Inst_mem_3
       (.a({pc_3,1'b1}),
        .clk(clk_IBUF_BUFG),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .spo(D[31:24]),
        .we(1'b0));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 next_pc_carry
       (.CI(1'b0),
        .CO({next_pc_carry_n_0,NLW_next_pc_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\pc_reg_n_0_[2] ,1'b0}),
        .O(next_pc[4:1]),
        .S({\pc_reg_n_0_[4] ,\pc_reg_n_0_[3] ,next_pc_carry_i_1_n_0,\pc_reg_n_0_[1] }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 next_pc_carry__0
       (.CI(next_pc_carry_n_0),
        .CO(NLW_next_pc_carry__0_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_next_pc_carry__0_O_UNCONNECTED[3],next_pc[7:5]}),
        .S({1'b0,\pc_reg_n_0_[7] ,\pc_reg_n_0_[6] ,\pc_reg_n_0_[5] }));
  LUT1 #(
    .INIT(2'h1)) 
    next_pc_carry_i_1
       (.I0(\pc_reg_n_0_[2] ),
        .O(next_pc_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \pc[1]_i_1 
       (.I0(next_pc[1]),
        .I1(Jump),
        .O(new_pc[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pc[2]_i_1 
       (.I0(D[0]),
        .I1(Jump),
        .I2(next_pc[2]),
        .O(new_pc[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pc[3]_i_1 
       (.I0(D[1]),
        .I1(Jump),
        .I2(next_pc[3]),
        .O(new_pc[3]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pc[4]_i_1 
       (.I0(D[2]),
        .I1(Jump),
        .I2(next_pc[4]),
        .O(new_pc[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pc[5]_i_1 
       (.I0(D[3]),
        .I1(Jump),
        .I2(next_pc[5]),
        .O(new_pc[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pc[6]_i_1 
       (.I0(D[4]),
        .I1(Jump),
        .I2(next_pc[6]),
        .O(new_pc[6]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pc[7]_i_1 
       (.I0(D[5]),
        .I1(Jump),
        .I2(next_pc[7]),
        .O(new_pc[7]));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\pc_reg[7]_1 ),
        .D(new_pc[1]),
        .Q(\pc_reg_n_0_[1] ),
        .R(\pc_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\pc_reg[7]_1 ),
        .D(new_pc[2]),
        .Q(\pc_reg_n_0_[2] ),
        .R(\pc_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\pc_reg[7]_1 ),
        .D(new_pc[3]),
        .Q(\pc_reg_n_0_[3] ),
        .R(\pc_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\pc_reg[7]_1 ),
        .D(new_pc[4]),
        .Q(\pc_reg_n_0_[4] ),
        .R(\pc_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\pc_reg[7]_1 ),
        .D(new_pc[5]),
        .Q(\pc_reg_n_0_[5] ),
        .R(\pc_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\pc_reg[7]_1 ),
        .D(new_pc[6]),
        .Q(\pc_reg_n_0_[6] ),
        .R(\pc_reg[7]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\pc_reg[7]_1 ),
        .D(new_pc[7]),
        .Q(\pc_reg_n_0_[7] ),
        .R(\pc_reg[7]_0 ));
endmodule

(* ECO_CHECKSUM = "8c8fd908" *) 
(* NotValidForBitStream *)
module SingleCycle
   (clk,
    RUN,
    rst,
    Inst_out);
  input clk;
  input RUN;
  input rst;
  output [31:0]Inst_out;

  wire DataRoad_n_32;
  wire DataRoad_n_35;
  wire DataRoad_n_48;
  wire [31:0]Inst_out;
  wire [31:0]Inst_out_OBUF;
  wire Jump;
  wire RUN;
  wire RUN_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire lopt;
  wire lopt_1;
  wire lopt_2;
  wire lopt_3;
  wire lopt_4;
  wire lopt_5;
  wire rst;
  wire rst_IBUF;
  wire \NLW_Control_q_reg[140]_UNCONNECTED ;
  wire \NLW_Control_q_reg[140]_0_UNCONNECTED ;
  wire \NLW_Control_q_reg[141]_UNCONNECTED ;
  wire \NLW_Control_q_reg[145]_UNCONNECTED ;
  wire \NLW_Control_q_reg[146]_1_UNCONNECTED ;
  wire \NLW_Control_q_reg[147]_UNCONNECTED ;
  wire \NLW_Control_q_reg[147]_0_UNCONNECTED ;
  wire \NLW_Control_q_reg[49]_UNCONNECTED ;
  wire \NLW_Control_q_reg[49]_0_UNCONNECTED ;
  wire [0:0]NLW_Control_AR_UNCONNECTED;
  wire [8:0]NLW_Control_D_UNCONNECTED;
  wire [0:0]NLW_Control_E_UNCONNECTED;
  wire [2:0]NLW_Control_Q_UNCONNECTED;
  wire [2:0]\NLW_Control_q_reg[144]_UNCONNECTED ;
  wire \NLW_DataRoad_q_reg[49]_UNCONNECTED ;
  wire \NLW_DataRoad_q_reg[49]_0_UNCONNECTED ;
  wire \NLW_DataRoad_q_reg[49]_1_UNCONNECTED ;
  wire \NLW_DataRoad_q_reg[59]_UNCONNECTED ;
  wire \NLW_DataRoad_q_reg[60]_0_UNCONNECTED ;
  wire \NLW_DataRoad_q_reg[60]_1_UNCONNECTED ;
  wire \NLW_DataRoad_q_reg[61]_0_UNCONNECTED ;
  wire \NLW_DataRoad_q_reg[62]_UNCONNECTED ;
  wire \NLW_DataRoad_q_reg[62]_0_UNCONNECTED ;
  wire [0:0]NLW_DataRoad_AR_UNCONNECTED;
  wire [8:0]NLW_DataRoad_D_UNCONNECTED;
  wire [0:0]NLW_DataRoad_E_UNCONNECTED;
  wire [31:26]NLW_DataRoad_Q_UNCONNECTED;
  wire [2:0]\NLW_DataRoad_q_reg[61]_1_UNCONNECTED ;

  Control Control
       (.AR(NLW_Control_AR_UNCONNECTED[0]),
        .D(NLW_Control_D_UNCONNECTED[8:0]),
        .E(NLW_Control_E_UNCONNECTED[0]),
        .Jump(Jump),
        .Q(NLW_Control_Q_UNCONNECTED[2:0]),
        .\pc_reg[1] (DataRoad_n_35),
        .\q_reg[140] (\NLW_Control_q_reg[140]_UNCONNECTED ),
        .\q_reg[140]_0 (\NLW_Control_q_reg[140]_0_UNCONNECTED ),
        .\q_reg[141] (\NLW_Control_q_reg[141]_UNCONNECTED ),
        .\q_reg[144] (\NLW_Control_q_reg[144]_UNCONNECTED [2:0]),
        .\q_reg[145] (\NLW_Control_q_reg[145]_UNCONNECTED ),
        .\q_reg[146] (DataRoad_n_32),
        .\q_reg[146]_0 (DataRoad_n_48),
        .\q_reg[146]_1 (\NLW_Control_q_reg[146]_1_UNCONNECTED ),
        .\q_reg[147] (\NLW_Control_q_reg[147]_UNCONNECTED ),
        .\q_reg[147]_0 (\NLW_Control_q_reg[147]_0_UNCONNECTED ),
        .\q_reg[49] (\NLW_Control_q_reg[49]_UNCONNECTED ),
        .\q_reg[49]_0 (\NLW_Control_q_reg[49]_0_UNCONNECTED ));
  DataRoad DataRoad
       (.AR(NLW_DataRoad_AR_UNCONNECTED[0]),
        .D(NLW_DataRoad_D_UNCONNECTED[8:0]),
        .E(NLW_DataRoad_E_UNCONNECTED[0]),
        .Jump(Jump),
        .Q({NLW_DataRoad_Q_UNCONNECTED[31:26],Inst_out_OBUF[25:0]}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .lopt(lopt),
        .lopt_1(lopt_1),
        .lopt_2(lopt_2),
        .lopt_3(lopt_3),
        .lopt_4(lopt_4),
        .lopt_5(lopt_5),
        .\pc_reg[7] (rst_IBUF),
        .\pc_reg[7]_0 (RUN_IBUF),
        .\q_reg[49] (\NLW_DataRoad_q_reg[49]_UNCONNECTED ),
        .\q_reg[49]_0 (\NLW_DataRoad_q_reg[49]_0_UNCONNECTED ),
        .\q_reg[49]_1 (\NLW_DataRoad_q_reg[49]_1_UNCONNECTED ),
        .\q_reg[58] (DataRoad_n_48),
        .\q_reg[59] (\NLW_DataRoad_q_reg[59]_UNCONNECTED ),
        .\q_reg[60] (DataRoad_n_32),
        .\q_reg[60]_0 (\NLW_DataRoad_q_reg[60]_0_UNCONNECTED ),
        .\q_reg[60]_1 (\NLW_DataRoad_q_reg[60]_1_UNCONNECTED ),
        .\q_reg[61] (DataRoad_n_35),
        .\q_reg[61]_0 (\NLW_DataRoad_q_reg[61]_0_UNCONNECTED ),
        .\q_reg[61]_1 (\NLW_DataRoad_q_reg[61]_1_UNCONNECTED [2:0]),
        .\q_reg[62] (\NLW_DataRoad_q_reg[62]_UNCONNECTED ),
        .\q_reg[62]_0 (\NLW_DataRoad_q_reg[62]_0_UNCONNECTED ));
  OBUF \Inst_out_OBUF[0]_inst 
       (.I(Inst_out_OBUF[0]),
        .O(Inst_out[0]));
  OBUF \Inst_out_OBUF[10]_inst 
       (.I(Inst_out_OBUF[10]),
        .O(Inst_out[10]));
  OBUF \Inst_out_OBUF[11]_inst 
       (.I(Inst_out_OBUF[11]),
        .O(Inst_out[11]));
  OBUF \Inst_out_OBUF[12]_inst 
       (.I(Inst_out_OBUF[12]),
        .O(Inst_out[12]));
  OBUF \Inst_out_OBUF[13]_inst 
       (.I(Inst_out_OBUF[13]),
        .O(Inst_out[13]));
  OBUF \Inst_out_OBUF[14]_inst 
       (.I(Inst_out_OBUF[14]),
        .O(Inst_out[14]));
  OBUF \Inst_out_OBUF[15]_inst 
       (.I(Inst_out_OBUF[15]),
        .O(Inst_out[15]));
  OBUF \Inst_out_OBUF[16]_inst 
       (.I(Inst_out_OBUF[16]),
        .O(Inst_out[16]));
  OBUF \Inst_out_OBUF[17]_inst 
       (.I(Inst_out_OBUF[17]),
        .O(Inst_out[17]));
  OBUF \Inst_out_OBUF[18]_inst 
       (.I(Inst_out_OBUF[18]),
        .O(Inst_out[18]));
  OBUF \Inst_out_OBUF[19]_inst 
       (.I(Inst_out_OBUF[19]),
        .O(Inst_out[19]));
  OBUF \Inst_out_OBUF[1]_inst 
       (.I(Inst_out_OBUF[1]),
        .O(Inst_out[1]));
  OBUF \Inst_out_OBUF[20]_inst 
       (.I(Inst_out_OBUF[20]),
        .O(Inst_out[20]));
  OBUF \Inst_out_OBUF[21]_inst 
       (.I(Inst_out_OBUF[21]),
        .O(Inst_out[21]));
  OBUF \Inst_out_OBUF[22]_inst 
       (.I(Inst_out_OBUF[22]),
        .O(Inst_out[22]));
  OBUF \Inst_out_OBUF[23]_inst 
       (.I(Inst_out_OBUF[23]),
        .O(Inst_out[23]));
  OBUF \Inst_out_OBUF[24]_inst 
       (.I(Inst_out_OBUF[24]),
        .O(Inst_out[24]));
  OBUF \Inst_out_OBUF[25]_inst 
       (.I(Inst_out_OBUF[25]),
        .O(Inst_out[25]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Inst_out_OBUF[26]_inst 
       (.I(lopt),
        .O(Inst_out[26]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Inst_out_OBUF[27]_inst 
       (.I(lopt_1),
        .O(Inst_out[27]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Inst_out_OBUF[28]_inst 
       (.I(lopt_2),
        .O(Inst_out[28]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Inst_out_OBUF[29]_inst 
       (.I(lopt_3),
        .O(Inst_out[29]));
  OBUF \Inst_out_OBUF[2]_inst 
       (.I(Inst_out_OBUF[2]),
        .O(Inst_out[2]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Inst_out_OBUF[30]_inst 
       (.I(lopt_4),
        .O(Inst_out[30]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Inst_out_OBUF[31]_inst 
       (.I(lopt_5),
        .O(Inst_out[31]));
  OBUF \Inst_out_OBUF[3]_inst 
       (.I(Inst_out_OBUF[3]),
        .O(Inst_out[3]));
  OBUF \Inst_out_OBUF[4]_inst 
       (.I(Inst_out_OBUF[4]),
        .O(Inst_out[4]));
  OBUF \Inst_out_OBUF[5]_inst 
       (.I(Inst_out_OBUF[5]),
        .O(Inst_out[5]));
  OBUF \Inst_out_OBUF[6]_inst 
       (.I(Inst_out_OBUF[6]),
        .O(Inst_out[6]));
  OBUF \Inst_out_OBUF[7]_inst 
       (.I(Inst_out_OBUF[7]),
        .O(Inst_out[7]));
  OBUF \Inst_out_OBUF[8]_inst 
       (.I(Inst_out_OBUF[8]),
        .O(Inst_out[8]));
  OBUF \Inst_out_OBUF[9]_inst 
       (.I(Inst_out_OBUF[9]),
        .O(Inst_out[9]));
  IBUF RUN_IBUF_inst
       (.I(RUN),
        .O(RUN_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
AWk2+F/LLIwJ/3H70MT+p73z+MaZAUnylB9xu/zfH66xX8dAaOizqpslZkE4MXrWhxdHpghP7sIj
kwvWqhJ3gA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
f3tnX2YCmmij/BT714m5fPTuG3pr/Sp1bWD1FpCFiwTkcUFmqMNcr7abCn+qa2HUp1VAs9a1kY1i
yU68W3C4ARAx1rnlow3CtMBZ+4vG1QDA+Ciu5T+MSJsiWTAoMU3jJunULwD6zEC9h/Y3bBf+ZNGj
RvbKgHQFYSq+EYUzleQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
C6xRmzJVnvguMc3Lt5tkoyg5+/u1VuxRooNBOmgUvD6c148xX9CV/zz4fw53vbCzqUg3WYMPAs5M
/tMrhPMrX5cqjMMHbC20NaFxsFGCfdbN+1Jiu6Ffu0obXLvBu7UGBCEaDTCY0wST3S+7NZ+HnAat
RIt5cVRmnWtLEj9MP8SxAk019LKc3+2AUY0eWFhWbTGvNoTLcRFak8vqIx8KBuqhc16O50jjNmM3
PJltfibMKzAmWpsf6xiOkaD+BvARuccAoYGgANLBAEQdJUza98//SuTN0KLZKbFSmy2WI5iAzkxJ
bhH9hPn6Ks1JkH9+j61hMSpdxSh8rM8X8Dppxw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pefxdCU7VwYHa7diZaenheQOVCFpIvDlVp0qUtYsCnfw3IK+d5+k4O7xc5MWvQPeJpwUWNg+c9U8
PcbHo1enWoVg9o1V4U5fg7wxYqKmubBjgGF3yJ5FYGt6FeiD7zcnIJcaP2puAYDdVnxtiJnNmFz2
OQ7UQsleDpBQo3E4NEsbtqgSaopjHREMjI4yjJ9l5XZYNPCWUzUV/mSGX/kF+vuSOZclwPm6w72e
TE0MyJZA2HPDY3HIy260pYSHuDTUpe8gTxi0s8JmpFjaMaibBcPzq2gqPSQe1d6pDE8cv0OxNYKL
gFy+uh/H5gpNjfWVBhRmUo/kFf8fs680z0B0IQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
q8meW/DFYsK3R2jTQ13P/a1BVQyF0Eb3aLhqxNSrqINAq7gQ0DvJ6JFuxd6Ce7TIpxqKUYX9026h
UujOPWt7f1brVrSWmt8cW5Um2Yy8tv+YSNv9Ig592u4GssTU6dF978RK/7L4ZuQObLOKvWLJqo3F
6gzw0VbqYS3g5aaGu+Y=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GVM7UoBz9uTOdnKd0CVM0lBuJK2N20FwcoiRGregMBQMsQuevbc7y03ZehM7mfGvEdERp1TciWoI
1b6cDAZYb0YBfSuch0bItCwhdftV3A4/R0nUF0HROsZ/rm/HV7DKDXxItqK0qcdOwqf7ju85NMa4
FJRP/Nuq/ya9IvX9BCpmUlT7tLkICG8cEL8/iJrJY3jRIBtKw85mL5OM+r22LQeYg1/3rb9Rk9BT
RZCTbDcVSUq2Awr+6f0L2NXlRwhFraBy+h9iSZKZ/U7uolyF0nB1+/BSgOl+rttZ2KxfLXe6g81N
FbxtrlpK7FNc9fx2jrKWh5bczyW6p0ATPX0ZbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rYkJ9a3QzTBGC5CITub5Su2Qs6nnM1m+OFLf4ykZkZGIsp11NQi6h5t8dsi/rX/MeEof1XLVJGEU
N+qLOHuLrttRAipPNBsj7yqH3Amnleqy/rjy8UcckD0gxIYzuIlc+2VKoAoyrEFgofTH5bKzBaaQ
q0JSt8PES8xuld4SvsKwr+0Q23qJIUpeNL3HvzxZDmYf5OhTkwlZPi/aLwSMoPZHKwetLUg5SdBm
7K4UmxvUPD3GNxo6GW6dkG2tFW/N9+ju7i//O1A74VUrDPo1OwQfEJazwHFFpHGjCJkv2CiPU3+I
TIVvzssQcs8IphMJulwZguc7fFiYv6aZyj/GrA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PqIVM68d++A6qxRgSePlX8JOoCfHcFLdhzsYr1BDYvLE5JJ5WKFO0Bie6pyEiAbsH8z6oUFGm/Qy
BLXAyWfv1fmbVAwztezaMaxBF0Lw4epvQlAFVdMGJVKgvxfU7ssvLc1KfpF6R/c1o5+4Vf7zn3X+
R8k67LVYgJoxhrPoY3XYr88CjSITfNW0jLDjh0jtDWf7H7nM6QYSXVbRYczQPcepXW2MOFcCZsbi
tdla+UNJ4NeKTUK5bdE9tNZx/8BYKrJtLhyvNdwHi7EdonKLjQu63ExIHoriUmiZScMNbtr2LUBc
YYGUTIENquQ/OhU+DAVXmKbIZcQhwGaqjYeaag==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YMvD1GHkklhDlN9yur11SqhNZTItCRHxHobZtty993SsbvXTWJBbLeIJ+nQ/sv57gpjV5RswiJYh
Vu7QPlLUy2DbVjjcqxaxXlPvYaWV1eKD7BVBOV6HDzPAaAIaFvNjeRurYX0a9Dz1qkgkmttneZxB
s04mTyRdVOc7jIs5wjgXiF+iA0W50/g9JmIYyP6mMLkgEy0MbGyVfpbRfDMcrB3ACnucHTo8A0nT
V/rBUOGbTCYPmQ01tbuE2nqoEfTlmqHVKO6BZ93tQUEjrYoJdteva6yHUfH3dbV1vwwBtsdolICY
7x8cMlorxb6y2ZD7vQEYz6Q6iVnG/PmdaCkLSg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 25648)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
