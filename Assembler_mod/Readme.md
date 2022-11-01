# Модификация была произведена только вручнею

## __main_mod.s__

###    Бесполезные переприсваивания:
*     - mov	eax, DWORD PTR -4[rbp]
      - mov	esi, eax
      + mov	esi, DWORD PTR -4[rbp]
      И так 8 раз по файлу
*     mov	rax, QWORD PTR -48[rbp]
	    add	rax, 16
      - mov	rdx, QWORD PTR [rax]
      + mov	rsi, QWORD PTR [rax]
	    mov	rax, QWORD PTR -48[rbp]
	    add	rax, 8
      - mov	rax, QWORD PTR [rax]
	    + mov	rdi, QWORD PTR [rax]
      - mov	rsi, rdx
	    - mov	rdi, rax
	    call	task_file@PLT
*     - mov	rdx, QWORD PTR -16[rbp]
	    - mov	rax, QWORD PTR -24[rbp]
	    - mov	rsi, rdx
	    - mov	rdi, rax
      + mov rsi, QWORD PTR -16[rbp]
      + mov rdi, QWORD PTR -24[rbp]


###    Регистры:
*     - mov	DWORD PTR -8[rbp], 0
      - add	DWORD PTR -8[rbp], 1
      - mov	eax, DWORD PTR -8[rbp]
      + mov	r12d, 0
      + add	r12d, 1
      + mov	eax, r12d
*     - mov	DWORD PTR -8[rbp], 0
      - add	DWORD PTR -8[rbp], 1
      - mov	eax, DWORD PTR -8[rbp]
      + mov	r12d, 0
      + add	r12d, 1
      + mov	eax, r12d
*     - mov	DWORD PTR -4[rbp], 0
      - add	DWORD PTR -4[rbp], 1
      - cmp	DWORD PTR -4[rbp], 4999999
      + mov	r12d, 0	
      + add	r12d, 1
      + cmp	r12d, 4999999

###    Просто удалено
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
       

## __file_mod.s__

###    Бесполезные переприсваивания:
*     mov	QWORD PTR -16[rbp], rax
      - mov rax, QWORD PTR -16[rbp]
      mov rdi, rax
*     mov	QWORD PTR -24[rbp], rax
      - mov rax, QWORD PTR -24[rbp]
      mov rdi, rax


###    Просто удалено
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
       


## __task_mod.s__

###    Регистры:
*     - mov	DWORD PTR -8[rbp], 0
	    - mov	eax, DWORD PTR -8[rbp]
      - add	DWORD PTR -8[rbp], 1
      - mov	eax, DWORD PTR -8[rbp]
      + mov	r12d, 0
      + mov	eax, r12d
      + add	r12d, 1
      + mov	eax, r12d


###    Просто удалено

*     cdqe 4 раза

*      .section	.note.gnu.property,"a"
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
        
 