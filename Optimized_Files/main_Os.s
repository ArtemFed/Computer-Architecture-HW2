	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"String: %s\n"
.LC1:
	.string	"Time: %d ms"
.LC2:
	.string	"\nResult: %d\n"
.LC3:
	.string	"r"
.LC4:
	.string	"Error opening file. Press any key to continue"
.LC5:
	.string	"w"
.LC6:
	.string	"%d "
.LC7:
	.string	"Random input or Direct (ans: 1, !=1):"
.LC8:
	.string	"%d"
.LC9:
	.string	"Input length (0 < length <= %d):"
.LC10:
	.string	"Incorrect length = %d\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	push	r12
	push	rbp
	push	rbx
	mov	rbx, rsi
	sub	rsp, 272
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 264[rsp], rax
	xor	eax, eax
	cmp	edi, 2
	jne	.L2
	call	clock@PLT
	mov	rdx, QWORD PTR 8[rbx]
	mov	edi, 1
	lea	rsi, .LC0[rip]
	mov	rbp, rax
	xor	eax, eax
	mov	r12d, 200000000
	call	__printf_chk@PLT
.L3:
	mov	rdi, QWORD PTR 8[rbx]
	call	task@PLT
	dec	r12d
	jne	.L3
	call	clock@PLT
	mov	rsi, rbp
	mov	rdi, rax
	call	difftime@PLT
	mov	ecx, 1000
	mov	edi, 1
	lea	rsi, .LC1[rip]
	cvttsd2si	eax, xmm0
	cdq
	idiv	ecx
	mov	edx, eax
	xor	eax, eax
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR 8[rbx]
	call	task@PLT
	jmp	.L15
.L2:
	cmp	edi, 3
	jne	.L5
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC3[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	jne	.L6
	lea	rsi, .LC4[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	call	getchar@PLT
	jmp	.L4
.L6:
	lea	r12, 8[rsp]
	mov	rdx, rax
	mov	esi, 256
	mov	rdi, r12
	call	fgets@PLT
	mov	rdi, rbp
	call	fclose@PLT
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC5[rip]
	call	fopen@PLT
	mov	rdi, r12
	mov	rbp, rax
	call	task@PLT
	mov	rdi, rbp
	mov	esi, 1
	lea	rdx, .LC6[rip]
	mov	ecx, eax
	xor	eax, eax
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L4
.L5:
	lea	rsi, .LC7[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	xor	eax, eax
	mov	rsi, rsp
	lea	rdi, .LC8[rip]
	mov	DWORD PTR [rsp], 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR [rsp], 1
	jne	.L8
	mov	edx, 256
	lea	rsi, .LC9[rip]
	mov	edi, 1
	xor	eax, eax
	mov	DWORD PTR 4[rsp], 0
	call	__printf_chk@PLT
	lea	rsi, 4[rsp]
	lea	rdi, .LC8[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	mov	edx, DWORD PTR 4[rsp]
	lea	rsi, .LC10[rip]
	lea	eax, -1[rdx]
	cmp	eax, 255
	ja	.L14
	mov	edi, edx
	call	task_random@PLT
	jmp	.L15
.L8:
	xor	eax, eax
	call	task_cmd@PLT
.L15:
	mov	edx, eax
	lea	rsi, .LC2[rip]
.L14:
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 264[rsp]
	xor	rax, QWORD PTR fs:40
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	add	rsp, 272
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
