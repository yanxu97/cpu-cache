onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mp1_tb/clk
add wave -noupdate -radix hexadecimal /mp1_tb/mem_resp
add wave -noupdate -radix hexadecimal /mp1_tb/mem_read
add wave -noupdate -radix hexadecimal /mp1_tb/mem_write
add wave -noupdate -radix hexadecimal /mp1_tb/mem_byte_enable
add wave -noupdate -radix hexadecimal /mp1_tb/mem_address
add wave -noupdate -radix hexadecimal /mp1_tb/mem_rdata
add wave -noupdate -radix hexadecimal /mp1_tb/mem_wdata
add wave -noupdate -radix hexadecimal /mp1_tb/write_data
add wave -noupdate -radix hexadecimal /mp1_tb/write_address
add wave -noupdate -radix hexadecimal /mp1_tb/write
add wave -noupdate -radix hexadecimal /mp1_tb/halt
add wave -noupdate -radix hexadecimal /mp1_tb/clk
add wave -noupdate -radix hexadecimal /mp1_tb/mem_resp
add wave -noupdate -radix hexadecimal /mp1_tb/mem_read
add wave -noupdate -radix hexadecimal /mp1_tb/mem_write
add wave -noupdate -radix hexadecimal /mp1_tb/mem_byte_enable
add wave -noupdate -radix hexadecimal /mp1_tb/mem_address
add wave -noupdate -radix hexadecimal /mp1_tb/mem_rdata
add wave -noupdate -radix hexadecimal /mp1_tb/mem_wdata
add wave -noupdate -radix hexadecimal /mp1_tb/write_data
add wave -noupdate -radix hexadecimal /mp1_tb/write_address
add wave -noupdate -radix hexadecimal /mp1_tb/write
add wave -noupdate -radix hexadecimal /mp1_tb/halt
add wave -noupdate -radix hexadecimal /mp1_tb/dut/control/state
add wave -noupdate /mp1_tb/dut/control/opcode
add wave -noupdate -radix hexadecimal -childformat {{{/mp1_tb/dut/datapath/REGFILE/data[0]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[1]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[2]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[3]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[4]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[5]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[6]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[7]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[8]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[9]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[10]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[11]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[12]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[13]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[14]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[15]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[16]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[17]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[18]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[19]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[20]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[21]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[22]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[23]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[24]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[25]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[26]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[27]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[28]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[29]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[30]} -radix hexadecimal} {{/mp1_tb/dut/datapath/REGFILE/data[31]} -radix hexadecimal}} -expand -subitemconfig {{/mp1_tb/dut/datapath/REGFILE/data[0]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[1]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[2]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[3]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[4]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[5]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[6]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[7]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[8]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[9]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[10]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[11]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[12]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[13]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[14]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[15]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[16]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[17]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[18]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[19]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[20]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[21]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[22]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[23]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[24]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[25]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[26]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[27]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[28]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[29]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[30]} {-radix hexadecimal} {/mp1_tb/dut/datapath/REGFILE/data[31]} {-radix hexadecimal}} /mp1_tb/dut/datapath/REGFILE/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {76393 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 191
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {511672 ps}
