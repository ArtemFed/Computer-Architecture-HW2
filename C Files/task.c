#include <stdio.h>

int task_cmd(int length) {
    int sum = 0;
    char ch = ' ';
    printf("Your string:");
    for (int i = 0; i < length; ++i) {
        scanf("%c", &ch);
        if ((ch >= '1') && (ch <= '9')) {
            sum += ((int) ch - 48);
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