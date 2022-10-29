	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"input.txt"
.LC2:
	.string	"%d"
.LC3:
	.string	"w"
.LC4:
	.string	"output.txt"
.LC5:
	.string	"%d "
	.align 8
.LC6:
	.string	"Input length (0 < length <= %d):"
.LC7:
	.string	"Incorrect length = %d\n"
	.align 8
.LC8:
	.string	"Random input or Direct (ans: 1, !=1):"
.LC9:
	.string	"Result A: "
.LC10:
	.string	"A[%d] = %d\n"
.LC11:
	.string	"A[%d] ="
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 248
	mov	DWORD PTR -180[rbp], edi	# запись argc => (-180 = argc)
	mov	QWORD PTR -192[rbp], rsi	# запись argv => (-192 = argv)
	mov	DWORD PTR -152[rbp], 0	# запись answer => (-152 = answer)
	cmp	DWORD PTR -180[rbp], 2	# сравниваем argc c 2
	jne	.L2	# if (argc == 2) {...} else ... !
	mov	rax, rsp
	mov	rbx, rax
	mov	rax, QWORD PTR -192[rbp]	# сохраняем значение argv[0]
	add	rax, 8	# сдвигаемся на argv[1], чтобы прочитать аргумент командной строки
	mov rax, QWORD PTR [rax]
	mov rdi, rax
	call atoi@PLT
	mov	DWORD PTR -148[rbp], eax	# length = eax => (-148 = length)
	lea	rsi, .LC0[rip]	# устанавливаем ссылку на "r"
	lea	rdi, .LC1[rip]	# устанавливаем ссылку на "input.txt"
	call	fopen@PLT
	mov	QWORD PTR -104[rbp], rax	# запись input => (-104 = input)
	mov	eax, DWORD PTR -148[rbp]	# {
	movsx	rdx, eax				# - обращение к [length] в A[...]
	sub	rdx, 1				# }
	mov	QWORD PTR -112[rbp], rdx	# указаткль на массив A[] с аргументов cmd
	movsx	rdx, eax
	mov	QWORD PTR -208[rbp], rdx
	mov	QWORD PTR -200[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -224[rbp], rdx
	mov	QWORD PTR -216[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4] 
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L3:	# работа с памятью Начало
	cmp	rsp, rdx
	je	.L4
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L3
.L4:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L5
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0 # работа с памятью Конец
.L5:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -120[rbp], rax	# конец создания массива А[] с аргументов cmd (-120 = A[])
	mov	eax, DWORD PTR -148[rbp]	# {
	movsx	rdx, eax				# - обращение к [length] в B[...]
	sub	rdx, 1				# }
	mov	QWORD PTR -128[rbp], rdx	# указаткль на массив B[] с аргументов cmd
	movsx	rdx, eax
	mov	QWORD PTR -240[rbp], rdx
	mov	QWORD PTR -232[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -256[rbp], rdx
	mov	QWORD PTR -248[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L6:	# работа с памятью Начало
	cmp	rsp, rdx 
	je	.L7
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L6
.L7:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L8
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0	# работа с памятью Конец
.L8:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -136[rbp], rax	# конец создания массива B[] с аргументов cmd (-136 = B[])
	mov	DWORD PTR -64[rbp], 0
	jmp	.L9
.L10:	# for для fscanf()
	mov	eax, DWORD PTR -64[rbp]		# итератор i в for для fscanf()
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -120[rbp] 
	add	rdx, rax
	mov	rax, QWORD PTR -104[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -64[rbp], 1 
.L9:
	mov	eax, DWORD PTR -148[rbp] # eax = length
	cmp	DWORD PTR -64[rbp], eax # i < length;
	jl	.L10 # for для fscanf()
	mov	rax, QWORD PTR -104[rbp]
	mov	rdi, rax
	call	fclose@PLT # закрываю "input.txt"
	mov	ecx, DWORD PTR -148[rbp] # сохраняю length для передачи в task(A, length, B);
	mov	rdx, QWORD PTR -136[rbp] # сохраняю B[] для передачи в task(A, length, B);
	mov	rax, QWORD PTR -120[rbp] # сохраняю A[] для передачи в task(A, length, B);
	mov	esi, ecx
	mov	rdi, rax
	call	task@PLT	# вызываю метод "task"
	lea	rsi, .LC3[rip]	#  устанавливаем ссылку на "w"
	lea	rdi, .LC4[rip]	#  устанавливаем ссылку на "output.txt"
	call	fopen@PLT # открываю "output.txt"
	mov	QWORD PTR -144[rbp], rax
	mov	DWORD PTR -60[rbp], 0
	jmp	.L11
.L12:	# for для fprintf()
	mov	rax, QWORD PTR -136[rbp]
	mov	edx, DWORD PTR -60[rbp]
	movsx	rdx, edx
	mov	edx, DWORD PTR [rax+rdx*4]
	mov	rax, QWORD PTR -144[rbp]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -60[rbp], 1
.L11:
	mov	eax, DWORD PTR -148[rbp]
	cmp	DWORD PTR -60[rbp], eax
	jl	.L12	# for для fprintf()
	mov	rax, QWORD PTR -144[rbp]
	mov	rdi, rax
	call	fclose@PLT # fclose "output.txt"
	mov	eax, 0
	mov	rsp, rbx
	jmp	.L28
.L2:	# if (argc != 2)
	mov	esi, 20 # max_size
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT # printf("Random input or Direct (ans: 1, !=1):");
	lea	rax, -148[rbp]
	mov	rsi, rax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT # читаем answer
	mov	eax, DWORD PTR -148[rbp]
	test	eax, eax # 	# if (length >= 1)
	jle	.L14
	mov	eax, DWORD PTR -148[rbp]
	cmp	eax, 20	# if (... || length > max_size)
	jle	.L15
.L14:
	mov	eax, DWORD PTR -148[rbp]
	mov	esi, eax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT # printf("Incorrect length = %d\n", length);
	mov	eax, 1 # return 1;
	jmp	.L28
.L15:
	mov	eax, DWORD PTR -148[rbp]	# {
	mov	rdx, rsp
	mov	rbx, rdx				# - обращение к [length] в A[...]
	movsx	rdx, eax
	sub	rdx, 1				# }
	mov	QWORD PTR -72[rbp], rdx	# указаткль на массив A[] 
	movsx	rdx, eax
	mov	QWORD PTR -272[rbp], rdx
	mov	QWORD PTR -264[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -288[rbp], rdx
	mov	QWORD PTR -280[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	edi, 16
	mov	edx, 0
	div	rdi
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rsi, rsp
	sub	rsi, rdx
	mov	rdx, rsi
.L16:
	cmp	rsp, rdx
	je	.L17
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L16
.L17:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L18
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L18:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax		# конец создания массива A[] (-80 = A[])
	mov	eax, DWORD PTR -148[rbp]	# {
	movsx	rdx, eax					# - обращение к [length] в B[...]
	sub	rdx, 1				# }
	mov	QWORD PTR -88[rbp], rdx		# указаткль на массив B[]
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L19:
	cmp	rsp, rdx
	je	.L20
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L19
.L20:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L21
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L21:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -96[rbp], rax		# конец создания массива B[] 
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT 	# printf("Random input or Direct (ans: 1, !=1):");
	lea	rax, -152[rbp]
	mov	rsi, rax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT 	# scanf("%d", &answer);
	mov	eax, DWORD PTR -152[rbp]
	cmp	eax, 1
	jne	.L22
	lea	rax, -176[rbp] 	# struct timespec sec;
	mov	rsi, rax
	mov	edi, 0
	call	clock_gettime@PLT # clock_gettime(CLOCK_REALTIME, &sec);
	mov	rax, QWORD PTR -168[rbp]	# srand(sec.tv_nsec);
	mov	edi, eax
	call	srand@PLT
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	DWORD PTR -56[rbp], 0	# i в for с A[i] = rand() % 10;
	jmp	.L23
.L24:	# for с A[i] = rand() % 10;
	call	rand@PLT
	mov	ecx, eax
	movsx	rax, ecx
	imul	rax, rax, 1717986919
	shr	rax, 32
	mov	edx, eax
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	rax, QWORD PTR -80[rbp]
	mov	ecx, DWORD PTR -56[rbp]
	movsx	rcx, ecx
	mov	DWORD PTR [rax+rcx*4], edx
	mov	eax, DWORD PTR -56[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -80[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -56[rbp]
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -56[rbp], 1
.L23:
	mov	eax, DWORD PTR -148[rbp]
	cmp	DWORD PTR -56[rbp], eax
	jl	.L24 # for с A[i] = rand() % 10;
	mov	ecx, DWORD PTR -148[rbp]	# сохраняю length для передачи в task(A, length, B);
	mov	rdx, QWORD PTR -96[rbp]		# сохраняю B[] для передачи в task(A, length, B);
	mov	rax, QWORD PTR -80[rbp]		# сохраняю A[] для передачи в task(A, length, B);
	mov	esi, ecx
	mov	rdi, rax
	call	task@PLT # task(A, length, B);
	mov	edx, DWORD PTR -148[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	print_arr@PLT
	mov	eax, 0
	jmp	.L25
.L22:
	mov	edi, 10
	call	putchar@PLT
	mov	DWORD PTR -52[rbp], 0 # - i в for с printf("A[%d] =", i);
	jmp	.L26
.L27:
	mov	eax, DWORD PTR -52[rbp]
	mov	esi, eax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -80[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -52[rbp], 1
.L26:
	mov	eax, DWORD PTR -148[rbp]
	cmp	DWORD PTR -52[rbp], eax
	jl	.L27
	mov	ecx, DWORD PTR -148[rbp]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	task@PLT
	mov	edx, DWORD PTR -148[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	print_arr@PLT
	mov	eax, 0
.L25:
	mov	rsp, rbx
.L28:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
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
