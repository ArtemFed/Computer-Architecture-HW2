# main:
-56 = канарейка <br/>
-72 = srand(sec.tv_nsec); <br/>
-80 = struct timespec sec; <br/>
-88 = поток "output.txt" <br/>
-128 = поток "input.txt" <br/>
-164 = i в for с fscanf <br/>
-168 = i в for с fprintf <br/>
-180 = answer <br/>
-184 = length <br/>
-196 = argc <br/>
-208 = argv <br/>
r14 = копия потока "output.txt" <br/>
r11 = копия потока "input.txt" <br/>
r12d = i в for-ах (переиспользуется) <br/>

-112 = указаткль намассив A[] с аргументов командной 
строки и его переменные <br/>

-96 = указаткль на массив B[] с аргументов командной 
строки и его переменные <br/>

-152 = указаткль на массив A[] <br/>

-136 = указаткль на массив B[] <br/>

# print:
rdi - входной параметр массива B[] <br/>
esi - входной параметр length <br/>
-24 = указаткль на массив B[] <br/>
-28 = length <br/>
r12d = i в for c printf("%d ", B[i]); <br/>

# task:
rdi - входной параметр массива B[] <br/>
esi - входной параметр length <br/>
esi - входной параметр length <br/>
-24 = указаткль на массив A[] <br/>
-28 = length <br/>
-40 = указаткль на массив B[] <br/>
r12d = count; <br/>
