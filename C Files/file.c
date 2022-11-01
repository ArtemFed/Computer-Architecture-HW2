#include <stdio.h>
#include <stdlib.h>

void check_stream(FILE *stream) {
    if (stream == NULL) {
        printf("Error opening file. Press any key to continue");
        exit(0);
    }
}

void task_file(char *input, char *output) {
    FILE *input_stream = fopen(input, "r");
    check_stream(input_stream);
    int sum = 0;
    char ch = ' ';
    while (!feof(input_stream)) {
        fscanf(input_stream, "%c", &ch);
        if ((ch >= '1') && (ch <= '9')) {
            sum += ((int) ch - 48);
        }
    }
    fclose(input_stream);
    FILE *output_stream = fopen(output, "w");
    check_stream(input_stream);
    fprintf(output_stream, "%d ", sum);
    fclose(output_stream);
}
