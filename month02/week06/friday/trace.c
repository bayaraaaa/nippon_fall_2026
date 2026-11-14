#include <stdio.h>

void add_one(int *p) {
    *p = *p + 1;
}

int main(void) {
    int a = 5;
    int b = a;
    add_one(&a);
    add_one(&a);
    printf("%d %d\n", a, b);
    return 0;
}