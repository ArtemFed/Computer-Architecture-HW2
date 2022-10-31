#include <stdio.h>

void task_file(char *input, char *output) {
    FILE *input_stream = fopen(input, "r");
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
    fprintf(output_stream, "%d ", sum);
    fclose(output_stream);
}