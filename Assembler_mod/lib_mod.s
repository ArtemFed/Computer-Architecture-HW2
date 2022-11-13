	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi	# str, str
# ./lib.c:7:     int sum = 0;
	mov	DWORD PTR -4[rbp], 0	# sum = 0
# ./lib.c:8:     int length = strlen(str);
	mov	rdi, QWORD PTR -24[rbp]
	call	strlen@PLT
	mov	DWORD PTR -12[rbp], eax	# length, _1
# ./lib.c:9:     char ch = ' ';
	mov	BYTE PTR -13[rbp], 32	# ch = ' '
# ./lib.c:10:     for (int i = 0; i < length; ++i) {
	mov	r12d, 0	# i = 0
	jmp	.L2
.L4:
# ./lib.c:11:         ch = str[i];
	movsx	rdx, r12d
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -13[rbp], al
# ./lib.c:12:         if ((ch >= '1') && (ch <= '9')) {
	cmp	BYTE PTR -13[rbp], 48	# cmp ch, 48
	jle	.L3
	cmp	BYTE PTR -13[rbp], 57	# cmp ch, 57
	jg	.L3
# ./lib.c:13:             sum += ((int) ch - 48);
	movsx	eax, BYTE PTR -13[rbp]
	sub	eax, 48
	add	DWORD PTR -4[rbp], eax	# sum, _5
.L3:
# ./lib.c:10:     for (int i = 0; i < length; ++i) {
	add	r12d, 1	# i = 0
.L2:
	mov	eax, r12d
	cmp	eax, DWORD PTR -12[rbp]	# tmp93, length
	jl	.L4
# ./lib.c:16:     return sum;
	mov	eax, DWORD PTR -4[rbp]
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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 288
	mov	DWORD PTR -276[rbp], edi	# length, length
# ./lib.c:21:     srand(clock());
	call	clock@PLT
	mov	edi, eax
	call	srand@PLT
# ./lib.c:22:     for (int j = 0; j < length; ++j) {
	mov	r12d, 0	# j,
	jmp	.L7
.L8:
# ./lib.c:23:         rndStr[j] = (char) (33 + rand() % 93);
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 738919105
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 4
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 93
	sub	eax, edx
	mov	edx, eax
	add	edx, 33
	mov	eax, r12d	# tmp98, j
	cdqe
	mov	BYTE PTR -272[rbp+rax], dl	# rndStr, _7
# ./lib.c:22:     for (int j = 0; j < length; ++j) {
	add	r12d, 1	# j++
.L7:
	mov	eax, r12d
	cmp	eax, DWORD PTR -276[rbp]
	jl	.L8
# ./lib.c:25:     printf("Random string: %s", string);
	lea	rax, -272[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
# ./lib.c:26:     return task(string);
	lea	rax, -272[rbp]
	mov	rdi, rax
	call	task	# string => task(string)
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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 256
# ./lib.c:31:     printf("Your string (maximum 256 characters):");
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
# ./lib.c:32:     fflush(stdin);
	mov	rdi, QWORD PTR stdin[rip]	#, stdin.0_1
	call	fflush@PLT
# ./lib.c:33:     getchar();
	call	getchar@PLT
# ./lib.c:34:     fgets(string, 256, stdin);
	mov	rdx, QWORD PTR stdin[rip]	# stdin.1_2, stdin
	lea	rax, -256[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
# ./lib.c:35:     return task(string);
	lea	rax, -256[rbp]
	mov	rdi, rax	# string => task(string)
	call	task	
# ./lib.c:36: }
	leave	
	ret	
	.size	task_cmd, .-task_cmd
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
