	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	xor	eax, eax
	or	rcx, -1
	mov	rdx, rdi
	xor	r8d, r8d
	repnz scasb
	xor	eax, eax
	not	rcx
	lea	esi, -1[rcx]
.L2:
	cmp	esi, eax
	jle	.L6
	movsx	ecx, BYTE PTR [rdx+rax]
	lea	edi, -49[rcx]
	cmp	dil, 8
	ja	.L3
	lea	r8d, -48[r8+rcx]
.L3:
	inc	rax
	jmp	.L2
.L6:
	mov	eax, r8d
	ret
	.size	task, .-task
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Random string: %s"
	.text
	.globl	task_random
	.type	task_random, @function
task_random:
	push	r13
	push	r12
	mov	r12d, 93
	push	rbp
	mov	ebp, edi
	push	rbx
	xor	ebx, ebx
	sub	rsp, 280
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 264[rsp], rax
	xor	eax, eax
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
.L8:
	cmp	ebp, ebx
	lea	r13, 8[rsp]
	jle	.L12
	call	rand@PLT
	cdq
	idiv	r12d
	add	edx, 33
	mov	BYTE PTR 8[rsp+rbx], dl
	inc	rbx
	jmp	.L8
.L12:
	mov	rdx, r13
	lea	rsi, .LC0[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	rdi, r13
	call	task
	mov	rcx, QWORD PTR 264[rsp]
	xor	rcx, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	add	rsp, 280
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
	.size	task_random, .-task_random
	.section	.rodata.str1.1
.LC1:
	.string	"Your string (maximum 256 characters):"
	.text
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
	lea	rbp, 8[rsp]
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	fflush@PLT
	call	getchar@PLT
	mov	rdx, QWORD PTR stdin[rip]
	mov	esi, 256
	mov	rdi, rbp
	call	fgets@PLT
	mov	rdi, rbp
	call	task
	mov	rcx, QWORD PTR 264[rsp]
	xor	rcx, QWORD PTR fs:40
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	add	rsp, 272
	pop	rbp
	ret
	.size	task_cmd, .-task_cmd
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
