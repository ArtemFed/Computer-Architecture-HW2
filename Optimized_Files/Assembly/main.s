	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"String: %s\n"
.LC1:
	.string	"Time: %d ms"
.LC2:
	.string	"\nResult: %d\n"
.LC3:
	.string	"r"
	.align 8
.LC4:
	.string	"Error opening file. Press any key to continue"
.LC5:
	.string	"w"
.LC6:
	.string	"%d "
	.align 8
.LC7:
	.string	"Random input or Direct (ans: 1, !=1):"
.LC8:
	.string	"%d"
	.align 8
.LC9:
	.string	"Input length (0 < length <= %d):"
.LC10:
	.string	"Incorrect length = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 320
	mov	DWORD PTR -308[rbp], edi	# argc, argc
	mov	QWORD PTR -320[rbp], rsi	# argv, argv
	cmp	DWORD PTR -308[rbp], 2	# if (argc == 2) {
	jne	.L2
# ./main.c:14:         time_t t_start = clock();
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax	# t_start, tmp106
# ./main.c:15:         printf("String: %s\n", argv[1]);
	mov	rax, QWORD PTR -320[rbp]	# tmp107, argv
	add	rax, 8	# _1,
	mov	rax, QWORD PTR [rax]	# _2, *_1
	mov	rsi, rax	#, _2
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:16:         for (int i = 0; i < 200000000; ++i) {
	mov	DWORD PTR -4[rbp], 0	# i,
	jmp	.L3
.L4:
# ./main.c:17:             task(argv[1]);
	mov	rax, QWORD PTR -320[rbp]	# tmp108, argv
	add	rax, 8
	mov	rax, QWORD PTR [rax]	# _4, *_3
	mov	rdi, rax	#, _4
	call	task@PLT
	add	DWORD PTR -4[rbp], 1	# i,
.L3:
	cmp	DWORD PTR -4[rbp], 200000000
	jle	.L4
# ./main.c:19:         time_t t_end = clock();
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax	# t_end, tmp109
# ./main.c:21:         printf("Time: %d ms", (int) (difftime(t_end, t_start)) / 1000);
	mov	rdx, QWORD PTR -32[rbp]	# _1, t_start
	mov	rax, QWORD PTR -40[rbp]	# _2, t_end
	mov	rsi, rdx	#, _1
	mov	rdi, rax	#, _2
	call	difftime@PLT
	cvttsd2si	eax, xmm0	# _6, _5
	movsx	rdx, eax	# tmp112, _6
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx	# _7, tmp115
	mov	esi, eax	#, _7
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:22:         printf("\nResult: %d\n", task(argv[1]));
	mov	rax, QWORD PTR -320[rbp]	# tmp117, argv
	add	rax, 8	# _8,
	mov	rax, QWORD PTR [rax]	# _9, *_8
	mov	rdi, rax	#, _9
	call	task@PLT
	mov	esi, eax	#, _10
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:23:         return 0;
	mov	eax, 0	# _24,
	jmp	.L13
.L2:
# ./main.c:26:     if (argc == 3) {
	cmp	DWORD PTR -308[rbp], 3	# argc,
	jne	.L6	#,
# ./main.c:28:         FILE *input_stream = fopen(argv[1], "r");
	mov	rax, QWORD PTR -320[rbp]	# tmp118, argv
	add	rax, 8	# _11,
	mov	rax, QWORD PTR [rax]	# _12, *_11
	lea	rsi, .LC3[rip]
	mov	rdi, rax	#, _12
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax	# input_stream, tmp119
# ./main.c:29:         if (input_stream == NULL) {
	cmp	QWORD PTR -16[rbp], 0	# input_stream,
	jne	.L7	#,
# ./main.c:30:             printf("Error opening file. Press any key to continue");
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:31:             getchar();
	call	getchar@PLT
# ./main.c:32:             return 0;
	mov	eax, 0	# _24,
	jmp	.L13
.L7:
# ./main.c:34:         fgets(arr_str, sizeof(arr_str), input_stream);
	mov	rdx, QWORD PTR -16[rbp]	# tmp120, input_stream
	lea	rax, -304[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
# ./main.c:35:         fclose(input_stream);
	mov	rax, QWORD PTR -16[rbp]	# tmp122, input_stream
	mov	rdi, rax	#, tmp122
	call	fclose@PLT
# ./main.c:37:         FILE *output_stream = fopen(argv[2], "w");
	mov	rax, QWORD PTR -320[rbp]	# tmp123, argv
	add	rax, 16	# _13,
	mov	rax, QWORD PTR [rax]	# _14, *_13
	lea	rsi, .LC5[rip]
	mov	rdi, rax	#, _14
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax	# output_stream, tmp124
# ./main.c:38:         fprintf(output_stream, "%d ", task(arr_str));
	lea	rax, -304[rbp]
	mov	rdi, rax
	call	task@PLT
	mov	edx, eax	# _15,
	mov	rax, QWORD PTR -24[rbp]	# tmp126, output_stream
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
# ./main.c:39:         fclose(output_stream);
	mov	rax, QWORD PTR -24[rbp]	# tmp127, output_stream
	mov	rdi, rax
	call	fclose@PLT
# ./main.c:40:         return 0;
	mov	eax, 0	# _24,
	jmp	.L13
.L6:
# ./main.c:42:     printf("Random input or Direct (ans: 1, !=1):");
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:43:     int answer = 0;
	mov	DWORD PTR -44[rbp], 0	# answer,
# ./main.c:44:     scanf("%d", &answer);
	lea	rax, -44[rbp]
	mov	rsi, rax
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
# ./main.c:45:     if (answer == 1) {
	mov	eax, DWORD PTR -44[rbp]	# answer.0_16, answer
	cmp	eax, 1	# answer.0_16,
	jne	.L9
# ./main.c:46:         int length = 0;
	mov	DWORD PTR -48[rbp], 0	# length,
# ./main.c:47:         printf("Input length (0 < length <= %d):", max_size);
	mov	esi, 256
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:48:         scanf("%d", &length);
	lea	rax, -48[rbp]
	mov	rsi, rax
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
# ./main.c:49:         if (length < 1 || length > max_size) {
	mov	eax, DWORD PTR -48[rbp]	# length.1_17, length
	test	eax, eax	# length.1_17
	jle	.L10
	mov	eax, DWORD PTR -48[rbp]	# length.2_18, length
	cmp	eax, 256	# length.2_18,
	jle	.L11
.L10:
# ./main.c:50:             printf("Incorrect length = %d\n", length);
	mov	eax, DWORD PTR -48[rbp]	# length.3_19, length
	mov	esi, eax	#, length.3_19
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:51:             return 0;
	mov	eax, 0	# _24,
	jmp	.L13
.L11:
# ./main.c:53:         printf("\nResult: %d\n", task_random(length));
	mov	eax, DWORD PTR -48[rbp]	# length.4_20, length
	mov	edi, eax	#, length.4_20
	call	task_random@PLT
	mov	esi, eax	#, _21
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:54:         return 0;
	mov	eax, 0	# _24,
	jmp	.L13
.L9:
# ./main.c:56:     printf("\nResult: %d\n", task_cmd());
	mov	eax, 0
	call	task_cmd@PLT
	mov	esi, eax	#, _22
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:57:     return 0;
	mov	eax, 0	# _24,
.L13:
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
