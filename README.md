# Computer-Architecture-HW2. <br/> Выполнил Федоров Артём БПИ217.

## Processing of character strings <br/>


---- 
<br/>

## Структура репозитория:
* [C Files](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files) - содержит реализацию задачи на C

* [Assembler](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler) - содержит __не__ модифицированный код на Ассемблере

* [Assembler_mod](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod) - содержит модифицированный код на Ассемблере c комментариями к коду

__Заметка 1:__ В папке [_Assembler_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler) содержится файл [_Readme.md_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler/Readme.md) со списком переменных и их адресами в памяти (эквиваленты Си и Ассемблера)

__Заметка 2:__ В папке [_Assembler_mod_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod) содержится файл [_Readme.md_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/Readme.md) со списком изменений (модификаций) после преобразования из первичного Ассемблера в модифицированный.

***Примечание:*** Программа разрабатывалась сразу на 9 баллов, поэтому ссылка в каждом разделе будет на одинаковые файлы 

## Первоначальная компиляция:

### Создаем main.o и lib.o:

```
gcc main.s -c -o main.o
gcc lib.s -c -o lib.o
gcc main.o lib.o -o program.exe
```

Либо другие названия файлов, если вы собираетесь тестировать другую версию программы.

## Как устроена программа:
1. Если вы хотите протестировать консольный ввод или встроенный рандомный генератор, вам следует ввести команду:

```
./file_name.exe
```

На экране появится меню с опцией тестирования:
* Введите 1 для автоматической генерации данных, символы строки будут от ! (int '!' = 33) до ~(int '~' = 127) ( (__Внимание:__ 1 <= length <= 256)
* Любое другое значение приведёт к ручному вводу данных через консоль <br/>


2. Если вы хотите протестировать файловый ввод одной строки, вам необходимо указать два аргумента командной строки - это будут имена файлов ввода и вывода:
```
./file_name.exe input.txt output.txt
```
input.txt - имя файла рядом с file_name.exe из которого будет прочитана одна строка.
output.txt - имя файла рядом с file_name.exe в который будет записан ответ = один инт.

3. Если же вы хотите протестировать работу программы с таймером на вашей строке, вам необходимо указать один аргумент командной строки - это будет строка, с которой будет выполнен task() 25млн раз:

# Отчёт 4 балла:
### 1. _Приведено решение задачи на Cи:_
__Написана программа на С, использующая 2 единицы компиляции (main.c lib.c):__
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/main.c)
> * [lib.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/lib.c)

<br/>

### 2. _Немодифицированная ассемблерная программа с комментариями:_
__Программа проассемблирована и откомпилирована без оптимизирующих опций:__
> * [main.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler/main.s)
> * [lib.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler/lib.s)

__Добавлены комментарии и удобный список, поясняющий эквивалентное представление переменных на С в Ассемблере.__
> [Список переменных](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler/Readme.md)

<br/>

### 3. _Модифицированная ассемблерная программа с комментариями:_
__Программа промодифицирована вручную:__
> [Список изменений](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/Readme.md)

__Модифицированная программа:__
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s)
> * [lib_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/lib_mod.s)

<br/>

### 4. _Тестирование:_
> [Ссылка](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Tests.md) <br/>
> По результатам нескольких тестов сравнения программ на Ассемблере и Модифицированном Ассемблере можно легко заметить, что программы отработали идетично и без ошибок, поэтому делаем вывод, что модификация программы проведена успешно.


---- 
<br/>


# Отчёт 5 баллов:
### 1. _Решение на Cи с передачей данных в функции через параметры + локальные переменные:_
В программе присутствуют три функции: int task(const char *str), int task_random(int length) и int task_cmd() с соответствующими параметрами. Используются локальные переменные.
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/main.c)
> * [lib.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/lib.c)

<br/>

### 2. _Ассемблерная программа с комментариями_:
Добавлены комментарии, описывающие передачу параметров и перенос возвращаемого результат <br/>
Была прокоментированна связь между параметрами языка Си и регистрами по правилам: <br/>
> 1)  eax/rax - для запоминания/аккумулирования данных
> 2)  rdi - первый аргумент в функции / edi - argc
> 3)  rsi/esi - второй аргумент в функции (esi - так как передаю "маленький" length, а не массив)
> 4)  rdx - третий аргумент в функции
> 5)  rcx - счётчик

