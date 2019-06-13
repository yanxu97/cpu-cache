riscv_mp0test.s:
.align 4
.section .text
.globl _start
    # Refer to the RISC-V ISA Spec for the functionality of
    # the instructions in this test program.
_start:
    # Note that the comments in this file should not be taken as
    # an example of good commenting style!!  They are merely provided
    # in an effort to help you understand the assembly style.
	
    # x9 will contain the number of succeeded test cases at the end
    add  x9, x0, x0
	
    # Initializing the registers for testing the reg-reg instrs
    lw   x1, LVAL1
    lw   x2, LVAL2
    lw   x3, LVAL3
	lw	 x4, LVAL4

	# Test case 1 for xor
	xor 	x5, x1, x1
	bne 	x5, x0, badend
    addi 	x9, x9, 1
	# Test case 2 for xor
	xor 	x5, x1, x0
	bne 	x5, x1, badend
    addi 	x9, x9, 1
	# Test case 3 for xor
	xor 	x5, x2, x1
	bne		x5, x4, badend
	addi 	x9, x9, 1

	# Test case 1 for and, conditional jumping
	and 	x5, x0, x1
	bne		x5, x0, badend
	blt		x5, x0, badend
	bltu	x5, x0, badend
	bge		x5, x0, badend
	bgeu	x5, x0, badend
	beq		x5, x0, here
	
	# Test cases for load and store 
	lb		x5, LVAL4B1
	lh		x5, LVAL4B2
	la		x6, SVAL1
	sw		x5, 0(x6)


here:
	addi 	x9, x9, 1

	# Test case 1 for sub
    sub  	x5, x2, x1
  	blt		x5, x2, badend		
  	beq		x5, x2, badend
	addi 	x9, x9, 1
	# Test case 2 for sub
	sub 	x5, x3, x2
	blt		x5, x2, badend
	beq 	x5, x2, badend
	addi 	x9, x9, 1

	
goodend:
    jal  x0, goodend

badend:
    jal  x0, badend

.section .rodata

LVAL1:	    .word 0xffffffff
LVAL2:	    .word 0x0000ffff
LVAL3:	    .word 0x7fffffff
LVAL4:		.word 0xffff0000
LVAL4B1:    .byte 0x78
LVAL4B2:    .byte 0x56
LVAL4B3:    .byte 0x34
LVAL4B4:    .byte 0x12
LVAL5B1:    .byte 0x98
LVAL5B2:    .byte 0xba
LVAL5B3:    .byte 0xdc
LVAL5B4:    .byte 0xfe
SVAL1B1:    .byte 0x00
SVAL1B2:    .byte 0x00
SVAL1B3:    .byte 0x00
SVAL1B4:    .byte 0x00
SVAL2B1:    .byte 0x00
SVAL2B2:    .byte 0x00
SVAL2B3:    .byte 0x00
SVAL2B4:    .byte 0x00
SRAOUT:	    .word 0x007fffff
