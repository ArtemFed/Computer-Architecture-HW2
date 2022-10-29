#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define max_size 20

extern void task(int *A, int length, int *B);
extern void print_arr(int *B, int length);

int main(int argc, char *argv[]) {
    int length, answer = 0;

    if (argc == 2) {
        length = atoi(argv[1]);
        FILE *input = fopen("input.txt", "r");

        int A[length];
        int B[length];

        for (int i = 0; i < length; ++i) {
            fscanf(input, "%d", &A[i]);
        }
        fclose(input);
        
        task(A, length, B);

		FILE *output = fopen("output.txt", "w");
        for (int i = 0; i < length; ++i) {
            fprintf(output, "%d ", B[i]);
        }
        fclose(output);
        return 0;
    }

    printf("Input length (0 < length <= %d):", max_size);
    scanf("%d", &length);
    if (length < 1 || length > max_size) {
        printf("Incorrect length = %d\n", length);
        return 1;
    }

    int A[length];
    int B[length];

    printf("Random input or Direct (ans: 1, !=1):");
    scanf("%d", &answer);

    if (answer == 1) {
        struct timespec sec;
        clock_gettime(CLOCK_REALTIME, &sec);
        srand(sec.tv_nsec);

        printf("Result A: \n");
        for (int i = 0; i < length; ++i) {
            A[i] = rand() % 10;
            printf("A[%d] = %d\n", i, *(A + i));
        }
        task(A, length, B);
        print_arr(B, length);
        return 0;
    }

    printf("\n");
    for (int i = 0; i < length; ++i) {
        printf("A[%d] =", i);
        scanf("%d", A + i);
    }
    task(A, length, B);
    print_arr(B, length);
    return 0;
}
