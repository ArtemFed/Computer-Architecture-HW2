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
	# mov	QWORD PTR -40[rbp], rdi			# -40 = char *input
	mov	QWORD PTR -48[rbp], rsi			# -48 = char *output
	# mov	rax, QWORD PTR -40[rbp]
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
	# mov	rax, QWORD PTR -16[rbp]
	# mov	rdi, rax
	mov	rdi, QWORD PTR -16[rbp]
	call	feof@PLT
	test	eax, eax
	je	.L3
	# mov	rax, QWORD PTR -16[rbp]
	# mov	rdi, rax
	mov rdi, QWORD PTR -16[rbp]
	call	fclose@PLT
	mov	rax, QWORD PTR -48[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT				# fopen(output, "w");
	mov	QWORD PTR -24[rbp], rax			# -24 = FILE *output_stream
	mov	edx, DWORD PTR -4[rbp]
	# mov	rax, QWORD PTR -24[rbp]	- ЭТО ЖЕ ПРОСТО НЕ НУЖНО, ДА? - спросил я у себя будущего из прошлого
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	# mov	rax, QWORD PTR -24[rbp]
	# mov	rdi, rax
	mov rdi, QWORD PTR -24[rbp]
	call	fclose@PLT
	nop
	leave
	ret
	.size	task_file, .-task_file
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
# 	.section	.note.GNU-stack,"",@progbits
# 	.section	.note.gnu.property,"a"
# 	.align 8
# 	.long	 1f - 0f
# 	.long	 4f - 1f
# 	.long	 5
# 0:
# 	.string	 "GNU"
# 1:
# 	.align 8
# 	.long	 0xc0000002
# 	.long	 3f - 2f
# 2:
# 	.long	 0x3
# 3:
# 	.align 8
# 4:
