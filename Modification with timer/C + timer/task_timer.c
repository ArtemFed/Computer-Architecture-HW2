void task(const int *A, int length, int *B) {
    if (length == 0) {
        return;
    }
    B[0] = A[0];
    for (int i = 1; i < length; ++i) {
        B[i] = A[i] + B[i - 1];
    }
}
