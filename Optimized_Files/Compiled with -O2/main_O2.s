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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Error opening file. Press any key to continue"
	.section	.rodata.str1.1
.LC5:
	.string	"w"
.LC6:
	.string	"%d "
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Random input or Direct (ans: 1, !=1):"
	.section	.rodata.str1.1
.LC8:
	.string	"%d"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Input length (0 < length <= %d):"
	.section	.rodata.str1.1
.LC10:
	.string	"Incorrect length = %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	r13
	push	r12
	push	rbp
	mov	rbp, rsi
	push	rbx
	sub	rsp, 296
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 280[rsp], rax
	xor	eax, eax
	cmp	edi, 2
	je	.L16
	cmp	edi, 3
	je	.L17
	lea	rsi, .LC7[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 8[rsp]
	lea	rdi, .LC8[rip]
	mov	DWORD PTR 8[rsp], 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 8[rsp], 1
	je	.L18
	xor	eax, eax
	call	task_cmd@PLT
.L14:
	mov	edx, eax
	lea	rsi, .LC2[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 280[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L19
	add	rsp, 296
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
.L17:
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC3[rip]
	call	fopen@PLT
	mov	r12, rax
	test	rax, rax
	je	.L20
	lea	r13, 16[rsp]
	mov	rdx, rax
	mov	esi, 256
	mov	rdi, r13
	call	fgets@PLT
	mov	rdi, r12
	call	fclose@PLT
	mov	rdi, QWORD PTR 16[rbp]
	lea	rsi, .LC5[rip]
	call	fopen@PLT
	mov	rdi, r13
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
.L18:
	mov	edx, 256
	lea	rsi, .LC9[rip]
	mov	edi, 1
	xor	eax, eax
	mov	DWORD PTR 12[rsp], 0
	call	__printf_chk@PLT
	lea	rsi, 12[rsp]
	lea	rdi, .LC8[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	mov	edx, DWORD PTR 12[rsp]
	lea	eax, -1[rdx]
	cmp	eax, 255
	jbe	.L9
	lea	rsi, .LC10[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	jmp	.L4
.L16:
	call	clock@PLT
	mov	rdx, QWORD PTR 8[rbp]
	mov	edi, 1
	lea	rsi, .LC0[rip]
	mov	r12, rax
	xor	eax, eax
	mov	ebx, 200000000
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rdi, QWORD PTR 8[rbp]
	call	task@PLT
	sub	ebx, 1
	jne	.L3
	call	clock@PLT
	mov	rsi, r12
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
	mov	rdi, QWORD PTR 8[rbp]
	call	task@PLT
	jmp	.L14
.L9:
	mov	edi, edx
	call	task_random@PLT
	jmp	.L14
.L20:
	lea	rsi, .LC4[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L4
.L19:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
