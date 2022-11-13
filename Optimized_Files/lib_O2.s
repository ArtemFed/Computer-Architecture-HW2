	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	task
	.type	task, @function
task:
	push	rbx
	mov	rbx, rdi
	call	strlen@PLT
	test	eax, eax
	jle	.L5
	sub	eax, 1
	mov	rdi, rbx
	xor	r8d, r8d
	lea	rcx, 1[rbx+rax]
	.p2align 4,,10
	.p2align 3
.L4:
	movsx	eax, BYTE PTR [rdi]
	lea	edx, -49[rax]
	cmp	dl, 8
	ja	.L3
	lea	r8d, -48[r8+rax]
.L3:
	add	rdi, 1
	cmp	rdi, rcx
	jne	.L4
	mov	eax, r8d
	pop	rbx
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	xor	r8d, r8d
	pop	rbx
	mov	eax, r8d
	ret
	.size	task, .-task
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Random string: %s"
	.text
	.p2align 4
	.globl	task_random
	.type	task_random, @function
task_random:
	push	r12
	push	rbp
	push	rbx
	mov	ebx, edi
	sub	rsp, 272
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 264[rsp], rax
	xor	eax, eax
	mov	rbp, rsp
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	test	ebx, ebx
	jle	.L10
	lea	eax, -1[rbx]
	mov	r12, rbp
	lea	rbx, 1[rsp+rax]
	.p2align 4,,10
	.p2align 3
.L11:
	call	rand@PLT
	add	r12, 1
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, 738919105
	sar	ecx, 31
	sar	rdx, 36
	sub	edx, ecx
	imul	edx, edx, 93
	sub	eax, edx
	add	eax, 33
	mov	BYTE PTR -1[r12], al
	cmp	r12, rbx
	jne	.L11
.L10:
	lea	rsi, .LC0[rip]
	mov	rdx, rbp
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	rdi, rbp
	call	task
	mov	rsi, QWORD PTR 264[rsp]
	xor	rsi, QWORD PTR fs:40
	jne	.L17
	add	rsp, 272
	pop	rbx
	pop	rbp
	pop	r12
	ret
.L17:
	call	__stack_chk_fail@PLT
	.size	task_random, .-task_random
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Your string (maximum 256 characters):"
	.text
	.p2align 4
	.globl	task_cmd
	.type	task_cmd, @function
task_cmd:
	push	rbp
	lea	rsi, .LC1[rip]
	mov	edi, 1
	sub	rsp, 272
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 264[rsp], rax
	xor	eax, eax
	mov	rbp, rsp
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	fflush@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	mov	rdx, QWORD PTR stdin[rip]
	mov	esi, 256
	mov	rdi, rbp
	call	fgets@PLT
	mov	rdi, rbp
	call	task
	mov	rcx, QWORD PTR 264[rsp]
	xor	rcx, QWORD PTR fs:40
	jne	.L21
	add	rsp, 272
	pop	rbp
	ret
.L21:
	call	__stack_chk_fail@PLT
	.size	task_cmd, .-task_cmd
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
