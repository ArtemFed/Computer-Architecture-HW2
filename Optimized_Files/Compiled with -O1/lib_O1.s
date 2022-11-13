	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	mov	rdx, rdi
	mov	rcx, -1
	mov	eax, 0
	repnz scasb
	not	rcx
	sub	rcx, 1
	test	ecx, ecx
	jle	.L5
	mov	rax, rdx
	lea	ecx, -1[rcx]
	lea	rdi, 1[rdx+rcx]
	mov	esi, 0
	jmp	.L4
.L3:
	add	rax, 1
	cmp	rax, rdi
	je	.L1
.L4:
	movzx	edx, BYTE PTR [rax]
	lea	ecx, -49[rdx]
	cmp	cl, 8
	ja	.L3
	movsx	edx, dl
	lea	esi, -48[rsi+rdx]
	jmp	.L3
.L5:
	mov	esi, 0
.L1:
	mov	eax, esi
	ret
	.size	task, .-task
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Random string: %s"
	.text
	.globl	task_random
	.type	task_random, @function
task_random:
	push	rbp
	push	rbx
	sub	rsp, 280
	mov	ebp, edi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 264[rsp], rax
	xor	eax, eax
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	test	ebp, ebp
	jle	.L8
	mov	rbx, rsp
	lea	eax, -1[rbp]
	lea	rbp, 1[rsp+rax]
.L9:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 738919105
	sar	rdx, 36
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	edx, edx, 93
	sub	eax, edx
	add	eax, 33
	mov	BYTE PTR [rbx], al
	add	rbx, 1
	cmp	rbx, rbp
	jne	.L9
.L8:
	mov	rbx, rsp
	mov	rdx, rbx
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	rdi, rbx
	call	task
	mov	rsi, QWORD PTR 264[rsp]
	xor	rsi, QWORD PTR fs:40
	jne	.L13
	add	rsp, 280
	pop	rbx
	pop	rbp
	ret
.L13:
	call	__stack_chk_fail@PLT
	.size	task_random, .-task_random
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Your string (maximum 256 characters):"
	.text
	.globl	task_cmd
	.type	task_cmd, @function
task_cmd:
	push	rbp
	push	rbx
	sub	rsp, 280
	mov	ebx, 40
	mov	rax, QWORD PTR fs:[rbx]
	mov	QWORD PTR 264[rsp], rax
	xor	eax, eax
	lea	rsi, .LC1[rip]
	mov	edi, 1
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	fflush@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	mov	rbp, rsp
	mov	rdx, QWORD PTR stdin[rip]
	mov	esi, 256
	mov	rdi, rbp
	call	fgets@PLT
	mov	rdi, rbp
	call	task
	mov	rcx, QWORD PTR 264[rsp]
	xor	rcx, QWORD PTR fs:[rbx]
	jne	.L17
	add	rsp, 280
	pop	rbx
	pop	rbp
	ret
.L17:
	call	__stack_chk_fail@PLT
	.size	task_cmd, .-task_cmd
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
