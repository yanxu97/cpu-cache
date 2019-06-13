transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/address_selector.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/array.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/pc_reg.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/rv32i_types.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/register.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/regfile.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/mux2.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/mux4.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/pc_plus4.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/mux8.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/cache_control.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/modifier.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/hitcomparator.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/datamux.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/read_byte_enable.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/ir.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/alu.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/cmp.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/load_byte_mask.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/cpu_control.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/cache_datapath.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/cpu_datapath.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/cache.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/cpu.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/mp2.sv}

vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/mp2_tb.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp2 {/home/yanxu2/ece411/mp2/physical_memory.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiii_ver -L rtl_work -L work -voptargs="+acc"  mp2_tb

add wave *
view structure
view signals
run 500 ns
