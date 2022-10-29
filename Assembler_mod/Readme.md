# Для модификации была применена команда 
>     gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none name.с -o name.s
После чего все файлы были отредактированны вручную:
# main_mod.s

###    Бесполезные переприсваивания:
*     - mov rax, rsp
      - mov rbx, rax 
      + mov rbx, rsp
*     - mov rax, QWORD PTR -128[rbp] 
      - mov rdi, rax 
      + mov rdi, QWORD PTR -128[rbp]
*     - mov ecx, DWORD PTR -184[rbp]
      - mov esi, ecx
      + mov esi, DWORD PTR -184[rbp] 
*     - mov rax, QWORD PTR -112[rbp]
      - mov rdi, rax 
      + mov rdi, QWORD PTR -112[rbp]
*     - mov rax, QWORD PTR -88[rbp]
      - mov rdi, rax
      + mov rdi, QWORD PTR -88[rbp]
*     - mov eax, DWORD PTR -184[rbp]
      - mov esi, eax 
      + mov esi, DWORD PTR -184[rbp]
*     - mov ecx, DWORD PTR -184[rbp]
      - mov esi, ecx 
      + mov esi, DWORD PTR -184[rbp]
*     - mov rax, QWORD PTR -152[rbp]
      - mov rdi, rax 
      + mov rdi, QWORD PTR -152[rbp]
*     - mov edx, DWORD PTR -184[rbp]
      - mov esi, edx 
      + mov esi, DWORD PTR -184[rbp]
*     - mov rax, QWORD PTR -136[rbp]
      - mov rdi, rax 
      + mov rdi, QWORD PTR -136[rbp]
*     - mov eax, DWORD PTR -176[rbp]
      - mov esi, eax
      + mov esi, DWORD PTR -176[rbp]
*     - mov ecx, DWORD PTR -184[rbp]
      - mov esi, ecx
      + mov esi, DWORD PTR -184[rbp]
*     - mov rax, QWORD PTR -152[rbp]
      - mov rdi, rax 
      + mov rdi, QWORD PTR -152[rbp]
*     - mov edx, DWORD PTR -184[rbp]
      - mov esi, edx 
      + mov esi, DWORD PTR -184[rbp]
*     - mov rax, QWORD PTR -136[rbp]
      - mov rdi, rax 
      + mov rdi, QWORD PTR -136[rbp]
*     Удалены cdqe
*     Удалена канарейка: 
      В начале:
      - mov rax, QWORD PTR fs:40
      - mov QWORD PTR -56[rbp], rax
      В конце:
      - mov rbx, QWORD PTR -56[rbp]
      - xor rbx, QWORD PTR fs:40
      - je .L29
*     Из-за удаления канарейки метка .L28 становится пуста,
      поэтому её удаление с изменение вызовов .L28 на .L29 не изменит программу

###     С массивами:
*     В каждом объявлении массива аккуратно удалены лишние переменные
*     Например одно из таких бесполезных созданий (массив А[]):
      - sub rdx, 1
      - mov QWORD PTR -128[rbp], rdx
      - movsx rdx, eax
      - mov QWORD PTR -240[rbp], rdx
      - mov QWORD PTR -232[rbp], 0
      - movsx rdx, eax
      - mov QWORD PTR -256[rbp], rdx
      - mov QWORD PTR -248[rbp], 0
*     Удалены лишние команды перед созданием массива:
      - movsx rdx, eax
      - sub rdx, 1

# print_mod.s
*     Удалён cdqe
*     Много присваиваний в eax
      - mov eax, DWORD PTR -4[rbp] <br>
      - mov eax, DWORD PTR [rax] <br>
      - mov esi, eax <br>
      - mov eax, 0
      + mov esi, DWORD PTR [rax]

# task_mod.s
*     Удалены cdqe 
