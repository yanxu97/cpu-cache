.align 4
.section .text
.globl _start
    
_start:
    
    
    la x1, line1
    la x2, line2
    la x3, line3
    nop
    nop
    
	lw x4, 0(x1)
    lw x5, 0(x2)
    lw x6, 0(x1)
    lw x7, 0(x3)
    lw x8, 0(x1)

    addi x5, x0, 111   
    sb x5, 0(x3)
    sb x5, 4(x3)
    sb x5, 8(x3)
    sb x5, 12(x3)
    sb x5, 16(x3)
    sb x5, 20(x3)
    sb x5, 24(x3)
    sb x5, 28(x3)
    addi x5, x0, 99
    sb x5, 1(x3)
    sb x5, 5(x3)
    sb x5, 9(x3)
    sb x5, 13(x3)
    sb x5, 17(x3)
    sb x5, 21(x3)
    sb x5, 25(x3)
    sb x5, 29(x3)
    
    addi x3, x0, 11
	sll x3, x3, 8
	add x3, x3, 66
    
    sh x3, 0(x4)
    sh x3, 2(x4)
    sh x3, 4(x4)
    sh x3, 6(x4)
    sh x3, 8(x4)
    sh x3, 10(x4)
    sh x3, 12(x4)
    sh x3, 14(x4)
    sh x3, 16(x4)
    sh x3, 18(x4)
    sh x3, 20(x4)
    sh x3, 22(x4)
    sh x3, 24(x4)
    sh x3, 26(x4)
    sh x3, 28(x4)
    sh x3, 30(x4)

inf:
    jal x0, inf


.section .rodata
.balign 256
.zero 96
line1:      .word 0x11111111
line11:     .word 0x00000000
line12:     .word 0x00000000
line13:     .word 0x00000000
line14:     .word 0x00000000
line15:     .word 0x00000000
line16:     .word 0x00000000
line17:     .word 0x00000000
line18:     .word 0x00000000
line19:     .word 0x00000000
line1a:     .word 0x00000000
line1b:     .word 0x00000000
line1c:     .word 0x00000000
line1d:     .word 0x00000000
line1e:     .word 0x00000000
line1f:     .word 0x00000000
.balign 256
.zero 96
line2:      .word 0x22222222
line21:     .word 0x00000000
line22:     .word 0x00000000
line23:     .word 0x00000000
line24:     .word 0x00000000
line25:     .word 0x00000000
line26:     .word 0x00000000
line27:     .word 0x00000000
line28:     .word 0x00000000
line29:     .word 0x00000000
line2a:     .word 0x00000000
line2b:     .word 0x00000000
line2c:     .word 0x00000000
line2d:     .word 0x00000000
line2e:     .word 0x00000000
line2f:     .word 0x00000000
.balign 256
.zero 96
line3:     	.word 0x33333333
line31:     .word 0x00000000
line32:     .word 0x00000000
line33:     .word 0x00000000
line34:     .word 0x00000000
line35:     .word 0x00000000
line36:     .word 0x00000000
line37:     .word 0x00000000
line38:     .word 0x00000000
line39:     .word 0x00000000
line3a:     .word 0x00000000
line3b:     .word 0x00000000
line3c:     .word 0x00000000
line3d:     .word 0x00000000
line3e:     .word 0x00000000
line3f:     .word 0x00000000

