onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mp2_tb/clk
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_resp
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_read
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_write
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_address
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_wdata
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_rdata
add wave -noupdate -radix hexadecimal /mp2_tb/write_data
add wave -noupdate -radix hexadecimal /mp2_tb/write_address
add wave -noupdate -radix hexadecimal /mp2_tb/write
add wave -noupdate -radix hexadecimal /mp2_tb/halt
add wave -noupdate -radix hexadecimal /mp2_tb/clk
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_resp
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_read
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_write
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_address
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_wdata
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_rdata
add wave -noupdate -radix hexadecimal /mp2_tb/write_data
add wave -noupdate -radix hexadecimal /mp2_tb/write_address
add wave -noupdate -radix hexadecimal /mp2_tb/write
add wave -noupdate -radix hexadecimal /mp2_tb/halt
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cpu/control/state
add wave -noupdate -radix hexadecimal -childformat {{{/mp2_tb/registers[0]} -radix hexadecimal} {{/mp2_tb/registers[1]} -radix hexadecimal} {{/mp2_tb/registers[2]} -radix hexadecimal} {{/mp2_tb/registers[3]} -radix hexadecimal} {{/mp2_tb/registers[4]} -radix hexadecimal} {{/mp2_tb/registers[5]} -radix hexadecimal} {{/mp2_tb/registers[6]} -radix hexadecimal} {{/mp2_tb/registers[7]} -radix hexadecimal} {{/mp2_tb/registers[8]} -radix hexadecimal} {{/mp2_tb/registers[9]} -radix hexadecimal} {{/mp2_tb/registers[10]} -radix hexadecimal} {{/mp2_tb/registers[11]} -radix hexadecimal} {{/mp2_tb/registers[12]} -radix hexadecimal} {{/mp2_tb/registers[13]} -radix hexadecimal} {{/mp2_tb/registers[14]} -radix hexadecimal} {{/mp2_tb/registers[15]} -radix hexadecimal} {{/mp2_tb/registers[16]} -radix hexadecimal} {{/mp2_tb/registers[17]} -radix hexadecimal} {{/mp2_tb/registers[18]} -radix hexadecimal} {{/mp2_tb/registers[19]} -radix hexadecimal} {{/mp2_tb/registers[20]} -radix hexadecimal} {{/mp2_tb/registers[21]} -radix hexadecimal} {{/mp2_tb/registers[22]} -radix hexadecimal} {{/mp2_tb/registers[23]} -radix hexadecimal} {{/mp2_tb/registers[24]} -radix hexadecimal} {{/mp2_tb/registers[25]} -radix hexadecimal} {{/mp2_tb/registers[26]} -radix hexadecimal} {{/mp2_tb/registers[27]} -radix hexadecimal} {{/mp2_tb/registers[28]} -radix hexadecimal} {{/mp2_tb/registers[29]} -radix hexadecimal} {{/mp2_tb/registers[30]} -radix hexadecimal} {{/mp2_tb/registers[31]} -radix hexadecimal}} -subitemconfig {{/mp2_tb/registers[0]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[1]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[2]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[3]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[4]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[5]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[6]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[7]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[8]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[9]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[10]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[11]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[12]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[13]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[14]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[15]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[16]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[17]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[18]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[19]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[20]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[21]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[22]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[23]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[24]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[25]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[26]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[27]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[28]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[29]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[30]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[31]} {-height 16 -radix hexadecimal}} /mp2_tb/registers
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_write
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_address
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_read
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_wdata
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_byte_enable
add wave -noupdate /mp2_tb/dut/cache/datapath/dirty_bit_array_left/data
add wave -noupdate /mp2_tb/dut/cache/datapath/dirty_bit_array_right/data
add wave -noupdate /mp2_tb/dut/cache/datapath/lru/data
add wave -noupdate -radix hexadecimal /mp2_tb/clk
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_resp
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_read
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_write
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_address
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_wdata
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_rdata
add wave -noupdate -radix hexadecimal /mp2_tb/write_data
add wave -noupdate -radix hexadecimal /mp2_tb/write_address
add wave -noupdate -radix hexadecimal /mp2_tb/write
add wave -noupdate -radix hexadecimal /mp2_tb/halt
add wave -noupdate -radix hexadecimal /mp2_tb/clk
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_resp
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_read
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_write
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_address
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_wdata
add wave -noupdate -radix hexadecimal /mp2_tb/pmem_rdata
add wave -noupdate -radix hexadecimal /mp2_tb/write_data
add wave -noupdate -radix hexadecimal /mp2_tb/write_address
add wave -noupdate -radix hexadecimal /mp2_tb/write
add wave -noupdate -radix hexadecimal /mp2_tb/halt
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cpu/control/state
add wave -noupdate -radix hexadecimal -childformat {{{/mp2_tb/registers[0]} -radix hexadecimal} {{/mp2_tb/registers[1]} -radix hexadecimal} {{/mp2_tb/registers[2]} -radix hexadecimal} {{/mp2_tb/registers[3]} -radix hexadecimal} {{/mp2_tb/registers[4]} -radix hexadecimal} {{/mp2_tb/registers[5]} -radix hexadecimal} {{/mp2_tb/registers[6]} -radix hexadecimal} {{/mp2_tb/registers[7]} -radix hexadecimal} {{/mp2_tb/registers[8]} -radix hexadecimal} {{/mp2_tb/registers[9]} -radix hexadecimal} {{/mp2_tb/registers[10]} -radix hexadecimal} {{/mp2_tb/registers[11]} -radix hexadecimal} {{/mp2_tb/registers[12]} -radix hexadecimal} {{/mp2_tb/registers[13]} -radix hexadecimal} {{/mp2_tb/registers[14]} -radix hexadecimal} {{/mp2_tb/registers[15]} -radix hexadecimal} {{/mp2_tb/registers[16]} -radix hexadecimal} {{/mp2_tb/registers[17]} -radix hexadecimal} {{/mp2_tb/registers[18]} -radix hexadecimal} {{/mp2_tb/registers[19]} -radix hexadecimal} {{/mp2_tb/registers[20]} -radix hexadecimal} {{/mp2_tb/registers[21]} -radix hexadecimal} {{/mp2_tb/registers[22]} -radix hexadecimal} {{/mp2_tb/registers[23]} -radix hexadecimal} {{/mp2_tb/registers[24]} -radix hexadecimal} {{/mp2_tb/registers[25]} -radix hexadecimal} {{/mp2_tb/registers[26]} -radix hexadecimal} {{/mp2_tb/registers[27]} -radix hexadecimal} {{/mp2_tb/registers[28]} -radix hexadecimal} {{/mp2_tb/registers[29]} -radix hexadecimal} {{/mp2_tb/registers[30]} -radix hexadecimal} {{/mp2_tb/registers[31]} -radix hexadecimal}} -subitemconfig {{/mp2_tb/registers[0]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[1]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[2]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[3]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[4]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[5]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[6]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[7]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[8]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[9]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[10]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[11]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[12]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[13]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[14]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[15]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[16]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[17]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[18]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[19]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[20]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[21]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[22]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[23]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[24]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[25]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[26]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[27]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[28]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[29]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[30]} {-height 16 -radix hexadecimal} {/mp2_tb/registers[31]} {-height 16 -radix hexadecimal}} /mp2_tb/registers
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_write
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_address
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_read
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_wdata
add wave -noupdate -radix hexadecimal /mp2_tb/dut/cache/mem_byte_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 345
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2500120 ps}
