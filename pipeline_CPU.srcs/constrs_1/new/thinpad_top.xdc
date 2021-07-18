#Clock
set_property -dict {PACKAGE_PIN K21 IOSTANDARD LVCMOS33} [get_ports clk_50M]
set_property -dict {PACKAGE_PIN H21 IOSTANDARD LVCMOS33} [get_ports clk_11M0592]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_11M0592_IBUF]

create_clock -period 20.000 -name clk_50M -waveform {0.000 10.000} [get_ports clk_50M]
create_clock -period 90.422 -name clk_11M0592 -waveform {0.000 45.211} [get_ports clk_11M0592]

#Touch Button
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {touch_btn[0]}]
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports {touch_btn[1]}]
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS33} [get_ports {touch_btn[2]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {touch_btn[3]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports clock_btn]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports reset_btn]

#required if touch button used as manual clock source
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clock_btn_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets reset_btn_IBUF]

#CPLD GPIO 12-16
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports uart_wrn]
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports uart_rdn]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports uart_tbre]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports uart_tsre]
set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports uart_dataready]

#Ext serial
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN H18} [get_ports txd]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J20} [get_ports rxd]

#Digital Video
set_property -dict {PACKAGE_PIN H22 IOSTANDARD LVCMOS33} [get_ports video_clk]
set_property -dict {PACKAGE_PIN E26 IOSTANDARD LVCMOS33} [get_ports {video_red[2]}]
set_property -dict {PACKAGE_PIN F24 IOSTANDARD LVCMOS33} [get_ports {video_red[1]}]
set_property -dict {PACKAGE_PIN K23 IOSTANDARD LVCMOS33} [get_ports {video_red[0]}]
set_property -dict {PACKAGE_PIN F23 IOSTANDARD LVCMOS33} [get_ports {video_green[2]}]
set_property -dict {PACKAGE_PIN E23 IOSTANDARD LVCMOS33} [get_ports {video_green[1]}]
set_property -dict {PACKAGE_PIN K22 IOSTANDARD LVCMOS33} [get_ports {video_green[0]}]
set_property -dict {PACKAGE_PIN D25 IOSTANDARD LVCMOS33} [get_ports {video_blue[1]}]
set_property -dict {PACKAGE_PIN E25 IOSTANDARD LVCMOS33} [get_ports {video_blue[0]}]
set_property -dict {PACKAGE_PIN J24 IOSTANDARD LVCMOS33} [get_ports video_hsync]
set_property -dict {PACKAGE_PIN H24 IOSTANDARD LVCMOS33} [get_ports video_vsync]
set_property -dict {PACKAGE_PIN G24 IOSTANDARD LVCMOS33} [get_ports video_de]

#LEDS
set_property -dict {PACKAGE_PIN B24 IOSTANDARD LVCMOS33} [get_ports {leds[0]}]
set_property -dict {PACKAGE_PIN E21 IOSTANDARD LVCMOS33} [get_ports {leds[1]}]
set_property -dict {PACKAGE_PIN A24 IOSTANDARD LVCMOS33} [get_ports {leds[2]}]
set_property -dict {PACKAGE_PIN D23 IOSTANDARD LVCMOS33} [get_ports {leds[3]}]
set_property -dict {PACKAGE_PIN C22 IOSTANDARD LVCMOS33} [get_ports {leds[4]}]
set_property -dict {PACKAGE_PIN C21 IOSTANDARD LVCMOS33} [get_ports {leds[5]}]
set_property -dict {PACKAGE_PIN E20 IOSTANDARD LVCMOS33} [get_ports {leds[6]}]
set_property -dict {PACKAGE_PIN B22 IOSTANDARD LVCMOS33} [get_ports {leds[7]}]
set_property -dict {PACKAGE_PIN C23 IOSTANDARD LVCMOS33} [get_ports {leds[8]}]
set_property -dict {PACKAGE_PIN A23 IOSTANDARD LVCMOS33} [get_ports {leds[9]}]
set_property -dict {PACKAGE_PIN D21 IOSTANDARD LVCMOS33} [get_ports {leds[10]}]
set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports {leds[11]}]
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports {leds[12]}]
set_property -dict {PACKAGE_PIN A22 IOSTANDARD LVCMOS33} [get_ports {leds[13]}]
set_property -dict {PACKAGE_PIN A20 IOSTANDARD LVCMOS33} [get_ports {leds[14]}]
set_property -dict {PACKAGE_PIN B20 IOSTANDARD LVCMOS33} [get_ports {leds[15]}]

