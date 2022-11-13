#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int task(const char *str) {
    int sum = 0;
    int length = strlen(str);
    char ch = ' ';
    for (int i = 0; i < length; ++i) {
        ch = str[i];
        if ((ch >= '1') && (ch <= '9')) {
            sum += ((int) ch - 48);
        }
    }
    return sum;
}

int task_random(int length) {
    char string[256];
    srand(clock());
    for (int j = 0; j < length; ++j) {
        string[j] = (char) (33 + rand() % 93);
    }
    printf("Random string: %s", string);
    return task(string);
}

int task_cmd() {
    char string[256];
    printf("Your string (maximum 256 characters):");
    fflush(stdin);
    getchar();
    fgets(string, 256, stdin);
    return task(string);
}
