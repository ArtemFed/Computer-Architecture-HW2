	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"String: %s\n"
.LC1:
	.string	"Time: %d ms"
.LC2:
	.string	"\nResult: %d\n"
.LC3:
	.string	"r"
	.align 8
.LC4:
	.string	"Error opening file. Press any key to continue"
.LC5:
	.string	"w"
.LC6:
	.string	"%d "
	.align 8
.LC7:
	.string	"Random input or Direct (ans: 1, !=1):"
.LC8:
	.string	"%d"
	.align 8
.LC9:
	.string	"Input length (0 < length <= %d):"
.LC10:
	.string	"Incorrect length = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 336
	mov	DWORD PTR -324[rbp], edi
	mov	QWORD PTR -336[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -324[rbp], 2
	jne	.L2
	call	clock@PLT
	mov	QWORD PTR -288[rbp], rax
	mov	rax, QWORD PTR -336[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -308[rbp], 0
	jmp	.L3
.L4:
	mov	rax, QWORD PTR -336[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	task@PLT
	add	DWORD PTR -308[rbp], 1
.L3:
	cmp	DWORD PTR -308[rbp], 200000000
	jle	.L4
	call	clock@PLT
	mov	QWORD PTR -280[rbp], rax
	mov	rdx, QWORD PTR -288[rbp]
	mov	rax, QWORD PTR -280[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -336[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	task@PLT
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L13
.L2:
	cmp	DWORD PTR -324[rbp], 3
	jne	.L6
	mov	rax, QWORD PTR -336[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -304[rbp], rax
	cmp	QWORD PTR -304[rbp], 0
	jne	.L7
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	call	getchar@PLT
	mov	eax, 0
	jmp	.L13
.L7:
	mov	rdx, QWORD PTR -304[rbp]
	lea	rax, -272[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
	mov	rax, QWORD PTR -304[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -336[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -296[rbp], rax
	lea	rax, -272[rbp]
	mov	rdi, rax
	call	task@PLT
	mov	edx, eax
	mov	rax, QWORD PTR -296[rbp]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -296[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	jmp	.L13
.L6:
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -316[rbp], 0
	lea	rax, -316[rbp]
	mov	rsi, rax
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -316[rbp]
	cmp	eax, 1
	jne	.L9
	mov	DWORD PTR -312[rbp], 0
	mov	esi, 256
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -312[rbp]
	mov	rsi, rax
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -312[rbp]
	test	eax, eax
	jle	.L10
	mov	eax, DWORD PTR -312[rbp]
	cmp	eax, 256
	jle	.L11
.L10:
	mov	eax, DWORD PTR -312[rbp]
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L13
.L11:
	mov	eax, DWORD PTR -312[rbp]
	mov	edi, eax
	call	task_random@PLT
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L13
.L9:
	mov	eax, 0
	call	task_cmd@PLT
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L13:
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