#DPY0
set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS33} [get_ports {dpy0[0]}]
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {dpy0[1]}]
set_property -dict {PACKAGE_PIN B21 IOSTANDARD LVCMOS33} [get_ports {dpy0[2]}]
set_property -dict {PACKAGE_PIN A19 IOSTANDARD LVCMOS33} [get_ports {dpy0[3]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {dpy0[4]}]
set_property -dict {PACKAGE_PIN C19 IOSTANDARD LVCMOS33} [get_ports {dpy0[5]}]
set_property -dict {PACKAGE_PIN B17 IOSTANDARD LVCMOS33} [get_ports {dpy0[6]}]
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports {dpy0[7]}]

#DPY1
set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS33} [get_ports {dpy1[0]}]
set_property -dict {PACKAGE_PIN D16 IOSTANDARD LVCMOS33} [get_ports {dpy1[1]}]
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports {dpy1[2]}]
set_property -dict {PACKAGE_PIN F17 IOSTANDARD LVCMOS33} [get_ports {dpy1[3]}]
set_property -dict {PACKAGE_PIN E16 IOSTANDARD LVCMOS33} [get_ports {dpy1[4]}]
set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports {dpy1[5]}]
set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports {dpy1[6]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {dpy1[7]}]

#DIP_SW
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports {dip_sw[0]}]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {dip_sw[1]}]
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports {dip_sw[2]}]
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {dip_sw[3]}]
set_property -dict {PACKAGE_PIN P4 IOSTANDARD LVCMOS33} [get_ports {dip_sw[4]}]
set_property -dict {PACKAGE_PIN L5 IOSTANDARD LVCMOS33} [get_ports {dip_sw[5]}]
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports {dip_sw[6]}]
set_property -dict {PACKAGE_PIN N6 IOSTANDARD LVCMOS33} [get_ports {dip_sw[7]}]
set_property -dict {PACKAGE_PIN M6 IOSTANDARD LVCMOS33} [get_ports {dip_sw[8]}]
set_property -dict {PACKAGE_PIN N7 IOSTANDARD LVCMOS33} [get_ports {dip_sw[9]}]
set_property -dict {PACKAGE_PIN M7 IOSTANDARD LVCMOS33} [get_ports {dip_sw[10]}]
set_property -dict {PACKAGE_PIN L7 IOSTANDARD LVCMOS33} [get_ports {dip_sw[11]}]
set_property -dict {PACKAGE_PIN M5 IOSTANDARD LVCMOS33} [get_ports {dip_sw[12]}]
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports {dip_sw[13]}]
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports {dip_sw[14]}]
set_property -dict {PACKAGE_PIN L2 IOSTANDARD LVCMOS33} [get_ports {dip_sw[15]}]
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports {dip_sw[16]}]
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports {dip_sw[17]}]
set_property -dict {PACKAGE_PIN N3 IOSTANDARD LVCMOS33} [get_ports {dip_sw[18]}]
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS33} [get_ports {dip_sw[19]}]
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports {dip_sw[20]}]
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports {dip_sw[21]}]
set_property -dict {PACKAGE_PIN P6 IOSTANDARD LVCMOS33} [get_ports {dip_sw[22]}]
set_property -dict {PACKAGE_PIN N1 IOSTANDARD LVCMOS33} [get_ports {dip_sw[23]}]
set_property -dict {PACKAGE_PIN P5 IOSTANDARD LVCMOS33} [get_ports {dip_sw[24]}]
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports {dip_sw[25]}]
set_property -dict {PACKAGE_PIN T4 IOSTANDARD LVCMOS33} [get_ports {dip_sw[26]}]
set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports {dip_sw[27]}]
set_property -dict {PACKAGE_PIN R5 IOSTANDARD LVCMOS33} [get_ports {dip_sw[28]}]
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports {dip_sw[29]}]
set_property -dict {PACKAGE_PIN R6 IOSTANDARD LVCMOS33} [get_ports {dip_sw[30]}]
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {dip_sw[31]}]

