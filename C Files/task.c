void task(const int *A, int length, int *B) {
    int count = 1;
    if (length == 0) {
        return;
    }
    B[0] = A[0];
    while (count < length){
        B[count] = A[count] + B[count - 1];
        ++count;
    }
}
