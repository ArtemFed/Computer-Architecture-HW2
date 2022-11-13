	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -12[rbp], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	DWORD PTR -4[rbp], eax
	mov	BYTE PTR -13[rbp], 32
	mov	DWORD PTR -8[rbp], 0
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -13[rbp], al
	cmp	BYTE PTR -13[rbp], 48
	jle	.L3
	cmp	BYTE PTR -13[rbp], 57
	jg	.L3
	movsx	eax, BYTE PTR -13[rbp]
	sub	eax, 48
	add	DWORD PTR -12[rbp], eax
.L3:
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jl	.L4
	mov	eax, DWORD PTR -12[rbp]
	leave
	ret
	.size	task, .-task
	.section	.rodata
.LC0:
	.string	"Random string: %s"
	.text
	.globl	task_random
	.type	task_random, @function
task_random:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 304
	mov	DWORD PTR -292[rbp], edi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	call	clock@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -276[rbp], 0
	jmp	.L7
.L8:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 738919105
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 4
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 93
	sub	eax, edx
	mov	edx, eax
	mov	eax, edx
	add	eax, 33
	mov	edx, eax
	mov	eax, DWORD PTR -276[rbp]
	cdqe
	mov	BYTE PTR -272[rbp+rax], dl
	add	DWORD PTR -276[rbp], 1
.L7:
	mov	eax, DWORD PTR -276[rbp]
	cmp	eax, DWORD PTR -292[rbp]
	jl	.L8
	lea	rax, -272[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -272[rbp]
	mov	rdi, rax
	call	task
	mov	rsi, QWORD PTR -8[rbp]
	xor	rsi, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	ret
	.size	task_random, .-task_random
	.section	.rodata
	.align 8
.LC1:
	.string	"Your string (maximum 256 characters):"
	.text
	.globl	task_cmd
	.type	task_cmd, @function
task_cmd:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 272
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fflush@PLT
	call	getchar@PLT
	mov	rdx, QWORD PTR stdin[rip]
	lea	rax, -272[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
	lea	rax, -272[rbp]
	mov	rdi, rax
	call	task
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	ret
	.size	task_cmd, .-task_cmd
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