set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports {flash_a[0]}]
set_property -dict {PACKAGE_PIN H9 IOSTANDARD LVCMOS33} [get_ports {flash_a[1]}]
set_property -dict {PACKAGE_PIN H8 IOSTANDARD LVCMOS33} [get_ports {flash_a[2]}]
set_property -dict {PACKAGE_PIN G9 IOSTANDARD LVCMOS33} [get_ports {flash_a[3]}]
set_property -dict {PACKAGE_PIN H7 IOSTANDARD LVCMOS33} [get_ports {flash_a[4]}]
set_property -dict {PACKAGE_PIN F8 IOSTANDARD LVCMOS33} [get_ports {flash_a[5]}]
set_property -dict {PACKAGE_PIN G8 IOSTANDARD LVCMOS33} [get_ports {flash_a[6]}]
set_property -dict {PACKAGE_PIN K7 IOSTANDARD LVCMOS33} [get_ports {flash_a[7]}]
set_property -dict {PACKAGE_PIN G7 IOSTANDARD LVCMOS33} [get_ports {flash_a[8]}]
set_property -dict {PACKAGE_PIN F7 IOSTANDARD LVCMOS33} [get_ports {flash_a[9]}]
set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports {flash_a[10]}]
set_property -dict {PACKAGE_PIN D6 IOSTANDARD LVCMOS33} [get_ports {flash_a[11]}]
set_property -dict {PACKAGE_PIN F5 IOSTANDARD LVCMOS33} [get_ports {flash_a[12]}]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {flash_a[13]}]
set_property -dict {PACKAGE_PIN G5 IOSTANDARD LVCMOS33} [get_ports {flash_a[14]}]
set_property -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS33} [get_ports {flash_a[15]}]
set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports {flash_a[16]}]
set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33} [get_ports {flash_a[17]}]
set_property -dict {PACKAGE_PIN J6 IOSTANDARD LVCMOS33} [get_ports {flash_a[18]}]
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports {flash_a[19]}]
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports {flash_a[20]}]
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports {flash_a[21]}]
set_property -dict {PACKAGE_PIN K6 IOSTANDARD LVCMOS33} [get_ports {flash_a[22]}]

set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports {flash_d[0]}]
set_property -dict {PACKAGE_PIN C1 IOSTANDARD LVCMOS33} [get_ports {flash_d[1]}]
set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS33} [get_ports {flash_d[2]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports {flash_d[3]}]
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {flash_d[4]}]
set_property -dict {PACKAGE_PIN A2 IOSTANDARD LVCMOS33} [get_ports {flash_d[5]}]
set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS33} [get_ports {flash_d[6]}]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {flash_d[7]}]
set_property -dict {PACKAGE_PIN D3 IOSTANDARD LVCMOS33} [get_ports {flash_d[8]}]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports {flash_d[9]}]
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports {flash_d[10]}]
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS33} [get_ports {flash_d[11]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {flash_d[12]}]
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports {flash_d[13]}]
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {flash_d[14]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {flash_d[15]}]

set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS33} [get_ports flash_byte_n]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports flash_ce_n]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports flash_oe_n]
set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports flash_rp_n]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports flash_vpen]
set_property -dict {PACKAGE_PIN B5 IOSTANDARD LVCMOS33} [get_ports flash_we_n]

set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[0]}]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[1]}]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[2]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[3]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[4]}]
set_property -dict {PACKAGE_PIN R20 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[5]}]
set_property -dict {PACKAGE_PIN R23 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[6]}]
set_property -dict {PACKAGE_PIN T23 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[7]}]
set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[8]}]
set_property -dict {PACKAGE_PIN Y22 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[9]}]
set_property -dict {PACKAGE_PIN AB24 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[10]}]
set_property -dict {PACKAGE_PIN AA23 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[11]}]
set_property -dict {PACKAGE_PIN Y21 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[12]}]
set_property -dict {PACKAGE_PIN Y20 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[13]}]
set_property -dict {PACKAGE_PIN AA22 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[14]}]
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[15]}]
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[16]}]
set_property -dict {PACKAGE_PIN W20 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[17]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[18]}]
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[19]}]
set_property -dict {PACKAGE_PIN L22 IOSTANDARD LVCMOS33} [get_ports {base_ram_be_n[1]}]
set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports {base_ram_be_n[0]}]
set_property -dict {PACKAGE_PIN K25 IOSTANDARD LVCMOS33} [get_ports {base_ram_be_n[3]}]
set_property -dict {PACKAGE_PIN L23 IOSTANDARD LVCMOS33} [get_ports {base_ram_be_n[2]}]
set_property -dict {PACKAGE_PIN L24 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[0]}]
set_property -dict {PACKAGE_PIN L25 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[1]}]
set_property -dict {PACKAGE_PIN M26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[2]}]
set_property -dict {PACKAGE_PIN M25 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[3]}]
set_property -dict {PACKAGE_PIN N26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[4]}]
set_property -dict {PACKAGE_PIN P24 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[5]}]
set_property -dict {PACKAGE_PIN P26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[6]}]
set_property -dict {PACKAGE_PIN P25 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[7]}]
set_property -dict {PACKAGE_PIN AA24 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[8]}]
set_property -dict {PACKAGE_PIN Y23 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[9]}]
set_property -dict {PACKAGE_PIN V21 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[10]}]
set_property -dict {PACKAGE_PIN W24 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[11]}]
set_property -dict {PACKAGE_PIN W23 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[12]}]
set_property -dict {PACKAGE_PIN V22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[13]}]
set_property -dict {PACKAGE_PIN V23 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[14]}]
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[15]}]
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[16]}]
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[17]}]
set_property -dict {PACKAGE_PIN P23 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[18]}]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[19]}]
set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[20]}]
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[21]}]
set_property -dict {PACKAGE_PIN N24 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[22]}]
set_property -dict {PACKAGE_PIN N21 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[23]}]
set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[24]}]
set_property -dict {PACKAGE_PIN R22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[25]}]
set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[26]}]
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[27]}]
set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[28]}]
set_property -dict {PACKAGE_PIN N23 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[29]}]
set_property -dict {PACKAGE_PIN M24 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[30]}]
set_property -dict {PACKAGE_PIN M22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data[31]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports base_ram_ce_n]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33} [get_ports base_ram_oe_n]
set_property -dict {PACKAGE_PIN U20 IOSTANDARD LVCMOS33} [get_ports base_ram_we_n]

