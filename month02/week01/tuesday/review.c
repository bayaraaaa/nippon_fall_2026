#include <stdio.h>

// Ex01

/* square_sum : int int -> int
   a² + b² */

   int square_sum(int a, int b)
   {
        return a * a + b * b;
   }


/* check_int : бүхэл тоо тэнцүү бол PASS (C-ийн check-expect) */
void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}

/* check_double : зөрүү 0.001-ээс бага бол PASS (L8: double яг биш) */
void check_double(double actual, double expected) {
    double diff = actual - expected;
    if (diff < 0.001 && diff > -0.001) {
        printf("PASS\n");
    } else {
        printf("FAIL: %f гарсан, %f хүлээсэн\n", actual, expected);
    }
}


int main(void)
{

    /* square_sum : int int -> int
   a² + b² */
    check_int(square_sum(3, 4), 25);
    check_int(square_sum(0, 5), 25);
    check_int(square_sum(-2, 1), 5);

    return 0;
}