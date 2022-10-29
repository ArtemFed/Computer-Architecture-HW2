# Computer-Architecture-HW2. <br/> Выполнил Федоров Артём БПИ217.

## Processing of character strings <br/>


---- 
<br/>

## Структура репозитория:
* [C Files](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files) - содержит реализацию задачи на C

* [Assembler](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler) - содержит __не__ модифицированный код на Ассемблере

* [Assembler_mod](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod) - содержит модифицированный код на Ассемблере c комментариями к коду

* [Modification with timer](https://github.com/ArtemFed/Computer-Architecture-HW2/tree/main/Modification%20with%20timer) - содержит три папки: 
> + Код на Си с таймером и циклом
> + Первичный код на ассемблере с таймером и циклом 
> + Модифицированный код на ассемблере с таймером и циклом

__Заметка 1:__ В папке [_Assembler_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler) содержится файл [_variables.md_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler/variables.md) со списком переменных и их адресами в памяти (эквиваленты Си и Ассемблера)

__Заметка 2:__ В папке [_Assembler_mod_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod) содержится файл [_variables_mod.md_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/variables_mod.md) со списком переменных и их адресами в памяти (эквиваленты Си и модифицированного Ассемблера)

__Заметка 3:__ В папке [_Assembler_mod_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod) содержится файл [_Readme.md_](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/Readme.md) со списко изменений (модификаций) после преобразования из первичного Ассемблера в модифицированный.

***Примечание:*** Программа разрабатывалась сразу на 8 баллов (Программа с таймером на 9 баллов лежит в папке [_Modification with timer_](https://github.com/ArtemFed/Computer-Architecture-HW2/tree/main/Modification%20with%20timer)), поэтому во всех ссылках на файлы фигурируют __только файлы версии на 8 баллов__, но с комментариями.

## Первоначальная компиляция:

### Создаем main.o, task.o и print.o:

```
gcc main.s -c -o main.o
gcc task.s -c -o task.o
gcc print.s -c -o print.o
gcc main.o task.o print.o -o program.exe
```

Либо другие названия файлов, если вы собираетесь тестировать другую версию программы.

## Как устроена программа:
1. Если вы хотите протестировать консольный ввод или встроенный рандомный генератор, вам следует ввести команду:
```
./file_name.exe
```
Далее вас попросят ввести length входного массива. <br/>

__Внимание:__ 1 <= length <= 20 (или до 100, если в режиме работы с таймером)

Затем на экране появится меню с опцией тестирования:
* Введите 1 для автоматической генерации данных, элементы массива будут от 0 до 9
* Любое другое значение приведёт к ручному вводу данных через консоль <br/>


2. Если же вы хотите протестировать файловый ввод массива, вам необходимо указать один аргумент командной строки - это будет значение length, сколько элементов нужно прочитать из файла в формате %d:
```
./file_name.exe length
```
length - размер вашего массив, например, 6.

# Отчёт 4 балла:
### 1. _Приведено решение задачи на Cи:_
__Написана программа на С, использующая 3 единицы компиляции (main.c task.c print.c):__
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/main.c)
> * [task.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/task.c)
> * [print.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/print.c)

<br/>

### 2. _Немодифицированная ассемблерная программа с комментариями:_
__Программа проассемблирована и откомпилирована без оптимизирующих опций:__
> * [main.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler/main.s)
> * [task.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler/task.s)
> * [print.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler/print.s)

__Добавлены комментарии и удобный список, поясняющий эквивалентное представление переменных на С в Ассемблере.__
> [Список переменных](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler/variables.md)

<br/>

### 3. _Модифицированная ассемблерная программа с комментариями:_
__Программа промодифицирована флагами компиляции, затем изменена вручную:__
> [Список изменений](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/Readme.md)

__Для удобства предоставляю новый список переменных:__
> [Список переменных в модифицированной программе](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/variables_mod.md)

__Модифицированная программа:__
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s)
> * [task_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/task_mod.s)
> * [print_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/print_mod.s)

<br/>

### 4. _Тестирование:_
> [Ссылка](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Tests.md) <br/>
> По результатам трёх тестов сравнения программ на Ассемблере и Модифицированном Ассемблере можно легко заметить, что программы отработали идетично и без ошибок, поэтому делаем вывод, что модификация программы проведена успешно.


---- 
<br/>


# Отчёт 5 баллов:
### 1. _Решение на Cи с передачей данных в функции через параметры + локальные переменные:_
В программе присутствуют две функции: task(*A[], length, *B[]) и print_arr(*B[], length) с соответствующими параметрами. Используются локальные переменные.
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/main.c)
> * [task.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/task.c)
> * [print.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/print.c)

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
> * [task_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/task_mod.s)
> * [print_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/print_mod.s)


---- 
<br/>

