	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	endbr64	
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 40
	mov	QWORD PTR -40[rbp], rdi	# str, str
# ./lib.c:7:     int sum = 0;
	mov	DWORD PTR -20[rbp], 0	# sum,
# ./lib.c:8:     for (int i = 0; i < strlen(str); ++i) {
	mov	DWORD PTR -24[rbp], 0	# i,
	jmp	.L2
.L4:
# ./lib.c:9:         if ((str[i] >= '1') && (str[i] <= '9')) {
	mov	eax, DWORD PTR -24[rbp]	# tmp97, i
	movsx	rdx, eax	# _1, tmp97
	mov	rax, QWORD PTR -40[rbp]	# tmp98, str
	add	rax, rdx	# _2, _1
	movzx	eax, BYTE PTR [rax]	# _3, *_2
	cmp	al, 48	# _3,
	jle	.L3
	mov	eax, DWORD PTR -24[rbp]	# tmp99, i
	movsx	rdx, eax	# _4, tmp99
	mov	rax, QWORD PTR -40[rbp]	# tmp100, str
	add	rax, rdx	# _5, _4
	movzx	eax, BYTE PTR [rax]	# _6, *_5
	cmp	al, 57	# _6,
	jg	.L3
# ./lib.c:10:             sum += ((int) str[i] - 48);
	mov	eax, DWORD PTR -24[rbp]	# tmp101, i
	movsx	rdx, eax	# _7, tmp101
	mov	rax, QWORD PTR -40[rbp]	# tmp102, str
	add	rax, rdx	# _8, _7
	movzx	eax, BYTE PTR [rax]	# _9, *_8
	movsx	eax, al	# _10, _9
	sub	eax, 48	# _11,
	add	DWORD PTR -20[rbp], eax	# sum, _11
.L3:
	add	DWORD PTR -24[rbp], 1	# i,
.L2:
	mov	eax, DWORD PTR -24[rbp]	# tmp103, i
	movsx	rbx, eax	# _12, tmp103
	mov	rax, QWORD PTR -40[rbp]	# tmp104, str
	mov	rdi, rax	#, tmp104
	call	strlen@PLT
	cmp	rbx, rax	# _12, _13
	jb	.L4
# ./lib.c:13:     return sum;
	mov	eax, DWORD PTR -20[rbp]	# _21, sum
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret	
	.size	task, .-task
	.section	.rodata
.LC0:
	.string	"Random string: %s"
	.text
	.globl	task_random
	.type	task_random, @function
task_random:
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 288
	mov	DWORD PTR -276[rbp], edi	# length, length
# ./lib.c:18:     srand(clock());
	call	clock@PLT
	mov	edi, eax	#, _2
	call	srand@PLT
# ./lib.c:19:     for (int j = 0; j < length; ++j) {
	mov	DWORD PTR -4[rbp], 0	# j,
	jmp	.L7
.L8:
# ./lib.c:20:         rndStr[j] = (char) (33 + rand() % 93);
	call	rand@PLT
	movsx	rdx, eax	# tmp91, _3
	imul	rdx, rdx, 738919105	# tmp92, tmp91,
	shr	rdx, 32	# tmp93,
	mov	ecx, edx	# tmp94, tmp93
	sar	ecx, 4	# tmp94,
	cdq
	sub	ecx, edx	# tmp94, tmp95
	mov	edx, ecx	# _4, tmp94
	imul	edx, edx, 93	# tmp96, _4,
	sub	eax, edx	# _3, tmp96
	mov	edx, eax	# _4, _3
	mov	eax, edx	# _5, _4
	add	eax, 33	# _6,
	mov	edx, eax	# _7, _6
	mov	eax, DWORD PTR -4[rbp]	# tmp98, j
	cdqe
	mov	BYTE PTR -272[rbp+rax], dl	# rndStr, _7
# ./lib.c:19:     for (int j = 0; j < length; ++j) {
	add	DWORD PTR -4[rbp], 1	# j,
.L7:
	mov	eax, DWORD PTR -4[rbp]	# tmp99, j
	cmp	eax, DWORD PTR -276[rbp]	# tmp99, length
	jl	.L8
# ./lib.c:22:     printf("Random string: %s", rndStr);
	lea	rax, -272[rbp]	# tmp100,
	mov	rsi, rax	#, tmp100
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
# ./lib.c:23:     return task(rndStr);
	lea	rax, -272[rbp]	# tmp101,
	mov	rdi, rax	#, tmp101
	call	task
	leave	
	ret	
	.size	task_random, .-task_random
	.section	.rodata
	.align 8
.LC1:
	.string	"Your string (maximum 256 characters):"
	.text
	.globl	task_cmd
	.type	task_cmd, @function
task_cmd:
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 256
# ./lib.c:28:     printf("Your string (maximum 256 characters):");
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
# ./lib.c:29:     fflush(stdin);
	mov	rax, QWORD PTR stdin[rip]	# stdin.0_1, stdin
	mov	rdi, rax	#, stdin.0_1
	call	fflush@PLT
# ./lib.c:30:     getchar();
	call	getchar@PLT
# ./lib.c:31:     fgets(string, 256, stdin);
	mov	rdx, QWORD PTR stdin[rip]	# stdin.1_2, stdin
	lea	rax, -256[rbp]	# tmp86,
	mov	esi, 256
	mov	rdi, rax	#, tmp86
	call	fgets@PLT
# ./lib.c:32:     return task(string);
	lea	rax, -256[rbp]	# tmp87,
	mov	rdi, rax	#, tmp87
	call	task
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
