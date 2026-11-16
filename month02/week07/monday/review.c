#include <stdio.h>
#include <string.h>
#include "check.h"


void ex01()
{
    int x = 5;
    int *p = &x;
    *p = 10;

    printf("Value of x: %d\n", x);
    printf("Address of x (&x): %p\n", &x);
    printf("Address stored in p (p): %p\n", p);
    printf("Address of pointer p (&p): %p\n", &p);

}

int countSpaces(char characters[])
{
    int counter = 0;
    int charLegth = strlen(characters);
    for (int i = 0; i < charLegth; i++)
    {
        if (characters[i] == ' ')
        {
            counter++;
        }
    }
    return counter;
}
void clamp(int *x, int lo, int hi)
{
    if (*x <= lo)
    {
        *x = lo;
    } else if (*x >= hi)
    {
        *x = hi;
    }
    
}
/* order : int* int* -> void   *a <= *b болгоно (шаардлагатай бол солино) */
void order(int *a, int *b)
{
    int temp;
    if (*a > *b)
    {
        temp = *a;
        *a = *b;
        *b = temp;
    }
}


int main(void)
{
    
    ex01();
    /* count_spaces : char[] -> int */
    checkInt(countSpaces("GET / HTTP/1.1"), 2);
    checkInt(countSpaces("abc"), 0);
    checkInt(countSpaces("a b c d"), 3);

    /* clamp : int* int int -> void   *x-ийг lo..hi мужид оруулна */
    int v = 120; clamp(&v, 0, 100); checkInt(v, 100);
    int w = -5;  clamp(&w, 0, 100); checkInt(w, 0);
    int z = 50;  clamp(&z, 0, 100); checkInt(z, 50);

    /* order : int* int* -> void   *a <= *b болгоно (шаардлагатай бол солино) */
    int a = 5, b = 3; 
    order(&a, &b); 
    checkInt(a, 3); 
    checkInt(b, 5);

    return 0;
}