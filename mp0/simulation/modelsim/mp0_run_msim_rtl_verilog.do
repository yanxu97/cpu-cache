transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/pc_reg.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/rv32i_types.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/register.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/regfile.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/mux2.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/mux4.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/pc_plus4.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/ir.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/control.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/alu.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/cmp.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/datapath.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/mp0.sv}

vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/magic_memory.sv}
vlog -sv -work work +incdir+/home/yanxu2/ece411/mp0 {/home/yanxu2/ece411/mp0/mp0_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiii_ver -L rtl_work -L work -voptargs="+acc"  mp0_tb

add wave *
view structure
view signals
run 500 ns
