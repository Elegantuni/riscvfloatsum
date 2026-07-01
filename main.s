
# float float_sum(float a, float b)
# a in fa0, b in fa1
# Returns: sum in fa0
.data
output: .ascii: "The sum of %lf and %lf is %lf.\0"
inputspec: .ascii "%lf\0"
.float: number1, 4
.float: number2, 4

.text
.globl main
main:

float_sum:
    # Add the single-precision floats in fa0 and fa1, store result in fa0

	la fa0, number1
	la fe1, number2
	
	fadd.s  fa0, fa0, fa1

	la x0, output
	la fa0, number1
	la fe1, number2
	call printf
	
    # Return to caller
    ret
	
