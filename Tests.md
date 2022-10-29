# 4 балла

### Тесты:
1. Тест 1 - Random <br/>
 > * Без модификаций: <br/>
 > <img width="400" alt="test_1_not_mod" src="https://user-images.githubusercontent.com/57373162/196995941-6beb2532-883f-414f-95cd-0aa531501a06.png"> <br/>
 > * С модификациями: <br/>
 > <img width="400" alt="test_1_mod" src="https://user-images.githubusercontent.com/57373162/196996037-41d13d69-49a4-43ed-99f8-bdd7cfc2d261.png"> <br/>
2. Тест 2 - А = [5, -10, 2, 0] <br/>
 > * Без модификаций: <br/>
 > <img width="400" alt="test_2_not_mod" src="https://user-images.githubusercontent.com/57373162/196997528-c065d1fd-1711-49e4-9175-a0006bfe2f04.png"> <br/>
 > * С модификациями: <br/>
 > <img width="400" alt="test_2_mod" src="https://user-images.githubusercontent.com/57373162/196997487-f1b85172-13a4-4616-bf36-30bb368edf6c.png"> <br/>
3. Тест 3 - некорректный ручной ввод length = 25 ( при length <= 20 по условию ) <br/>
 > * Без модификаций: <br/>
 > <img width="400" alt="test_3_not_mod" src="https://user-images.githubusercontent.com/57373162/196997922-332e0fe7-bf2d-43b5-8fa3-108935dadab6.png"> <br/>
 > * С модификациями: <br/>
 > <img width="400" alt="test_3_mod" src="https://user-images.githubusercontent.com/57373162/196997940-3b0140a3-fb75-4dd8-b1b2-f9c626665ba4.png"> <br/>

----

# 6 баллов
1. Тест 1 - А = [20, -30, 0, 1] <br/>
 > * Без модификаций: <br/>
 > <img width="400" alt="test6_1_s" src="https://user-images.githubusercontent.com/57373162/197086170-4a7bb66e-7a7f-4117-b075-74fcbc914e11.png"><br/>
 > * С модификациями: <br/>
 > <img width="400" alt="test6_1_mod" src="https://user-images.githubusercontent.com/57373162/197086217-3c3840fa-b91c-4369-be13-5313f691c4ea.png"> <br/>
2. Тест 2 - А = [-1, -2, -3, 10, 0, -5] <br/>
 > * Без модификаций: <br/>
 > <img width="400" alt="test6_2_s" src="https://user-images.githubusercontent.com/57373162/197086362-98ef48bc-9715-4023-b5a1-1b96449298b3.png"> <br/>
 > * С модификациями: <br/>
 > <img width="400" alt="test6_2_mod" src="https://user-images.githubusercontent.com/57373162/197086332-2207b184-c7fb-4b79-bccd-1087148ce99d.png"> <br/>

----

# 7 баллов
1. Тест работы с файлами:
 > <img width="400" alt="files_test" src="https://user-images.githubusercontent.com/57373162/197297946-ff5e0caa-4cc1-4a45-9194-ac836954aaff.png">

----

# 8 баллов
1. Тест работы модифицированной программы с выполнением функции task() 10млн раз на массиве А длины 100: (ввод выглядит не очень красиво, так как планировался поэлементовый ввод)
 > * Си программа: <br/>
 > <img width="454" alt="huge_test_c" src="https://user-images.githubusercontent.com/57373162/197298533-766504d4-5234-408e-9654-0cd9c73e225b.png"> <br/>
 > * Ассемблер с модификациями: <br/>
 > <img width="608" alt="huge_test_assembler" src="https://user-images.githubusercontent.com/57373162/197298595-58443db7-eba9-4b67-b725-6135fbb0709c.png"> <br/>
 > На тесте: A =[9 9 8 8 1 6 8 3 5 6 8 5 1 5 5 2 10 1 8 3 1 1 2 7 7 4 8 6 10 1 3 9 10 10 6 10 6 3 3 1 9 10 5 9 4 9 10 4 9 7 6 10 8 7 7 4 1 4 10 10 5 2 8 4 2 4 4 7 7 6 7 5 6 1 3 9 9 3 3 8 10 8 8 8 5 4 2 5 7 1 5 2 3 3 5 4 6 9 1 2]
2. Так же было протестировано на трёх тестах, результат отображён в отчёте, в таблице, на 9 баллов
 >  * На тесте: A =[0 7 7 6 1 5 10 8 6 8 7 3 8 0 7 5 1 10 8 7 6 0 9 5 1 5 7 2 3 3 10 4 0 6 0 2 1 10 0 8 8 7 0 5 7 8 10 9 8 8 5 4 8 4 9 10 10 5 2 3 9 1 7 10 8 7 1 9 7 1 6 5 8 7 10 5 5 10 3 2 8 9 6 6 2 4 6 1 10 8 4 9 9 1 8 6 9 9 5 5] <br/>
 >  * На тесте: A =[10 10 2 6 10 0 7 8 4 4 9 1 0 9 6 7 5 4 9 9 5 2 4 9 6 10 2 10 2 4 10 2 3 2 9 2 2 6 0 7 10 9 8 0 7 4 8 1 9 6 0 3 9 4 2 4 4 4 4 7 9 3 9 2 6 7 5 9 2 5 5 2 3 3 2 0 7 10 1 5 6 2 9 4 7 1 9 1 6 2 8 4 6 6 7 1 3 2 10 6] <br/>
 >  * На тесте: А = [6 3 5 9 5 0 10 8 6 4 5 10 0 9 9 9 3 6 2 3 10 8 6 0 10 9 0 10 1 6 1 8 10 7 6 5 7 6 2 2 0 8 1 0 7 0 10 0 7 2]
