	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 32	#,
	mov	QWORD PTR -24[rbp], rdi	# str, str
# ./lib.c:7:     int sum = 0;
	mov	DWORD PTR -4[rbp], 0	# sum,
# ./lib.c:8:     int length = strlen(str);
	mov	rdi, QWORD PTR -24[rbp]	#, tmp89
	call	strlen@PLT	#
	mov	DWORD PTR -12[rbp], eax	# length, _1
# ./lib.c:9:     char ch = ' ';
	mov	BYTE PTR -13[rbp], 32	# ch,
# ./lib.c:10:     for (int i = 0; i < length; ++i) {
	mov	r12d, 0	# i,
	jmp	.L2	#
.L4:
# ./lib.c:11:         ch = str[i];
	movsx	rdx, r12d	# _2, tmp90
	mov	rax, QWORD PTR -24[rbp]	# tmp91, str
	add	rax, rdx	# _3, _2
	movzx	eax, BYTE PTR [rax]	# tmp92, *_3
	mov	BYTE PTR -13[rbp], al	# ch, tmp92
# ./lib.c:12:         if ((ch >= '1') && (ch <= '9')) {
	cmp	BYTE PTR -13[rbp], 48	# ch,
	jle	.L3	#,
	cmp	BYTE PTR -13[rbp], 57	# ch,
	jg	.L3	#,
# ./lib.c:13:             sum += ((int) ch - 48);
	movsx	eax, BYTE PTR -13[rbp]	# _4, ch
# ./lib.c:13:             sum += ((int) ch - 48);
	sub	eax, 48	# _5,
# ./lib.c:13:             sum += ((int) ch - 48);
	add	DWORD PTR -4[rbp], eax	# sum, _5
.L3:
# ./lib.c:10:     for (int i = 0; i < length; ++i) {
	add	r12d, 1	# i,
.L2:
# ./lib.c:10:     for (int i = 0; i < length; ++i) {
	mov	eax, r12d	# tmp93, i
	cmp	eax, DWORD PTR -12[rbp]	# tmp93, length
	jl	.L4	#,
# ./lib.c:16:     return sum;
	mov	eax, DWORD PTR -4[rbp]	# _15, sum
# ./lib.c:17: }
	leave	
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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 288	#,
	mov	DWORD PTR -276[rbp], edi	# length, length
# ./lib.c:21:     srand(clock());
	call	clock@PLT	#
	mov	edi, eax	#, _2
	call	srand@PLT	#
# ./lib.c:22:     for (int j = 0; j < length; ++j) {
	mov	DWORD PTR -4[rbp], 0	# j,
	jmp	.L7	#
.L8:
# ./lib.c:23:         rndStr[j] = (char) (33 + rand() % 93);
	call	rand@PLT	#
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
	add	edx, 33	# _6,
	mov	eax, DWORD PTR -4[rbp]	# tmp98, j
	cdqe
	mov	BYTE PTR -272[rbp+rax], dl	# rndStr, _7
# ./lib.c:22:     for (int j = 0; j < length; ++j) {
	add	DWORD PTR -4[rbp], 1	# j,
.L7:
# ./lib.c:22:     for (int j = 0; j < length; ++j) {
	mov	eax, DWORD PTR -4[rbp]	# tmp99, j
	cmp	eax, DWORD PTR -276[rbp]	# tmp99, length
	jl	.L8	#,
# ./lib.c:25:     printf("Random string: %s", rndStr);
	lea	rax, -272[rbp]	# tmp100,
	mov	rsi, rax	#, tmp100
	lea	rdi, .LC0[rip]	#,
	mov	eax, 0	#,
	call	printf@PLT	#
# ./lib.c:26:     return task(rndStr);
	lea	rax, -272[rbp]	# tmp101,
	mov	rdi, rax	#, tmp101
	call	task
# ./lib.c:27: }
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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 256	#,
# ./lib.c:31:     printf("Your string (maximum 256 characters):");
	lea	rdi, .LC1[rip]	#,
	mov	eax, 0	#,
	call	printf@PLT	#
# ./lib.c:32:     fflush(stdin);
	mov	rdi, QWORD PTR stdin[rip]	#, stdin.0_1
	call	fflush@PLT	#
# ./lib.c:33:     getchar();
	call	getchar@PLT	#
# ./lib.c:34:     fgets(string, 256, stdin);
	mov	rdx, QWORD PTR stdin[rip]	# stdin.1_2, stdin
	lea	rax, -256[rbp]	# tmp86,
	mov	esi, 256	#,
	mov	rdi, rax	#, tmp86
	call	fgets@PLT	#
# ./lib.c:35:     return task(string);
	lea	rax, -256[rbp]	# tmp87,
	mov	rdi, rax	#, tmp87
	call	task	#
# ./lib.c:36: }
	leave	
	ret	
	.size	task_cmd, .-task_cmd
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
