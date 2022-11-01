#include <stdio.h>

int task_cmd() {
    int sum = 0;
    char string[100];
    printf("Your string:");
    scanf("%s", string);

    for (int i = 0; string[i] != '\0'; ++i) {
        if ((string[i] >= '1') && (string[i] <= '9')) {
            sum += (int) string[i] - 48;
        }
    }
    return sum;
}

// file:
// ./exe input output

// random timer:
// ./exe length

// random & simple:
// ./exe
