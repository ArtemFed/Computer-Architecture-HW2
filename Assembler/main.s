	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Input length (0 < length <= %d):"
.LC1:
	.string	"%d"
.LC2:
	.string	"Incorrect length = %d\n"
	.text
	.globl	read_int
	.type	read_int, @function
read_int:						# int read_int()
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	esi, 100
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -4[rbp]				# -4 = length
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -4[rbp]
	test	eax, eax
	jle	.L2
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, 100
	jle	.L3					# if (... || length > max_size)
.L2:
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	exit@PLT
.L3:
	mov	eax, DWORD PTR -4[rbp]
	leave
	ret
	.size	read_int, .-read_int
	.section	.rodata
.LC3:
	.string	"Result string: "
.LC4:
	.string	"\n\nResult: %d\n"
	.text
	.globl	task_random
	.type	task_random, @function
task_random:						# void task_random(int length)
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi			# -20 = length
	mov	DWORD PTR -4[rbp], 0			# -4 = sum
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -8[rbp], 0			# -8 = i в for
	jmp	.L6
.L8:							# for (int i = 0; i < length; ++i)
	call	rand@PLT
	cdq
	shr	edx, 27
	add	eax, edx
	and	eax, 31
	sub	eax, edx
	add	eax, 33
	mov	BYTE PTR -9[rbp], al			# -9 = ch 
	movsx	eax, BYTE PTR -9[rbp]
	mov	edi, eax
	call	putchar@PLT
	cmp	BYTE PTR -9[rbp], 48
	jle	.L7
	cmp	BYTE PTR -9[rbp], 57
	jg	.L7
	movsx	eax, BYTE PTR -9[rbp]
	sub	eax, 48
	add	DWORD PTR -4[rbp], eax
.L7:
	add	DWORD PTR -8[rbp], 1
.L6:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L8
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	nop
	leave
	ret
	.size	task_random, .-task_random
	.globl	task_random_lite
	.type	task_random_lite, @function
task_random_lite:					# int task_random_lite(int length)
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi			# -20 = length
	mov	DWORD PTR -4[rbp], 0			# -4 = sum
	mov	DWORD PTR -8[rbp], 0			# -8 = j в for
	jmp	.L10
.L12:
	call	rand@PLT
	cdq
	shr	edx, 27
	add	eax, edx
	and	eax, 31
	sub	eax, edx
	add	eax, 33
	mov	BYTE PTR -9[rbp], al			# -9 = ch
	cmp	BYTE PTR -9[rbp], 48
	jle	.L11
	cmp	BYTE PTR -9[rbp], 57
	jg	.L11
	movsx	eax, BYTE PTR -9[rbp]
	sub	eax, 48
	add	DWORD PTR -4[rbp], eax
.L11:
	add	DWORD PTR -8[rbp], 1
.L10:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L12
	nop
	nop
	leave
	ret
	.size	task_random_lite, .-task_random_lite
	.section	.rodata
.LC5:
	.string	"\n%d ms\n"
	.align 8
.LC6:
	.string	"Random input or Direct (ans: 1, !=1):"
.LC7:
	.string	"\nResult: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi			# запись argc => (-36 = argc)
	mov	QWORD PTR -48[rbp], rsi			# запись argv => (-48 = argv)
	mov	DWORD PTR -8[rbp], 0			# length = 0 => (-8 = length)
	mov	DWORD PTR -28[rbp], 0			# answer = 0 => (-28 = answer)
	cmp	DWORD PTR -36[rbp], 3			# if (argc == 3)
	jne	.L14
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rdx				# => argv[1]
	mov	rdi, rax				# => argv[2]
	call	task_file@PLT				# task_file(argv[1], argv[2]);
	mov	eax, 0
	jmp	.L20					# return 0;
.L14:
	call	clock@PLT
	mov	edi, eax
	call	srand@PLT
	cmp	DWORD PTR -36[rbp], 2
	jne	.L16					# if (argc == 2) {
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -8[rbp], eax			# length = atoi(argv[1]);
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax			# time_t t_start => (-16 = t_end)
	mov	DWORD PTR -4[rbp], 0				# -4 = i в for
	jmp	.L17
.L18:							# for (int i = 0; i < 5000000; ++i) {
	mov	eax, DWORD PTR -8[rbp]
	mov	edi, eax
	call	task_random_lite
	add	DWORD PTR -4[rbp], 1
.L17:
	cmp	DWORD PTR -4[rbp], 4999999
	jle	.L18
	mov	eax, DWORD PTR -8[rbp]
	mov	edi, eax
	call	task_random
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax			# time_t t_end => (-24 = t_end)
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT				# (int) (difftime(t_end, t_start)) / 1000);
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L20
.L16:
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -28[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -28[rbp]
	cmp	eax, 1
	jne	.L19
	mov	eax, 0
	call	read_int
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	mov	edi, eax
	call	task_random
	mov	eax, 0
	jmp	.L20
.L19:
	mov	eax, 0
	call	task_cmd@PLT
	mov	esi, eax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L20:
	leave
	ret
	.size	main, .-main
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