set_property -dict {PACKAGE_PIN AF25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[0]}]
set_property -dict {PACKAGE_PIN AE25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[1]}]
set_property -dict {PACKAGE_PIN AE26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[2]}]
set_property -dict {PACKAGE_PIN AD25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[3]}]
set_property -dict {PACKAGE_PIN AD26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[4]}]
set_property -dict {PACKAGE_PIN AC22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[5]}]
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[6]}]
set_property -dict {PACKAGE_PIN AA18 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[7]}]
set_property -dict {PACKAGE_PIN AA17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[8]}]
set_property -dict {PACKAGE_PIN Y25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[9]}]
set_property -dict {PACKAGE_PIN AA25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[10]}]
set_property -dict {PACKAGE_PIN AB26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[11]}]
set_property -dict {PACKAGE_PIN AB25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[12]}]
set_property -dict {PACKAGE_PIN AC26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[13]}]
set_property -dict {PACKAGE_PIN AC24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[14]}]
set_property -dict {PACKAGE_PIN AF17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[15]}]
set_property -dict {PACKAGE_PIN AE17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[16]}]
set_property -dict {PACKAGE_PIN AF18 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[17]}]
set_property -dict {PACKAGE_PIN AE18 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[18]}]
set_property -dict {PACKAGE_PIN AF19 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[19]}]
set_property -dict {PACKAGE_PIN R25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_be_n[1]}]
set_property -dict {PACKAGE_PIN R26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_be_n[0]}]
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_be_n[3]}]
set_property -dict {PACKAGE_PIN AD24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_be_n[2]}]
set_property -dict {PACKAGE_PIN AF24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[0]}]
set_property -dict {PACKAGE_PIN AE23 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[1]}]
set_property -dict {PACKAGE_PIN AF23 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[2]}]
set_property -dict {PACKAGE_PIN AE22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[3]}]
set_property -dict {PACKAGE_PIN AF22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[4]}]
set_property -dict {PACKAGE_PIN AE21 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[5]}]
set_property -dict {PACKAGE_PIN AE20 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[6]}]
set_property -dict {PACKAGE_PIN AF20 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[7]}]
set_property -dict {PACKAGE_PIN Y26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[8]}]
set_property -dict {PACKAGE_PIN W25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[9]}]
set_property -dict {PACKAGE_PIN W26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[10]}]
set_property -dict {PACKAGE_PIN V24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[11]}]
set_property -dict {PACKAGE_PIN V26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[12]}]
set_property -dict {PACKAGE_PIN U25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[13]}]
set_property -dict {PACKAGE_PIN U26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[14]}]
set_property -dict {PACKAGE_PIN U24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[15]}]
set_property -dict {PACKAGE_PIN AB16 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[16]}]
set_property -dict {PACKAGE_PIN AC19 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[17]}]
set_property -dict {PACKAGE_PIN AB17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[18]}]
set_property -dict {PACKAGE_PIN AC18 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[19]}]
set_property -dict {PACKAGE_PIN AD18 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[20]}]
set_property -dict {PACKAGE_PIN AC16 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[21]}]
set_property -dict {PACKAGE_PIN Y15 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[22]}]
set_property -dict {PACKAGE_PIN AA15 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[23]}]
set_property -dict {PACKAGE_PIN AD17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[24]}]
set_property -dict {PACKAGE_PIN AC17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[25]}]
set_property -dict {PACKAGE_PIN AD20 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[26]}]
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[27]}]
set_property -dict {PACKAGE_PIN AD21 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[28]}]
set_property -dict {PACKAGE_PIN AC21 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[29]}]
set_property -dict {PACKAGE_PIN AA19 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[30]}]
set_property -dict {PACKAGE_PIN AC23 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data[31]}]
set_property -dict {PACKAGE_PIN AD23 IOSTANDARD LVCMOS33} [get_ports ext_ram_ce_n]
set_property -dict {PACKAGE_PIN AB19 IOSTANDARD LVCMOS33} [get_ports ext_ram_oe_n]
set_property -dict {PACKAGE_PIN AD19 IOSTANDARD LVCMOS33} [get_ports ext_ram_we_n]

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]


