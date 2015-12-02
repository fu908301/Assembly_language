TEX:
	.text
	.align 2
	.global main
main:
	stmfd sp!, {r0,r1,fp,lr}
	ldr r5,[r1,#4]
loop:	ldrb r0,[r5],#1
	cmp r0,#' '
	cmpne r0,#'1'
	cmpne r0,#'2'
	cmpne r0,#'3'
	cmpne r0,#'4'
	cmpne r0,#'5'
	cmpne r0,#'6'
	cmpne r0,#'7'
	cmpne r0,#'8'
	cmpne r0,#'9'
	cmpne r0,#'0'
	blne putchar
	cmp r0,#0
	bne loop
	ldmfd sp!, {r0,r1,fp,lr}
	bx lr
