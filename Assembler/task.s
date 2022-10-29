	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi	# указаткль на массив A[]
	mov	DWORD PTR -28[rbp], esi	# переменная length
	mov	QWORD PTR -40[rbp], rdx # указаткль на массив B[]
	mov	DWORD PTR -4[rbp], 1	# переменная count
	cmp	DWORD PTR -28[rbp], 0 	# if (length == 0) {
	je	.L6
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	DWORD PTR [rax], edx
	jmp	.L4
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 2
	lea	rdx, -4[rax]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rsi, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rsi
	add	edx, ecx
	mov	DWORD PTR [rax], edx
	add	DWORD PTR -4[rbp], 1
.L4:
	mov	eax, DWORD PTR -4[rbp]
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
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
