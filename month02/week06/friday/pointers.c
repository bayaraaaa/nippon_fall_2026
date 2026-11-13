#include <stdio.h>
#include "check.h"

void simpleSwap(int a, int b)
{
    int c = a;
    a = b;
    b = c;
}
void swap(int *a, int *b)
{
    int c = *a;
    *a = *b;
    *b = c;
}
int main(void)
{
    printf("---- swap ---- \n");
    int x = 2; 
    int y = 1;
    simpleSwap(x, y);
    printf("%d\n", x);
    printf("%d\n", y);

    swap(&x, &y);
    printf("%d\n", x);
    printf("%d\n", y);


    checkInt(x, 1);
    checkInt(y, 2);


    return 0;
}