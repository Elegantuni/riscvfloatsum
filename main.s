.data
output:
	.ascii "The sum of %lf and %lf is %lf\n\0"
input:
	.ascii "Enter a number: \0"
inputspec:
	.ascii "%lf\0"

.text
.globl main
main:
	addi sp, sp, -64

	la a0, input
	call printf

	la a0, inputspec
	addi a1, sp, 8
	call scanf

	la a0, input
	call printf

	la a0, inputspec
	addi a1, sp, 16
	call scanf

	fld fa0, 8(sp)
	fld fa1, 16(sp)

	fadd.d fa2, fa0, fa1

	la a0, output
	fmv.x.d a1, fa0
	fmv.x.d a2, fa1
	fmv.x.d a3, fa2
	call printf

	add sp, sp, 64

	li a0, 0
	call exit