connect_debug_port u_ila_0/probe4 [get_nets [list {cpu/DataRoad/imme16_shift[0]} {cpu/DataRoad/imme16_shift[1]} {cpu/DataRoad/imme16_shift[2]} {cpu/DataRoad/imme16_shift[3]} {cpu/DataRoad/imme16_shift[4]} {cpu/DataRoad/imme16_shift[5]} {cpu/DataRoad/imme16_shift[6]} {cpu/DataRoad/imme16_shift[7]} {cpu/DataRoad/imme16_shift[8]} {cpu/DataRoad/imme16_shift[9]} {cpu/DataRoad/imme16_shift[10]} {cpu/DataRoad/imme16_shift[11]} {cpu/DataRoad/imme16_shift[12]} {cpu/DataRoad/imme16_shift[13]} {cpu/DataRoad/imme16_shift[14]} {cpu/DataRoad/imme16_shift[15]} {cpu/DataRoad/imme16_shift[16]} {cpu/DataRoad/imme16_shift[17]} {cpu/DataRoad/imme16_shift[18]} {cpu/DataRoad/imme16_shift[19]} {cpu/DataRoad/imme16_shift[20]} {cpu/DataRoad/imme16_shift[21]} {cpu/DataRoad/imme16_shift[22]} {cpu/DataRoad/imme16_shift[23]} {cpu/DataRoad/imme16_shift[24]} {cpu/DataRoad/imme16_shift[25]} {cpu/DataRoad/imme16_shift[26]} {cpu/DataRoad/imme16_shift[27]} {cpu/DataRoad/imme16_shift[28]} {cpu/DataRoad/imme16_shift[29]} {cpu/DataRoad/imme16_shift[30]} {cpu/DataRoad/imme16_shift[31]}]]
connect_debug_port u_ila_0/probe5 [get_nets [list {cpu/DataRoad/pc_add_4_EX[0]} {cpu/DataRoad/pc_add_4_EX[1]} {cpu/DataRoad/pc_add_4_EX[2]} {cpu/DataRoad/pc_add_4_EX[3]} {cpu/DataRoad/pc_add_4_EX[4]} {cpu/DataRoad/pc_add_4_EX[5]} {cpu/DataRoad/pc_add_4_EX[6]} {cpu/DataRoad/pc_add_4_EX[7]} {cpu/DataRoad/pc_add_4_EX[8]} {cpu/DataRoad/pc_add_4_EX[9]} {cpu/DataRoad/pc_add_4_EX[10]} {cpu/DataRoad/pc_add_4_EX[11]} {cpu/DataRoad/pc_add_4_EX[12]} {cpu/DataRoad/pc_add_4_EX[13]} {cpu/DataRoad/pc_add_4_EX[14]} {cpu/DataRoad/pc_add_4_EX[15]} {cpu/DataRoad/pc_add_4_EX[16]} {cpu/DataRoad/pc_add_4_EX[17]} {cpu/DataRoad/pc_add_4_EX[18]} {cpu/DataRoad/pc_add_4_EX[19]} {cpu/DataRoad/pc_add_4_EX[20]} {cpu/DataRoad/pc_add_4_EX[21]} {cpu/DataRoad/pc_add_4_EX[22]} {cpu/DataRoad/pc_add_4_EX[23]} {cpu/DataRoad/pc_add_4_EX[24]} {cpu/DataRoad/pc_add_4_EX[25]} {cpu/DataRoad/pc_add_4_EX[26]} {cpu/DataRoad/pc_add_4_EX[27]} {cpu/DataRoad/pc_add_4_EX[28]} {cpu/DataRoad/pc_add_4_EX[29]} {cpu/DataRoad/pc_add_4_EX[30]} {cpu/DataRoad/pc_add_4_EX[31]}]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_25/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {cpu/DataRoad/regs/reg2[0]} {cpu/DataRoad/regs/reg2[1]} {cpu/DataRoad/regs/reg2[2]} {cpu/DataRoad/regs/reg2[3]} {cpu/DataRoad/regs/reg2[4]} {cpu/DataRoad/regs/reg2[5]} {cpu/DataRoad/regs/reg2[6]} {cpu/DataRoad/regs/reg2[7]} {cpu/DataRoad/regs/reg2[8]} {cpu/DataRoad/regs/reg2[9]} {cpu/DataRoad/regs/reg2[10]} {cpu/DataRoad/regs/reg2[11]} {cpu/DataRoad/regs/reg2[12]} {cpu/DataRoad/regs/reg2[13]} {cpu/DataRoad/regs/reg2[14]} {cpu/DataRoad/regs/reg2[15]} {cpu/DataRoad/regs/reg2[16]} {cpu/DataRoad/regs/reg2[17]} {cpu/DataRoad/regs/reg2[18]} {cpu/DataRoad/regs/reg2[19]} {cpu/DataRoad/regs/reg2[20]} {cpu/DataRoad/regs/reg2[21]} {cpu/DataRoad/regs/reg2[22]} {cpu/DataRoad/regs/reg2[23]} {cpu/DataRoad/regs/reg2[24]} {cpu/DataRoad/regs/reg2[25]} {cpu/DataRoad/regs/reg2[26]} {cpu/DataRoad/regs/reg2[27]} {cpu/DataRoad/regs/reg2[28]} {cpu/DataRoad/regs/reg2[29]} {cpu/DataRoad/regs/reg2[30]} {cpu/DataRoad/regs/reg2[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {cpu/DataRoad/pc/pc[0]} {cpu/DataRoad/pc/pc[1]} {cpu/DataRoad/pc/pc[2]} {cpu/DataRoad/pc/pc[3]} {cpu/DataRoad/pc/pc[4]} {cpu/DataRoad/pc/pc[5]} {cpu/DataRoad/pc/pc[6]} {cpu/DataRoad/pc/pc[7]} {cpu/DataRoad/pc/pc[8]} {cpu/DataRoad/pc/pc[9]} {cpu/DataRoad/pc/pc[10]} {cpu/DataRoad/pc/pc[11]} {cpu/DataRoad/pc/pc[12]} {cpu/DataRoad/pc/pc[13]} {cpu/DataRoad/pc/pc[14]} {cpu/DataRoad/pc/pc[15]} {cpu/DataRoad/pc/pc[16]} {cpu/DataRoad/pc/pc[17]} {cpu/DataRoad/pc/pc[18]} {cpu/DataRoad/pc/pc[19]} {cpu/DataRoad/pc/pc[20]} {cpu/DataRoad/pc/pc[21]} {cpu/DataRoad/pc/pc[22]} {cpu/DataRoad/pc/pc[23]} {cpu/DataRoad/pc/pc[24]} {cpu/DataRoad/pc/pc[25]} {cpu/DataRoad/pc/pc[26]} {cpu/DataRoad/pc/pc[27]} {cpu/DataRoad/pc/pc[28]} {cpu/DataRoad/pc/pc[29]} {cpu/DataRoad/pc/pc[30]} {cpu/DataRoad/pc/pc[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {cpu/DataRoad/regs/reg1[0]} {cpu/DataRoad/regs/reg1[1]} {cpu/DataRoad/regs/reg1[2]} {cpu/DataRoad/regs/reg1[3]} {cpu/DataRoad/regs/reg1[4]} {cpu/DataRoad/regs/reg1[5]} {cpu/DataRoad/regs/reg1[6]} {cpu/DataRoad/regs/reg1[7]} {cpu/DataRoad/regs/reg1[8]} {cpu/DataRoad/regs/reg1[9]} {cpu/DataRoad/regs/reg1[10]} {cpu/DataRoad/regs/reg1[11]} {cpu/DataRoad/regs/reg1[12]} {cpu/DataRoad/regs/reg1[13]} {cpu/DataRoad/regs/reg1[14]} {cpu/DataRoad/regs/reg1[15]} {cpu/DataRoad/regs/reg1[16]} {cpu/DataRoad/regs/reg1[17]} {cpu/DataRoad/regs/reg1[18]} {cpu/DataRoad/regs/reg1[19]} {cpu/DataRoad/regs/reg1[20]} {cpu/DataRoad/regs/reg1[21]} {cpu/DataRoad/regs/reg1[22]} {cpu/DataRoad/regs/reg1[23]} {cpu/DataRoad/regs/reg1[24]} {cpu/DataRoad/regs/reg1[25]} {cpu/DataRoad/regs/reg1[26]} {cpu/DataRoad/regs/reg1[27]} {cpu/DataRoad/regs/reg1[28]} {cpu/DataRoad/regs/reg1[29]} {cpu/DataRoad/regs/reg1[30]} {cpu/DataRoad/regs/reg1[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {cpu/DataRoad/regs/reg3[0]} {cpu/DataRoad/regs/reg3[1]} {cpu/DataRoad/regs/reg3[2]} {cpu/DataRoad/regs/reg3[3]} {cpu/DataRoad/regs/reg3[4]} {cpu/DataRoad/regs/reg3[5]} {cpu/DataRoad/regs/reg3[6]} {cpu/DataRoad/regs/reg3[7]} {cpu/DataRoad/regs/reg3[8]} {cpu/DataRoad/regs/reg3[9]} {cpu/DataRoad/regs/reg3[10]} {cpu/DataRoad/regs/reg3[11]} {cpu/DataRoad/regs/reg3[12]} {cpu/DataRoad/regs/reg3[13]} {cpu/DataRoad/regs/reg3[14]} {cpu/DataRoad/regs/reg3[15]} {cpu/DataRoad/regs/reg3[16]} {cpu/DataRoad/regs/reg3[17]} {cpu/DataRoad/regs/reg3[18]} {cpu/DataRoad/regs/reg3[19]} {cpu/DataRoad/regs/reg3[20]} {cpu/DataRoad/regs/reg3[21]} {cpu/DataRoad/regs/reg3[22]} {cpu/DataRoad/regs/reg3[23]} {cpu/DataRoad/regs/reg3[24]} {cpu/DataRoad/regs/reg3[25]} {cpu/DataRoad/regs/reg3[26]} {cpu/DataRoad/regs/reg3[27]} {cpu/DataRoad/regs/reg3[28]} {cpu/DataRoad/regs/reg3[29]} {cpu/DataRoad/regs/reg3[30]} {cpu/DataRoad/regs/reg3[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {cpu/DataRoad/beq_target_real[0]} {cpu/DataRoad/beq_target_real[1]} {cpu/DataRoad/beq_target_real[2]} {cpu/DataRoad/beq_target_real[3]} {cpu/DataRoad/beq_target_real[4]} {cpu/DataRoad/beq_target_real[5]} {cpu/DataRoad/beq_target_real[6]} {cpu/DataRoad/beq_target_real[7]} {cpu/DataRoad/beq_target_real[8]} {cpu/DataRoad/beq_target_real[9]} {cpu/DataRoad/beq_target_real[10]} {cpu/DataRoad/beq_target_real[11]} {cpu/DataRoad/beq_target_real[12]} {cpu/DataRoad/beq_target_real[13]} {cpu/DataRoad/beq_target_real[14]} {cpu/DataRoad/beq_target_real[15]} {cpu/DataRoad/beq_target_real[16]} {cpu/DataRoad/beq_target_real[17]} {cpu/DataRoad/beq_target_real[18]} {cpu/DataRoad/beq_target_real[19]} {cpu/DataRoad/beq_target_real[20]} {cpu/DataRoad/beq_target_real[21]} {cpu/DataRoad/beq_target_real[22]} {cpu/DataRoad/beq_target_real[23]} {cpu/DataRoad/beq_target_real[24]} {cpu/DataRoad/beq_target_real[25]} {cpu/DataRoad/beq_target_real[26]} {cpu/DataRoad/beq_target_real[27]} {cpu/DataRoad/beq_target_real[28]} {cpu/DataRoad/beq_target_real[29]} {cpu/DataRoad/beq_target_real[30]} {cpu/DataRoad/beq_target_real[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {cpu/DataRoad/Inst[0]} {cpu/DataRoad/Inst[1]} {cpu/DataRoad/Inst[2]} {cpu/DataRoad/Inst[3]} {cpu/DataRoad/Inst[4]} {cpu/DataRoad/Inst[5]} {cpu/DataRoad/Inst[6]} {cpu/DataRoad/Inst[7]} {cpu/DataRoad/Inst[8]} {cpu/DataRoad/Inst[9]} {cpu/DataRoad/Inst[10]} {cpu/DataRoad/Inst[11]} {cpu/DataRoad/Inst[12]} {cpu/DataRoad/Inst[13]} {cpu/DataRoad/Inst[14]} {cpu/DataRoad/Inst[15]} {cpu/DataRoad/Inst[16]} {cpu/DataRoad/Inst[17]} {cpu/DataRoad/Inst[18]} {cpu/DataRoad/Inst[19]} {cpu/DataRoad/Inst[20]} {cpu/DataRoad/Inst[21]} {cpu/DataRoad/Inst[22]} {cpu/DataRoad/Inst[23]} {cpu/DataRoad/Inst[24]} {cpu/DataRoad/Inst[25]} {cpu/DataRoad/Inst[26]} {cpu/DataRoad/Inst[27]} {cpu/DataRoad/Inst[28]} {cpu/DataRoad/Inst[29]} {cpu/DataRoad/Inst[30]} {cpu/DataRoad/Inst[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list cpu/DataRoad/branch_real]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_25M]
