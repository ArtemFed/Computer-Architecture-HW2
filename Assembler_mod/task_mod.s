	.file	"task.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Your string:"
.LC1:
	.string	"%s"
	.text
	.globl	task_cmd
	.type	task_cmd, @function
task_cmd:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 112
	mov	DWORD PTR -4[rbp], 0			# -4 = sum
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -112[rbp]		# string[100]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	# mov	DWORD PTR -8[rbp], 0		# i в for
	mov	r12d, 0		# i в for
	jmp	.L2
.L4:
	mov	eax, r12d
	movzx	eax, BYTE PTR -112[rbp+rax]
	cmp	al, 48
	jle	.L3
	mov	eax, r12d
	movzx	eax, BYTE PTR -112[rbp+rax]
	cmp	al, 57
	jg	.L3
	mov	eax, r12d
	movzx	eax, BYTE PTR -112[rbp+rax]
	movsx	eax, al
	sub	eax, 48
	add	DWORD PTR -4[rbp], eax
.L3:
	add	r12d, 1
.L2:
	mov	eax, r12d
	movzx	eax, BYTE PTR -112[rbp+rax]
	test	al, al
	jne	.L4
	mov	eax, DWORD PTR -4[rbp]
	leave
	ret
	.size	task_cmd, .-task_cmd
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
