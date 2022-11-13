	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	task
	.type	task, @function
task:
	push	rbx
	mov	rbx, rdi
	call	strlen@PLT
	test	eax, eax
	jle	.L23
	mov	rcx, rax
	lea	eax, -1[rax]
	cmp	eax, 14
	jbe	.L24
	mov	eax, ecx
	mov	rdx, rbx
	pxor	xmm0, xmm0
	movdqa	xmm7, XMMWORD PTR .LC0[rip]
	shr	eax, 4
	movdqa	xmm6, XMMWORD PTR .LC1[rip]
	pxor	xmm5, xmm5
	pxor	xmm3, xmm3
	sal	rax, 4
	movdqa	xmm4, XMMWORD PTR .LC2[rip]
	add	rax, rbx
	.p2align 4,,10
	.p2align 3
.L4:
	movdqu	xmm1, XMMWORD PTR [rdx]
	movdqa	xmm2, xmm5
	movdqa	xmm11, xmm3
	movdqa	xmm12, xmm3
	add	rdx, 16
	pcmpgtb	xmm2, xmm1
	movdqa	xmm8, xmm1
	movdqa	xmm14, xmm1
	paddb	xmm1, xmm7
	movdqa	xmm9, xmm1
	pminub	xmm9, xmm6
	punpcklbw	xmm8, xmm2
	punpckhbw	xmm14, xmm2
	pcmpeqb	xmm1, xmm9
	movdqa	xmm9, xmm5
	movdqa	xmm2, xmm14
	pcmpgtw	xmm11, xmm8
	pcmpgtb	xmm9, xmm1
	movdqa	xmm10, xmm1
	punpcklbw	xmm10, xmm9
	punpckhbw	xmm1, xmm9
	movdqa	xmm9, xmm8
	pcmpgtw	xmm12, xmm10
	movdqa	xmm13, xmm10
	punpcklwd	xmm9, xmm11
	paddd	xmm9, xmm4
	punpcklwd	xmm13, xmm12
	punpckhwd	xmm10, xmm12
	pand	xmm9, xmm13
	paddd	xmm9, xmm0
	movdqa	xmm0, xmm8
	movdqa	xmm8, xmm14
	punpckhwd	xmm0, xmm11
	movdqa	xmm11, xmm1
	paddd	xmm0, xmm4
	pand	xmm0, xmm10
	movdqa	xmm10, xmm3
	paddd	xmm0, xmm9
	pcmpgtw	xmm10, xmm1
	movdqa	xmm9, xmm3
	pcmpgtw	xmm9, xmm14
	punpcklwd	xmm11, xmm10
	punpckhwd	xmm1, xmm10
	punpcklwd	xmm8, xmm9
	punpckhwd	xmm2, xmm9
	paddd	xmm8, xmm4
	paddd	xmm2, xmm4
	pand	xmm8, xmm11
	pand	xmm1, xmm2
	paddd	xmm0, xmm8
	paddd	xmm0, xmm1
	cmp	rdx, rax
	jne	.L4
	movdqa	xmm1, xmm0
	mov	edx, ecx
	psrldq	xmm1, 8
	and	edx, -16
	paddd	xmm0, xmm1
	movdqa	xmm1, xmm0
	psrldq	xmm1, 4
	paddd	xmm0, xmm1
	movd	eax, xmm0
	test	cl, 15
	je	.L1
.L3:
	movsx	rsi, edx
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L28
.L7:
	lea	esi, 1[rdx]
	cmp	esi, ecx
	jge	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L29
