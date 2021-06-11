// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue May 25 21:03:42 2021
// Host        : LAPTOP-0FSA8U4L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/University/CPU/SingleCycle/SingleCycle.gen/sources_1/ip/async_mem_1/async_mem_1_sim_netlist.v
// Design      : async_mem_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "async_mem_1,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module async_mem_1
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
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_parser_type = "1" *) 
  (* c_pipeline_stages = "0" *) 
  (* c_qualify_we = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "8" *) 
  (* is_du_within_envelope = "true" *) 
  async_mem_1_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8992)
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
