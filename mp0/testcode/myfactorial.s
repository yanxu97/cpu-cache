myfactorial.s:
.align 4
.section .text
.globl _start
    # Refer to the RISC-V ISA Spec for the functionality of
    # the instructions in this test program.
_start:
    # Note that the comments in this file should not be taken as
    # an example of good commenting style!!  They are merely provided
    # in an effort to help you understand the assembly style.

    # Note that one/two/eight are data labels
    lw x1, start 	# X1 <- 0x05
	lw x2, start	# store times
    lw x3, clear	# clear x3 store final result
	lw x4, clear	# check point
	addi x4, x4, 1
	lw x5, start	# temp times
	addi x5, x5, -1 # the temp should start at (factorial number - 1)
	
	
loop1:
					# the result in the corresponding register through each iteration
	add x3, x3, x1  # 5 10 15 20       40 60       120
	addi x2, x2, -1 # 4 3  2  1		   2  1 	   1
    bne x2, x4, loop1
	
	addi x5, x5, -1 # 3    2        1
	addi x2, x5, 0	# 3    2    	1
	addi x1, x3, 0  # 20  60		120
	bne x5, x4, loop1
	
	

halt:                 # Infinite loop to keep the processor
    beq x0, x0, halt  # from trying to execute the data below.
                      # Your own programs should also make use
                      # of an infinite loop at the end.

deadend:
    lw x8, bad     # X8 <= 0xdeadbeef
deadloop:
    beq x8, x8, deadloop

.section .data

bad:        .word 0xdeadbeef
start:  	.word 0x00000008
clear:		.word 0x00000000



