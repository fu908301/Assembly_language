	.text
	.align	2  
	.global	main
TEX0:
	.asciz "Add %d %d: %d.\n"
TEX1:
	.asciz "Sub %d %d :%d.\n"

main:
	stmfd sp!, {r0,r1,a3, a4, v2, v3, v4, v5, v6, v7,fp,lr}
	ldr v3, [a2, #8]!
	ldrb v5, [v3], #1
	sub v5, v5, #48
	mov a1, v5
	bl LOOP
	mov v5, a1
	
	ldr v3, [a2, #4]!
	ldrb v6, [v3], #1
	sub v6, v6, #48
	mov a1, v6
	bl LOOP
	mov v6, a1

	ldr r7, [r1,#4]!
	ldrb v3,[r7]
	sub v3,v3,#48
	cmp v3,#0
	beq F0
	cmp v3,#1
	beq F1
	cmp v3,#2
	beq F2
	cmp v3,#3
	beq F3
	cmp v3,#4
	beq F4
	cmp v3,#5
	beq F5
	cmp v3,#6
	beq F6
	cmp v3,#7
	beq F7
	cmp v3,#8

	beq F8
F0:
	mov r1, v5 
	mov r2, v6
	add r3, v5, v6
	ldr r0, =TEX0
	bl printf
	B EXIT
	
F1:
	mov r1, v5
	mov r2, v6
	sub r3 , v5, v6
	ldr r0, =TEX1
	bl printf
	B EXIT
F2:
	mov r1,v5
	mov v2 ,#0
	mov v3 ,#0
	mov a4 ,#31
REV:
	lsr r1 , r1, a4
	and r1 , r1, #1
	lsl r1 , r1, v3
	add v2 , v2, r1
	sub a4 , a4, #1
	add v3 , v3, #1
	mov r1,v5
	cmp a4 ,#0
	bge REV
	mov r2, v2
	mov r1, v5
	ldr r0,=TEX2
	bl printf
	B EXIT
F3:
	mov r1 ,v5
	mov r2 ,v6
	mov v2 ,#0
SUB:
	cmp v5, v6
	subge v5, v5, v6
	addge v2,v2,#1
	bge SUB
	mov r3, v2
	ldr r0,=TEX3
	bl printf
	B EXIT
F4:	
	mov r1, v5
	mov r2, v6
	cmp v5, v6
	movge r3, v5
	movle r3, v6
	ldr r0,=TEX4
	bl printf
	B EXIT
F5:
	mov r1, v5
	mov r2, v6
	cmp v5, v6
	movge r3, v6
	movle r3, v5
	ldr r0,=TEX5
	bl printf
	B EXIT
F6:
	mov r1, v5
	mov r2, v6
	cmp v5, v6
	movge v3, v5
	movge v4, v6
	movle v3, v6
	movle v4, v5 
SUBX:
	cmp v3, v4
	subge v3, v3, v4
	bge SUBX
	mov v2, v3
	mov v3, v4
	mov v4, v2
	cmp v4 ,#0
	bgt SUBX
	mov r3, v3
	ldr r0,=TEX6
	bl printf
	B EXIT
F7:
	mov r1, v5
	mov r2, v6
	mul r3, v5, v6
	ldr r0,=TEX7
	bl printf
	B EXIT
F8:
	mov r1, v5
	mov r2, v6
	cmp v5, v6
	movge v3, v5
	movge v4, v6
	movle v3, v6
	movle v4, v5 
SUBY:
	cmp v3, v4
	subge v3, v3, v4
	bge SUBY
	mov v2, v3
	mov v3, v4
	mov v4, v2
	cmp v4 ,#0
	bgt SUBY
	mul v2, v5, v6
	cmp v2,#0
	movlt v1,v2
	movlt v7,#-1
	mullt v2, v1, v7
	mov v7,#0
SUBZ:
	cmp v2, v3
	subge v2, v2, v3
	addge v7,v7,#1
	bge SUBZ
	mov r3, v7
	ldr r0,=TEX8
	bl printf
	B EXIT
EXIT:
	ldmfd sp!,{r0,r1,a3, a4, v2, v3, v4, v5, v6, v7,fp,lr}
	bx lr
LOOP:	
	ldrb v7, [v3], #1
	cmp  v7, #0
	subne v7, v7 ,#48
	movne v2, #10
	mulne a1, v2, a1
	addne a1, a1, v7
	bne LOOP
	mov pc, lr
TEX2:
	.asciz "Rev %d : %d.\n"
TEX3:
	.asciz "Div %d %d : %d\n"
TEX4:
	.asciz "Max %d %d : %d\n"
TEX5:
	.asciz "Min %d %d : %d\n"
TEX6:
	.asciz "GCD %d %d : %d\n"
TEX7:
	.asciz "Mul %d %d : %d\n"
TEX8:
	.asciz "LCM %d %d : %d\n"

