	.file	"task.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Your string:"
.LC1:
	.string	"%c"
	.text
	.globl	task_cmd
	.type	task_cmd, @function
task_cmd:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi			# -20 = length
	mov	DWORD PTR -4[rbp], 0			# -4 = sum
	mov	BYTE PTR -9[rbp], 32			# -9 = ch
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -8[rbp], 0			# -8 = i в for
	jmp	.L2
.L4:
	lea	rax, -9[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movzx	eax, BYTE PTR -9[rbp]
	cmp	al, 48
	jle	.L3
	movzx	eax, BYTE PTR -9[rbp]
	cmp	al, 57
	jg	.L3
	movzx	eax, BYTE PTR -9[rbp]
	movsx	eax, al
	sub	eax, 48
	add	DWORD PTR -4[rbp], eax
.L3:
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L4
	mov	eax, DWORD PTR -4[rbp]
	leave
	ret
	.size	task_cmd, .-task_cmd
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
