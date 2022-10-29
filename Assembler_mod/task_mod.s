	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi		# -24 = A[] копирует входной параметр rdi
	mov	DWORD PTR -28[rbp], esi		# -28 = length копирует входной параметр esi
	mov	QWORD PTR -40[rbp], rdx		# -40 = B[] копирует входной параметр rdx
	mov	r12d, 1									# r12d - итерируемая переменная i в for с 1 
	cmp	DWORD PTR -28[rbp], 0		# if (length == 0) {...}
	je	.L6
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	jmp	.L4
.L5:
	mov	eax, r12d								# eax копирует r12d
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR [rax]
	mov	eax, r12d								# eax копирует r12d
	sal	rax, 2
	lea	rdx, -4[rax]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, r12d								# eax копирует r12d
	lea	rsi, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rsi
	add	edx, ecx
	mov	DWORD PTR [rax], edx
	add	r12d, 1									# r12d увеличиваем значение итератора на 1
.L4:
	mov	eax, r12d								# eax копирует r12d
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L5
	jmp	.L1
.L6:
	nop
.L1:
	pop	rbp
	ret
	.size	task, .-task
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
