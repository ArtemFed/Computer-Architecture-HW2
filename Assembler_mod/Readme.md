# Для модификации была применена команда 
>     gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none name.с -o name.s
После чего все файлы были отредактированны вручную:
# main_mod.s

###    Бесполезные переприсваивания:
*     - mov	eax, DWORD PTR -4[rbp]
	- mov	esi, eax
      + mov	esi, DWORD PTR -4[rbp]
*     - mov	eax, DWORD PTR -4[rbp]
	- mov	esi, eax
      + mov	esi, DWORD PTR -4[rbp]
*     - mov	eax, DWORD PTR -8[rbp]
	- mov	edi, eax
      + mov	edi, DWORD PTR -8[rbp]
*     - mov	eax, DWORD PTR -8[rbp]
	- mov	edi, eax
      + mov	edi, DWORD PTR -8[rbp]


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
      > 	.section	.note.gnu.property,"a"
      > 	.align 8
      > 	.long	 1f - 0f
      > 	.long	 4f - 1f
      > 	.long	 5
      > 0:
      > 	.string	 "GNU"
      > 1:
      > 	.align 8
      > 	.long	 0xc0000002
      > 	.long	 3f - 2f
      > 2:
      > 	.long	 0x3
      > 3:
      > 	.align 8
      > 4:
      > 

# file_mod.s

###    Бесполезные переприсваивания:
*     - mov rax, QWORD PTR -16[rbp]
	- mov rdi, rax
	+ mov rdi, QWORD PTR -16[rbp]
*     - mov rax, QWORD PTR -16[rbp]
	- mov rdi, rax
      + mov rdi, QWORD PTR -16[rbp]
*     - mov	rax, QWORD PTR -24[rbp]
	- mov	rdi, rax
      + mov rdi, QWORD PTR -24[rbp]

###    Регистры:
*     - 

###    Просто удалено
      > 	.section	.note.gnu.property,"a"
      > 	.align 8
      > 	.long	 1f - 0f
      > 	.long	 4f - 1f
      > 	.long	 5
      > 0:
      > 	.string	 "GNU"
      > 1:
      > 	.align 8
      > 	.long	 0xc0000002
      > 	.long	 3f - 2f
      > 2:
      > 	.long	 0x3
      > 3:
      > 	.align 8
      > 4:
      > 


# task_mod.s
###    Бесполезные переприсваивания:
*     - mov rax, rsp
      - mov rbx, rax 
      + mov rbx, rsp

###    Регистры:
*     - mov	DWORD PTR -8[rbp], 0
      - add	DWORD PTR -8[rbp], 1
      - mov	eax, DWORD PTR -8[rbp]
      + mov	r12d, 0
      + add	r12d, 1
      + mov	eax, r12d
*     - 

###    Просто удалено
      > 	.section	.note.gnu.property,"a"
      > 	.align 8
      > 	.long	 1f - 0f
      > 	.long	 4f - 1f
      > 	.long	 5
      > 0:
      > 	.string	 "GNU"
      > 1:
      > 	.align 8
      > 	.long	 0xc0000002
      > 	.long	 3f - 2f
      > 2:
      > 	.long	 0x3
      > 3:
      > 	.align 8
      > 4:
      > 
