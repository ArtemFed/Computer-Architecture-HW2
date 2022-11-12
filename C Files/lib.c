#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int task(const char *str) {
    int sum = 0;
    for (int i = 0; i < strlen(str); ++i) {
        if ((str[i] >= '1') && (str[i] <= '9')) {
            sum += ((int) str[i] - 48);
        }
    }
    return sum;
}

int task_random(int length) {
    char rndStr[256];
    srand(clock());
    for (int j = 0; j < length; ++j) {
        rndStr[j] = (char) (33 + rand() % 93);
    }
    printf("Random string: %s", rndStr);
    return task(rndStr);
}

int task_cmd() {
    char string[256];
    printf("Your string (maximum 256 characters):");
    fflush(stdin);
    getchar();
    fgets(string, 256, stdin);
    return task(string);
}
