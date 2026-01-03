## Board clock
set_property PACKAGE_PIN W5 [get_ports fpgaClk]							
	set_property IOSTANDARD LVCMOS33 [get_ports fpgaClk]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports fpgaClk]

## Button: reset
set_property PACKAGE_PIN T18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]

# LED: LD15 FOR MEMWRITE
set_property PACKAGE_PIN L1 [get_ports memwrite]
set_property IOSTANDARD LVCMOS33 [get_ports memwrite]

## LEDS: LD7-LD0
set_property PACKAGE_PIN U16 [get_ports LED[0]]
set_property PACKAGE_PIN E19 [get_ports LED[1]]
set_property PACKAGE_PIN U19 [get_ports LED[2]]
set_property PACKAGE_PIN V19 [get_ports LED[3]]
set_property PACKAGE_PIN W18 [get_ports LED[4]]
set_property PACKAGE_PIN U15 [get_ports LED[5]]
set_property PACKAGE_PIN U14 [get_ports LED[6]]
set_property PACKAGE_PIN V14 [get_ports LED[7]]
set_property IOSTANDARD LVCMOS33 [get_ports LED]

# 7 segment anodes (active low)
set_property PACKAGE_PIN U2 [get_ports AN[0]]
# AN0
set_property PACKAGE_PIN U4 [get_ports AN[1]]
# AN1
set_property PACKAGE_PIN V4 [get_ports AN[2]]
# AN2
set_property PACKAGE_PIN W4 [get_ports AN[3]]
# AN3
set_property IOSTANDARD LVCMOS33 [get_ports AN]

# 7 segment cathodes
# A
set_property PACKAGE_PIN W7 [get_ports SLED[0]]
# B
set_property PACKAGE_PIN W6 [get_ports SLED[1]]
# C
set_property PACKAGE_PIN U8 [get_ports SLED[2]]
# D
set_property PACKAGE_PIN V8 [get_ports SLED[3]]
# E
set_property PACKAGE_PIN U5 [get_ports SLED[4]]
# F
set_property PACKAGE_PIN V5 [get_ports SLED[5]]
# G
set_property PACKAGE_PIN U7 [get_ports SLED[6]]
# DP
set_property PACKAGE_PIN V7 [get_ports SLED[7]]
set_property IOSTANDARD LVCMOS33 [get_ports SLED]

## switches SW7-SW0
## TODO: SW7-SW0
