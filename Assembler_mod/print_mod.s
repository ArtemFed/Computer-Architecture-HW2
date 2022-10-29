	.file	"print.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"\nResult B: "
.LC1:
	.string	"%d "
	.text
	.globl	print_arr
	.type	print_arr, @function
print_arr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi		# -24 = B[] копирует входной параметр rdi
	mov	DWORD PTR -28[rbp], esi		# -28 = length копирует входной параметр esi
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0		# r12d - итерируемая переменная i в for
	jmp	.L2
.L3:
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	esi, DWORD PTR [rax]
	lea	rdi, .LC1[rip]
	call	printf@PLT
	add	r12d, 1		# r12d увеличиваем значение итератора на 1
.L2:
	mov	eax, r12d		# eax копирует итерируемую переменную для сравнения
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L3
	mov	edi, 10
	call	putchar@PLT
	nop
	leave
	ret
	.size	print_arr, .-print_arr
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
