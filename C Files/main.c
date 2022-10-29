#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// file:
// ./exe length input output

// random timer:
// ./exe length

// random & simple:
// ./exe

#define max_size 100

extern int task_cmd(int length);
extern void task_file(char *input, char *output, int length);

int read_int() {
    int length;
    printf("Input length (0 < length <= %d):", max_size);
    scanf("%d", &length);
    if (length < 1 || length > max_size) {
        printf("Incorrect length = %d\n", length);
        exit(EXIT_SUCCESS);
    }
    return length;
}

void task_random(int length) {
    int sum = 0;
    char ch;

    printf("Result string: \n");
    srand(clock());
    for (int i = 0; i < length; ++i) {
        // (char) 33 = '!' && (char) 64 = @
        ch = rand() % 32 + 33;
        printf("%c", ch);
        if ((ch >= '1') && (ch <= '9')) {
            sum += ((int) ch - 48);
        }
    }
    printf("\nResult: %d\n", sum);
}

// task_random without print
void task_random_lite(int length) {
    int sum = 0;
    char ch;

    for (int j = 0; j < length; ++j) {
        // (char) 33 = '!' && (char) 64 = @
        ch = rand() % 32 + 33;
        if ((ch >= '1') && (ch <= '9')) {
            sum += ((int) ch - 48);
        }
    }
}

int main(int argc, char *argv[]) {
    int length, answer = 0, sum;

    // File
    if (argc == 4) {
        length = atoi(argv[1]);
        task_file(argv[2], argv[3], length);
        return 0;
    }

    // Random + Timer
    if (argc == 2) {
        sum = 0;
        length = atoi(argv[1]);

        time_t t_start = clock();
        srand(clock());
        for (int i = 0; i < 5000000; ++i) {
            task_random_lite(length);
        }
        task_random(length);
        time_t t_end = clock();

        printf("\n%d ms\n", (int) difftime(t_end, t_start)) / 1000;
        return 0;
    }

    length = read_int();

    printf("Random input or Direct (ans: 1, !=1):");
    scanf("%d", &answer);

    // Random
    if (answer == 1) {
        task_random(length);
        return 0;
    }

    sum = task_cmd(length);

    printf("\nResult: %d\n", sum);
    return 0;
}
