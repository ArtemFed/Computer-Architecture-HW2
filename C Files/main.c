#include <stdio.h>
#include <string.h>
#include <time.h>

#define max_size 256

extern int task(const char *str);
extern int task_random(int length);
extern int task_cmd();

int main(int argc, char *argv[]) {
    // cmd arg + Timer
    if (argc == 2) {
        time_t t_start = clock();
        printf("String: %s\n", argv[1]);
        for (int i = 0; i < 25000000; ++i) {
            task(argv[1]);
        }
        time_t t_end = clock();

        printf("Time: %d ms", (int) (difftime(t_end, t_start)) / 1000);
        printf("\nResult: %d\n", task(argv[1]));
        return 0;
    }
    // Get str from File + cmd args
    if (argc == 3) {
        char arr_str[256];
        FILE *input_stream = fopen(argv[1], "r");
        if (input_stream == NULL) {
            printf("Error opening file. Press any key to continue");
            getchar();
            return 0;
        }
        fgets(arr_str, sizeof(arr_str), input_stream);
        fclose(input_stream);

        FILE *output_stream = fopen(argv[2], "w");
        fprintf(output_stream, "%d ", task(arr_str));
        fclose(output_stream);
        return 0;
    }
    printf("Random input or Direct (ans: 1, !=1):");
    int answer = 0;
    scanf("%d", &answer);
    if (answer == 1) {
        int length = 0;
        printf("Input length (0 < length <= %d):", max_size);
        scanf("%d", &length);
        if (length < 1 || length > max_size) {
            printf("Incorrect length = %d\n", length);
            return 0;
        }
        printf("\nResult: %d\n", task_random(length));
        return 0;
    }
    printf("\nResult: %d\n", task_cmd());
    return 0;
}
