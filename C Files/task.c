#include <stdio.h>

int task_cmd(int length) {
    length += 1;
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