.L8:
	lea	esi, 2[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L30
.L9:
	lea	esi, 3[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L31
.L10:
	lea	esi, 4[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L11
	lea	eax, -48[rax+rsi]
.L11:
	lea	esi, 5[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L12
	lea	eax, -48[rax+rsi]
.L12:
	lea	esi, 6[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L13
	lea	eax, -48[rax+rsi]
.L13:
	lea	esi, 7[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L32
.L14:
	lea	esi, 8[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L33
.L15:
	lea	esi, 9[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L34
.L16:
	lea	esi, 10[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L35
.L17:
	lea	esi, 11[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L36
.L18:
	lea	esi, 12[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L19
	lea	eax, -48[rax+rsi]
.L19:
	lea	esi, 13[rdx]
	cmp	ecx, esi
	jle	.L1
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rbx+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L20
	lea	eax, -48[rax+rsi]
.L20:
	add	edx, 14
	cmp	ecx, edx
	jle	.L1
	movsx	rdx, edx
	movsx	edx, BYTE PTR [rbx+rdx]
	lea	ecx, -49[rdx]
	cmp	cl, 8
	ja	.L1
	lea	eax, -48[rax+rdx]
.L1:
	pop	rbx
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	lea	eax, -48[rax+rsi]
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L29:
	lea	eax, -48[rax+rsi]
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L30:
	lea	eax, -48[rax+rsi]
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L31:
	lea	eax, -48[rax+rsi]
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L32:
	lea	eax, -48[rax+rsi]
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L33:
	lea	eax, -48[rax+rsi]
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L34:
	lea	eax, -48[rax+rsi]
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L35:
	lea	eax, -48[rax+rsi]
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L36:
	lea	eax, -48[rax+rsi]
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L23:
	xor	eax, eax
	pop	rbx
	ret
.L24:
	xor	edx, edx
	xor	eax, eax
	jmp	.L3
	.size	task, .-task
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Random string: %s"
	.text
	.p2align 4
	.globl	task_random
	.type	task_random, @function
task_random:
	push	r12
	push	rbp
	mov	ebp, edi
	push	rbx
	sub	rsp, 272
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 264[rsp], rax
	xor	eax, eax
	mov	rbx, rsp
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	test	ebp, ebp
	jle	.L38
	lea	eax, -1[rbp]
	mov	r12, rbx
	lea	rbp, 1[rsp+rax]
	.p2align 4,,10
	.p2align 3
.L39:
	call	rand@PLT
	add	r12, 1
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, 738919105
	sar	ecx, 31
	sar	rdx, 36
	sub	edx, ecx
	imul	edx, edx, 93
	sub	eax, edx
	add	eax, 33
	mov	BYTE PTR -1[r12], al
	cmp	r12, rbp
	jne	.L39
.L38:
	mov	rdx, rbx
	lea	rsi, .LC3[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	rdx, rbx
.L40:
	mov	ecx, DWORD PTR [rdx]
	add	rdx, 4
	lea	eax, -16843009[rcx]
	not	ecx
	and	eax, ecx
	and	eax, -2139062144
	je	.L40
	mov	ecx, eax
	shr	ecx, 16
	test	eax, 32896
	cmove	eax, ecx
	lea	rcx, 2[rdx]
	cmove	rdx, rcx
	mov	edi, eax
	add	dil, al
	sbb	rdx, 3
	sub	rdx, rbx
	mov	ecx, edx
	je	.L63
	mov	esi, edx
	sub	edx, 1
	cmp	edx, 14
	jbe	.L64
	mov	eax, ecx
	pxor	xmm0, xmm0
	pxor	xmm5, xmm5
	movdqa	xmm7, XMMWORD PTR .LC0[rip]
	shr	eax, 4
	movdqa	xmm6, XMMWORD PTR .LC1[rip]
	movdqa	xmm4, XMMWORD PTR .LC2[rip]
	pxor	xmm3, xmm3
	sal	rax, 4
	add	rax, rbx
	.p2align 4,,10
	.p2align 3
.L44:
	movdqa	xmm1, XMMWORD PTR [rbx]
	movdqa	xmm2, xmm5
	movdqa	xmm11, xmm3
	movdqa	xmm12, xmm3
	add	rbx, 16
	pcmpgtb	xmm2, xmm1
	movdqa	xmm8, xmm1
	movdqa	xmm14, xmm1
	paddb	xmm1, xmm7
	movdqa	xmm9, xmm1
	pminub	xmm9, xmm6
	punpcklbw	xmm8, xmm2
	punpckhbw	xmm14, xmm2
	pcmpeqb	xmm1, xmm9
	movdqa	xmm9, xmm5
	movdqa	xmm2, xmm14
	pcmpgtw	xmm11, xmm8
	pcmpgtb	xmm9, xmm1
	movdqa	xmm10, xmm1
	punpcklbw	xmm10, xmm9
	punpckhbw	xmm1, xmm9
	movdqa	xmm9, xmm8
	pcmpgtw	xmm12, xmm10
	movdqa	xmm13, xmm10
	punpcklwd	xmm9, xmm11
	paddd	xmm9, xmm4
	punpcklwd	xmm13, xmm12
	punpckhwd	xmm10, xmm12
	pand	xmm9, xmm13
	paddd	xmm9, xmm0
	movdqa	xmm0, xmm8
	movdqa	xmm8, xmm14
	punpckhwd	xmm0, xmm11
	movdqa	xmm11, xmm1
	paddd	xmm0, xmm4
	pand	xmm0, xmm10
	movdqa	xmm10, xmm3
	paddd	xmm0, xmm9
	pcmpgtw	xmm10, xmm1
	movdqa	xmm9, xmm3
	pcmpgtw	xmm9, xmm14
	punpcklwd	xmm11, xmm10
	punpckhwd	xmm1, xmm10
	punpcklwd	xmm8, xmm9
	punpckhwd	xmm2, xmm9
	paddd	xmm8, xmm4
	paddd	xmm2, xmm4
	pand	xmm8, xmm11
	pand	xmm1, xmm2
	paddd	xmm0, xmm8
	paddd	xmm0, xmm1
	cmp	rbx, rax
	jne	.L44
	movdqa	xmm1, xmm0
	mov	edx, esi
	psrldq	xmm1, 8
	and	edx, -16
	and	esi, 15
	paddd	xmm0, xmm1
	movdqa	xmm1, xmm0
	psrldq	xmm1, 4
	paddd	xmm0, xmm1
	movd	eax, xmm0
	je	.L37
.L43:
	movsx	rsi, edx
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L72
.L46:
	lea	esi, 1[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L73
.L47:
	lea	esi, 2[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L74
.L48:
	lea	esi, 3[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L75
.L49:
	lea	esi, 4[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L50
	lea	eax, -48[rax+rsi]
.L50:
	lea	esi, 5[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L51
	lea	eax, -48[rax+rsi]
.L51:
	lea	esi, 6[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L52
	lea	eax, -48[rax+rsi]
.L52:
	lea	esi, 7[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L76
.L53:
	lea	esi, 8[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L77
.L54:
	lea	esi, 9[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L78
.L55:
	lea	esi, 10[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L79
.L56:
	lea	esi, 11[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L80
.L57:
	lea	esi, 12[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L58
	lea	eax, -48[rax+rsi]
.L58:
	lea	esi, 13[rdx]
	cmp	ecx, esi
	jle	.L37
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L59
	lea	eax, -48[rax+rsi]
.L59:
	add	edx, 14
	cmp	ecx, edx
	jle	.L37
	movsx	rdx, edx
	movsx	edx, BYTE PTR [rsp+rdx]
	lea	ecx, -49[rdx]
	cmp	cl, 8
	ja	.L37
	lea	eax, -48[rax+rdx]
	.p2align 4,,10
	.p2align 3
.L37:
	mov	rdi, QWORD PTR 264[rsp]
	xor	rdi, QWORD PTR fs:40
	jne	.L81
	add	rsp, 272
	pop	rbx
	pop	rbp
	pop	r12
	ret
	.p2align 4,,10
	.p2align 3
.L72:
	lea	eax, -48[rax+rsi]
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L73:
	lea	eax, -48[rax+rsi]
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L74:
	lea	eax, -48[rax+rsi]
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L75:
	lea	eax, -48[rax+rsi]
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L76:
	lea	eax, -48[rax+rsi]
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L77:
	lea	eax, -48[rax+rsi]
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L78:
	lea	eax, -48[rax+rsi]
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L79:
	lea	eax, -48[rax+rsi]
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L80:
	lea	eax, -48[rax+rsi]
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L63:
	xor	eax, eax
	jmp	.L37
.L64:
	xor	eax, eax
	xor	edx, edx
	jmp	.L43
.L81:
	call	__stack_chk_fail@PLT
	.size	task_random, .-task_random
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Your string (maximum 256 characters):"
	.text
	.p2align 4
	.globl	task_cmd
	.type	task_cmd, @function
task_cmd:
	push	rbx
	lea	rsi, .LC4[rip]
	mov	edi, 1
	sub	rsp, 272
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 264[rsp], rax
	xor	eax, eax
	mov	rbx, rsp
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	fflush@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	mov	rdx, QWORD PTR stdin[rip]
	mov	esi, 256
	mov	rdi, rbx
	call	fgets@PLT
	mov	rax, rbx
.L83:
	mov	ecx, DWORD PTR [rax]
	add	rax, 4
	lea	edx, -16843009[rcx]
	not	ecx
	and	edx, ecx
	and	edx, -2139062144
	je	.L83
	mov	ecx, edx
	shr	ecx, 16
	test	edx, 32896
	cmove	edx, ecx
	lea	rcx, 2[rax]
	cmove	rax, rcx
	mov	edi, edx
	add	dil, dl
	sbb	rax, 3
	sub	rax, rbx
	mov	ecx, eax
	je	.L107
	mov	esi, eax
	sub	eax, 1
	cmp	eax, 14
	jbe	.L108
	mov	edx, ecx
	mov	rax, rbx
	pxor	xmm0, xmm0
	movdqa	xmm6, XMMWORD PTR .LC0[rip]
	shr	edx, 4
	movdqa	xmm5, XMMWORD PTR .LC1[rip]
	pxor	xmm4, xmm4
	pxor	xmm2, xmm2
	sal	rdx, 4
	movdqa	xmm3, XMMWORD PTR .LC2[rip]
	add	rdx, rbx
	.p2align 4,,10
	.p2align 3
.L87:
	movdqa	xmm1, XMMWORD PTR [rax]
	movdqa	xmm8, xmm4
	movdqa	xmm11, xmm2
	movdqa	xmm12, xmm2
	add	rax, 16
	pcmpgtb	xmm8, xmm1
	movdqa	xmm7, xmm1
	movdqa	xmm14, xmm1
	paddb	xmm1, xmm6
	movdqa	xmm9, xmm1
	pminub	xmm9, xmm5
	punpcklbw	xmm7, xmm8
	punpckhbw	xmm14, xmm8
	pcmpeqb	xmm1, xmm9
	pcmpgtw	xmm11, xmm7
	movdqa	xmm9, xmm4
	pcmpgtb	xmm9, xmm1
	movdqa	xmm10, xmm1
	punpcklbw	xmm10, xmm9
	punpckhbw	xmm1, xmm9
	movdqa	xmm9, xmm7
	pcmpgtw	xmm12, xmm10
	movdqa	xmm13, xmm10
	punpcklwd	xmm9, xmm11
	paddd	xmm9, xmm3
	punpcklwd	xmm13, xmm12
	punpckhwd	xmm10, xmm12
	pand	xmm9, xmm13
	paddd	xmm9, xmm0
	movdqa	xmm0, xmm7
	movdqa	xmm7, xmm14
	punpckhwd	xmm0, xmm11
	movdqa	xmm11, xmm1
	paddd	xmm0, xmm3
	pand	xmm0, xmm10
	movdqa	xmm10, xmm2
	paddd	xmm0, xmm9
	pcmpgtw	xmm10, xmm1
	movdqa	xmm9, xmm2
	pcmpgtw	xmm9, xmm14
	punpcklwd	xmm11, xmm10
	punpcklwd	xmm7, xmm9
	paddd	xmm7, xmm3
	pand	xmm7, xmm11
	paddd	xmm0, xmm7
	movdqa	xmm7, xmm1
	movdqa	xmm1, xmm14
	punpckhwd	xmm1, xmm9
	punpckhwd	xmm7, xmm10
	paddd	xmm1, xmm3
	pand	xmm1, xmm7
	paddd	xmm0, xmm1
	cmp	rax, rdx
	jne	.L87
	movdqa	xmm1, xmm0
	mov	edx, esi
	psrldq	xmm1, 8
	and	edx, -16
	and	esi, 15
	paddd	xmm0, xmm1
	movdqa	xmm1, xmm0
	psrldq	xmm1, 4
	paddd	xmm0, xmm1
	movd	eax, xmm0
	je	.L82
.L86:
	movsx	rsi, edx
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L113
.L90:
	lea	esi, 1[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L114
.L91:
	lea	esi, 2[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L115
.L92:
	lea	esi, 3[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L116
.L93:
	lea	esi, 4[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L94
	lea	eax, -48[rax+rsi]
.L94:
	lea	esi, 5[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L95
	lea	eax, -48[rax+rsi]
.L95:
	lea	esi, 6[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L96
	lea	eax, -48[rax+rsi]
.L96:
	lea	esi, 7[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L117
.L97:
	lea	esi, 8[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L118
.L98:
	lea	esi, 9[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L119
.L99:
	lea	esi, 10[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L120
.L100:
	lea	esi, 11[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	jbe	.L121
.L101:
	lea	esi, 12[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L102
	lea	eax, -48[rax+rsi]
.L102:
	lea	esi, 13[rdx]
	cmp	ecx, esi
	jle	.L82
	movsx	rsi, esi
	movsx	esi, BYTE PTR [rsp+rsi]
	lea	edi, -49[rsi]
	cmp	dil, 8
	ja	.L103
	lea	eax, -48[rax+rsi]
.L103:
	add	edx, 14
	cmp	ecx, edx
	jle	.L82
	movsx	rdx, edx
	movsx	edx, BYTE PTR [rsp+rdx]
	lea	ecx, -49[rdx]
	cmp	cl, 8
	ja	.L82
	lea	eax, -48[rax+rdx]
	.p2align 4,,10
	.p2align 3
.L82:
	mov	rbx, QWORD PTR 264[rsp]
	xor	rbx, QWORD PTR fs:40
	jne	.L122
	add	rsp, 272
	pop	rbx
	ret
	.p2align 4,,10
	.p2align 3
.L113:
	lea	eax, -48[rax+rsi]
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L114:
	lea	eax, -48[rax+rsi]
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L115:
	lea	eax, -48[rax+rsi]
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L116:
	lea	eax, -48[rax+rsi]
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L117:
	lea	eax, -48[rax+rsi]
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L118:
	lea	eax, -48[rax+rsi]
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L119:
	lea	eax, -48[rax+rsi]
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L120:
	lea	eax, -48[rax+rsi]
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L121:
	lea	eax, -48[rax+rsi]
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L107:
	xor	eax, eax
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L108:
	xor	eax, eax
	xor	edx, edx
	jmp	.L86
.L122:
	call	__stack_chk_fail@PLT
	.size	task_cmd, .-task_cmd
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.byte	-49
	.align 16
.LC1:
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.align 16
.LC2:
	.long	-48
	.long	-48
	.long	-48
	.long	-48
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
