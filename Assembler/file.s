	.file	"file.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Error opening file. Press any key to continue"
	.text
	.globl	check_stream
	.type	check_stream, @function
check_stream:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi		# -8 = FILE *stream
	cmp	QWORD PTR -8[rbp], 0
	jne	.L3
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	exit@PLT
.L3:
	nop
	leave
	ret
	.size	check_stream, .-check_stream
	.section	.rodata
.LC1:
	.string	"r"
.LC2:
	.string	"%c"
.LC3:
	.string	"w"
.LC4:
	.string	"%d "
	.text
	.globl	task_file
	.type	task_file, @function
task_file:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi			# -40 = char *input
	mov	QWORD PTR -48[rbp], rsi			# -48 = char *output
	mov	rax, QWORD PTR -40[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT				# fopen(input, "r");
	mov	QWORD PTR -16[rbp], rax			# -16 = FILE *input_stream
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	check_stream
	mov	DWORD PTR -4[rbp], 0			# -4 = sum
	mov	BYTE PTR -25[rbp], 32			# -25 = ch = ' '
	jmp	.L5
.L6:
	lea	rdx, -25[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	movzx	eax, BYTE PTR -25[rbp]
	cmp	al, 48
	jle	.L5
	movzx	eax, BYTE PTR -25[rbp]
	cmp	al, 57
	jg	.L5
	movzx	eax, BYTE PTR -25[rbp]
	movsx	eax, al
	sub	eax, 48
	add	DWORD PTR -4[rbp], eax
.L5:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	feof@PLT
	test	eax, eax
	je	.L6
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -48[rbp]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT				# fopen(output, "w");
	mov	QWORD PTR -24[rbp], rax			# -24 = FILE *output_stream
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	check_stream
	mov	edx, DWORD PTR -4[rbp]
	mov	rax, QWORD PTR -24[rbp]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	ret
	.size	task_file, .-task_file
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
4.0"
	.section	.note.GNU-stack,"",@progbits
