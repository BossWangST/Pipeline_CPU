// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Jun  1 21:58:02 2021
// Host        : LAPTOP-0FSA8U4L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top Inst_mem_1 -prefix
//               Inst_mem_1_ Inst_mem_1_sim_netlist.v
// Design      : Inst_mem_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Inst_mem_1,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
(* NotValidForBitStream *)
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
  wire [7:0]NLW_U0_dpo_UNCONNECTED;
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
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[7:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[7:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(we));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8848)
`pragma protect data_block
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
U11lPxgAIzCdGHHZsQ==
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
