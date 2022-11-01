	.file	"file.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"%c"
.LC2:
	.string	"w"
.LC3:
	.string	"%d "
	.text
	.globl	task_file
	.type	task_file, @function
task_file:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -48[rbp], rsi			# -48 = char *output
	mov	rax, rdi
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT				# fopen(input, "r");
	mov	QWORD PTR -16[rbp], rax			# -16 = FILE *input_stream
	mov	DWORD PTR -4[rbp], 0			# -4 = sum
	mov	BYTE PTR -25[rbp], 32			# -25 = ch = ' '
	jmp	.L2
.L3:
	lea	rdx, -25[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	movzx	eax, BYTE PTR -25[rbp]
	cmp	al, 48
	jle	.L2
	movzx	eax, BYTE PTR -25[rbp]
	cmp	al, 57
	jg	.L2
	movzx	eax, BYTE PTR -25[rbp]
	movsx	eax, al
	sub	eax, 48
	add	DWORD PTR -4[rbp], eax
.L2:
	mov	rdi, QWORD PTR -16[rbp]
	call	feof@PLT
	test	eax, eax
	je	.L3
	mov rdi, QWORD PTR -16[rbp]
	call	fclose@PLT
	mov	rax, QWORD PTR -48[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT				# fopen(output, "w");
	mov	QWORD PTR -24[rbp], rax			# -24 = FILE *output_stream
	mov	edx, DWORD PTR -4[rbp]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov rdi, QWORD PTR -24[rbp]
	call	fclose@PLT
	nop
	leave
	ret
	.size	task_file, .-task_file
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
