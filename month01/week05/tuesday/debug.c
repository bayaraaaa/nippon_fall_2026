#include <stdio.h>
#include <stdbool.h>

/* 1  
    "=" -> "==" */
int is_sixty(int s) {
    if (s == 60) {
        return 1;
    }
    return 0;
}
/* check_int(is_sixty(50), 0); */

/* 2  
    "i < n;" --> i <= n;*/
int sum_to(int n) {
    int sum = 0;
    for (int i = 1; i <= n; i++) {
        sum = sum + i;
    }
    return sum;
}
/* check_int(sum_to(4), 10); */

/* 3 
    2 -> 2.0 */
double average2(int a, int b) {
    return (a + b) / 2.0;
}
/* check_double(average2(7, 8), 7.5); */

/* 4 
    "  " --> "n = n / 10;"*/
int digit_sum(int n) {
    int s = 0;
    while (n > 0) {
        s = s + n % 10;
        n = n / 10; 
    }
    return s;
}
/* check_int(digit_sum(12), 3); */


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
    /*1*/
    check_int(is_sixty(50), 0);
    /*2*/
    check_int(sum_to(4), 10);
    /*3*/
    check_double(average2(7, 8), 7.5);
    /*4*/
    check_int(digit_sum(12), 3);

    return 0;
}