# Отчёт 6 баллов:
### 1. _Решение на ассемблере с рефакторингом программы за счет максимального использования регистров процессор:_ <br/>
Добавлены комментарии на эквивалентное использование регистров вместо переменных: <br/>
Были реализованы все увиденные возможные замены локальных переменных на регистры процессора:
*   Добавлены r12d вместо перемеенных итераторов i в for (во всех файлах)
*   Поток "input.txt" был сохранён в r11
*   Поток "output.txt" был сохранён в r14
*   _замена length не удалась, привела к Segmentation fault_

> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s) <br/>
> * [task_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/task_mod.s) <br/>
> * [print_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/print_mod.s) <br/>

<br/>

### 2. Тестирование:
> [Ссылка](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Tests.md) <br/>
> По результатам нескольких тестов сравнения программ на ассемблере и модифицированном ассемблере с регистрами можно легко заметить, что программы отработали идетично и без ошибок, поэтому делаем вывод, что эквивалентная замена переменных на регистры в программе была проведена успешно.

---- 
<br/>


# Отчёт 7 баллов:
### 1. _Решение на Cи с тремя единицами компиляции + использование аргументов коммандной строки для работы с файлами (ввод значения length для чтения элементов из input.txt):_ <br/>
Три единиицы компиляции: main.c, task.c, print.c:
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/main.c) <br/>
> * [task.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/task.c) <br/>
> * [print.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/print.c) <br/>

<br/>

### 2. _Решение на ассемблере с тремя единицами компиляции + использование аргументов коммандной строки для работы с файлами (ввод значения length для чтения элементов из input.txt):_ <br/>
Использование аргументов командной строки:
>   При вызове файла запуска с одним аргументов, он будет считаться длиной массива. Именно столько чисел будет прочитано в формате %d из файла input.txt и будет выведен результат в output.txt. Подразумевается, что файлы находятся в одной папке с файлом запуска. Пример работы: "./result.exe 5" => 5 = length и из input.txt будет прочитано 5 цифр в формате %d.

Три единиицы компиляции: main_mod.s, task_mod.s, print_mod.s:
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s) <br/>
> * [task_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/task_mod.s) <br/>
> * [print_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/print_mod.s) <br/>

<br/>

### 3. _Текстовые файлы:_ (перед использованием скачайте их и поместите рядом с исполняемым файлом)
> * [input.txt](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/input.txt)
> * [output.txt](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/output.txt)

---- 
<br/>

# Отчёт 8 баллов:
### 1. _Решение на Cи c генератором случайного набора данных + интерфейс для расширения анализа командной строки:_
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/main.c) <br/>
> * [task.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/task.c) <br/>
> * [print.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/C%20Files/print.c) <br/>

<br/>

### 2. _Модифицированное решение на ассемблере c генератором случайного набора данных + интерфейс для расширения анализа командной строки:_
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s) <br/>
> * [task_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/task_mod.s) <br/>
> * [print_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/print_mod.s) <br/>

<br/>

### 3. _Решение на Cи c таймером и циклом на 10млн итераций:_
> * [main_timer.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Modification%20with%20timer/C%20+%20timer/main_timer.c)
> * [task_timer.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Modification%20with%20timer/C%20+%20timer/task_timer.c)
> * [print_timer.c](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Modification%20with%20timer/C%20+%20timer/print_timer.c)

<br/>

### 4. _Модифицированное решение на ассемблере c таймером и циклом на 10млн итераций:_
> * [main_timer_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Modification%20with%20timer/Assembler_mod%20+%20timer/main_timer_mod.s)
> * [task_timer_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Modification%20with%20timer/Assembler_mod%20+%20timer/task_timer_mod.s)
> * [print_timer_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Modification%20with%20timer/Assembler_mod%20+%20timer/print_timer_mod.s)

<br/>

### 5. _Тестирование:_
> * [Ссылка](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Tests.md)

---- 
<br/>

# Отчёт 9 баллов
> Первый тест: размер 100, 10млн итераций function. <br/>
> Второй тест: размер 100, 10млн итераций function. <br/>
> Третий тест: размер  50, 10млн итераций function. <br/>

| Тип программы  | Время работы первого теста  | Время работы второго теста  | Время работы третьего теста  | Размер исполняемого файла | Суммарное количество строк | 
| :---: | :---: | :---: | :---: | :---: | :---: | 
| [Программа на C с замером времени](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Modification%20with%20timer/C%20+%20timer)  | 4774мс  | 4415мс  | 2094мс  | 17KiB  | 96 строк  | 
| [Программа на ассемблере без модификаций с замером времени](https://github.com/ArtemFed/Computer-Architecture-HW2/tree/main/Modification%20with%20timer/Assembler%20%2B%20timer)  | 3776 ms  | 3833 ms  | 1735 ms  | 16,9 KiB  | 623 строк  | 
| [Программа на ассемблере с модификациями с замером времени](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Modification%20with%20timer/Assembler_mod%20+%20timer)  | 1752 ms  | 1766 ms  | 1005 ms  | 16,8 KiB  | 580 строк  | 
