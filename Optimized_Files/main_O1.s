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
	.text
	.globl	main
	.type	main, @function
main:
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 288
	mov	rbp, rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 280[rsp], rax
	xor	eax, eax
	cmp	edi, 2
	je	.L14
	cmp	edi, 3
	je	.L15
	lea	rsi, .LC7[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	DWORD PTR 8[rsp], 0
	lea	rsi, 8[rsp]
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 8[rsp], 1
	je	.L16
	mov	eax, 0
	call	task_cmd@PLT
	mov	edx, eax
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 280[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L17
	mov	eax, 0
	add	rsp, 288
	pop	rbx
	pop	rbp
	pop	r12
	ret
.L14:
	call	clock@PLT
	mov	r12, rax
	mov	rdx, QWORD PTR 8[rbp]
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	ebx, 200000000
.L3:
	mov	rdi, QWORD PTR 8[rbp]
	call	task@PLT
	sub	ebx, 1
	jne	.L3
	call	clock@PLT
	mov	rdi, rax
	mov	rsi, r12
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	mov	ecx, 1000
	cdq
	idiv	ecx
	mov	edx, eax
	lea	rsi, .LC1[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR 8[rbp]
	call	task@PLT
	mov	edx, eax
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L4
.L15:
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC3[rip]
	call	fopen@PLT
	mov	rbx, rax
	test	rax, rax
	je	.L18
	lea	r12, 16[rsp]
	mov	rdx, rax
	mov	esi, 256
	mov	rdi, r12
	call	fgets@PLT
	mov	rdi, rbx
	call	fclose@PLT
	mov	rdi, QWORD PTR 16[rbp]
	lea	rsi, .LC5[rip]
	call	fopen@PLT
	mov	rbx, rax
	mov	rdi, r12
	call	task@PLT
	mov	ecx, eax
	lea	rdx, .LC6[rip]
	mov	esi, 1
	mov	rdi, rbx
	mov	eax, 0
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L4
.L18:
	lea	rsi, .LC4[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L4
.L16:
	mov	DWORD PTR 12[rsp], 0
	mov	edx, 256
	lea	rsi, .LC9[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rsi, 12[rsp]
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	edx, DWORD PTR 12[rsp]
	lea	eax, -1[rdx]
	cmp	eax, 255
	jbe	.L9
	lea	rsi, .LC10[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L4
.L9:
	mov	edi, edx
	call	task_random@PLT
	mov	edx, eax
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L4
.L17:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
