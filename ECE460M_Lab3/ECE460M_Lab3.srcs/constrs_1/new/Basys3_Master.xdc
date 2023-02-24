## Clock signal
set_property PACKAGE_PIN W5 [get_ports {fastclk}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {fastclk}]
#	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]


### Switches
set_property PACKAGE_PIN V17 [get_ports {start}]
    set_property IOSTANDARD LVCMOS33 [get_ports {start}]
set_property PACKAGE_PIN V16 [get_ports {reset}]
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
set_property PACKAGE_PIN W16 [get_ports {mode[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {mode[0]}]
set_property PACKAGE_PIN W17 [get_ports {mode[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {mode[1]}]

##led
set_property PACKAGE_PIN U16 [get_ports {SI}]
    set_property IOSTANDARD LVCMOS33 [get_ports {SI}]


###7 segment display
set_property PACKAGE_PIN W7 [get_ports {seven[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seven[6]}]
set_property PACKAGE_PIN W6 [get_ports {seven[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seven[5]}]
set_property PACKAGE_PIN U8 [get_ports {seven[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seven[4]}]
set_property PACKAGE_PIN V8 [get_ports {seven[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seven[3]}]
set_property PACKAGE_PIN U5 [get_ports {seven[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seven[2]}]
set_property PACKAGE_PIN V5 [get_ports {seven[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seven[1]}]
set_property PACKAGE_PIN U7 [get_ports {seven[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seven[0]}]

##set_property PACKAGE_PIN V7 [get_ports dp]
##    set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]