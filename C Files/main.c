#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// file:
// ./exe input output

// random timer:
// ./exe length

// random & simple:
// ./exe

#define max_size 100

extern int task_cmd(int length);
extern void task_file(char *input, char *output);

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

    printf("Result string: ");
    srand(clock());
    for (int i = 0; i < length; ++i) {
        // (char) 33 = '!' && (char) 64 = @
        ch = rand() % 32 + 33;
        printf("%c", ch);
        if ((ch >= '1') && (ch <= '9')) {
            sum += ((int) ch - 48);
        }
    }
    printf("\n\nResult: %d\n", sum);
}

// task_random without print
void task_random_lite(int length) {
    int sum = 0;
    char ch;

    srand(clock());
    for (int j = 0; j < length; ++j) {
        // (char) 33 = '!' && (char) 64 = @
        ch = rand() % 32 + 33;
        if ((ch >= '1') && (ch <= '9')) {
            sum += ((int) ch - 48);
        }
    }
}

int main(int argc, char *argv[]) {
    int length = 0, answer = 0;

    // File
    if (argc == 3) {
        task_file(argv[1], argv[2]);
        return 0;
    }

    // Random + Timer
    if (argc == 2) {
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

    printf("\nResult: %d\n", task_cmd(length));
    return 0;
}
