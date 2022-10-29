#include <stdio.h>

void print_arr(const int *B, int length) {
    printf("\nResult B: ");
    for (int i = 0; i < length; ++i) {
        printf("%d ", B[i]);
    }
    printf("\n");
}
