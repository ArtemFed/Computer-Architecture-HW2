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
	mov	rsi, QWORD PTR [rax]
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:16:         for (int i = 0; i < 25000000; ++i) {
	mov	r13d, 0	# i,
	jmp	.L3
.L4:
# ./main.c:17:             task(argv[1]);
	mov	rax, QWORD PTR -320[rbp]	# tmp108, argv
	add	rax, 8
	mov	rdi, QWORD PTR [rax]
	call	task@PLT
	add	r13d, 1	# i++
.L3:
	cmp	r13d, 24999999
	jle	.L4
# ./main.c:19:         time_t t_end = clock();
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax	# t_end, tmp109
# ./main.c:21:         printf("Time: %d ms", (int) (difftime(t_end, t_start)) / 1000);
	mov	rsi, QWORD PTR -32[rbp]
  mov	rdi, QWORD PTR -40[rbp]
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	esi, edx
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:22:         printf("\nResult: %d\n", task(argv[1]));
	mov	rax, QWORD PTR -320[rbp]	# tmp117, argv
	add	rax, 8
	mov	rdi, QWORD PTR [rax]	# argv[1] => task(argv[1]);
	call	task@PLT
	mov	esi, eax	# int sum => printf
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:23:         return 0;
	mov	eax, 0
	jmp	.L13
.L2:
# ./main.c:26:     if (argc == 3) {
	cmp	DWORD PTR -308[rbp], 3	# argc, 3
	jne	.L6
# ./main.c:28:         FILE *input_stream = fopen(argv[1], "r");
	mov	rax, QWORD PTR -320[rbp]	# tmp118, argv
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
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
	mov	eax, 0
	jmp	.L13
.L7:
# ./main.c:34:         fgets(arr_str, sizeof(arr_str), input_stream);
	mov	rdx, QWORD PTR -16[rbp]	# tmp120, input_stream
	lea	rax, -304[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
# ./main.c:35:         fclose(input_stream);
	mov rdi, QWORD PTR -16[rbp]
	call	fclose@PLT
# ./main.c:37:         FILE *output_stream = fopen(argv[2], "w");
	mov	rax, QWORD PTR -320[rbp]	# tmp123, argv
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax	# output_stream, tmp124
# ./main.c:38:         fprintf(output_stream, "%d ", task(arr_str));
	lea	rax, -304[rbp]
	mov	rdi, rax	# argv[1] => task(argv[1])
	call	task@PLT
	mov	edx, eax	# int sum => fprintf
	mov	rax, QWORD PTR -24[rbp]	# tmp126, output_stream
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
# ./main.c:39:         fclose(output_stream);
	mov rdi, QWORD PTR -24[rbp]
	call	fclose@PLT
# ./main.c:40:         return 0;
	mov	eax, 0
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
	mov esi, DWORD PTR -48[rbp]
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:51:             return 0;
	mov	eax, 0
	jmp	.L13
.L11:
# ./main.c:53:         printf("\nResult: %d\n", task_random(length));
	mov edi, DWORD PTR -48[rbp]	# length => task_random(length)
	call	task_random@PLT		
	mov	esi, eax	# length => printf
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:54:         return 0;
	mov	eax, 0
	jmp	.L13
.L9:
# ./main.c:56:     printf("\nResult: %d\n", task_cmd());
	mov	eax, 0
	call	task_cmd@PLT	# task_cmd()
	mov	esi, eax	# int sum => printf
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:57:     return 0;
	mov	eax, 0
.L13:
	leave	
	ret	
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