> * [Список переменных в модифицированной программе](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/variables_mod.md)
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s)
> * [lib_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/lib_mod.s)


---- 
<br/>

# Отчёт 6 баллов:
### 1. _Решение на ассемблере с рефакторингом программы за счет максимального использования регистров процессор:_ <br/>
Добавлены комментарии на эквивалентное использование регистров вместо переменных: <br/>
Были реализованы все увиденные возможные замены локальных переменных на регистры процессора:
*   Добавлен r13d вместо перемеенной-итератора i в for в main()
*   Добавлен r12d вместо перемеенной-итератора i в for в task()
*   Добавлен r12d вместо перемеенной-итератора j в for в task_random()


> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s) <br/>
> * [lib_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/lib_mod.s) <br/>

<br/>

### 2. Тестирование:
> [Ссылка](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Tests.md) <br/>
> По результатам нескольких тестов сравнения программ на ассемблере и модифицированном ассемблере с регистрами можно легко заметить, что программы отработали идетично и без ошибок, поэтому делаем вывод, что эквивалентная замена переменных на регистры в программе была проведена успешно.

---- 
<br/>


# Отчёт 7 баллов:
### 1. _Решение на Cи с двумя единицами компиляции + использование аргументов коммандной строки для работы с файлами:_ <br/>
Три единиицы компиляции: main.c и lib.c:
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/main.c) <br/>
> * [lib.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/lib.c) <br/>

<br/>

### 2. _Решение на ассемблере с двумя единицами компиляции + использование аргументов коммандной строки для работы с файлами:_ <br/>
Использование аргументов командной строки:
>   При вызове файла запуска с одним аргументов, он будет считаться длиной массива. Именно столько чисел будет прочитано в формате %d из файла input.txt и будет выведен результат в output.txt. Подразумевается, что файлы находятся в одной папке с файлом запуска. Пример работы: "./result.exe 5" => 5 = length и из input.txt будет прочитано 5 цифр в формате %d.

Три единиицы компиляции: main_mod.s, task_mod.s, print_mod.s:
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s) <br/>
> * [lib_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/lib_mod.s) <br/>

<br/>

### 3. _Текстовые файлы:_ (перед использованием скачайте их и поместите рядом с исполняемым файлом)
> * [input1.txt](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/input1.txt)
> * [input2.txt](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/input2.txt)
> * [input3.txt](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/input3.txt)

---- 
<br/>

# Отчёт 8 баллов:
### 1. _Решение на Cи c генератором случайного набора данных + интерфейс для расширения анализа командной строки + режим с таймером и циклом на 25млн итераций:_
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/main.c) <br/>
> * [lib.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/lib.c) <br/>

<br/>

### 2. _Модифицированное решение на ассемблере c генератором случайного набора данных + интерфейс для расширения анализа командной строки + режим с таймером и циклом на 25млн итераций:_
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s) <br/>
> * [lib_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/lib_mod.s) <br/>

<br/>

### 5. _Тестирование:_
> * [Ссылка](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Tests.md)

---- 
<br/>

# Отчёт 9 баллов
> Первый тест: размер 56, 25млн итераций task(). <br/>
> Второй тест: размер 43, 25млн итераций task(). <br/>

| Тип программы  | Время работы первого теста  | Время работы второго теста  | Время работы третьего теста  | Размер исполняемого файла | Суммарное количество строк | 
| :---: | :---: | :---: | :---: | :---: | :---: | 
| [Программа на C](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files)  | 2726 ms  | 1694 ms  | _ ms  | 17.0 KiB  | 96 строк  | 
| [Программа на ассемблере без модификаций](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler)  | 2631 ms  | 1793 ms  | _ ms  | 17,0 KiB  | 433 строк  | 
| [Программа на ассемблере с модификациями](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod)  | 1357 ms  | 995 ms  | _ ms  | 16,8 KiB  | 376 строк  | 
