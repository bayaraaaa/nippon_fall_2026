#include <stdio.h>

// Ex01

    /* square_sum : int int -> int
   a² + b² */

int square_sum(int a, int b)
{
    return a * a + b * b;
}

// Ex02

/* tens_digit : int -> int
   эерэг тооны аравтын орны цифр: / ба % ашигла */

int tens_digit(int num)
{
    return num / 10 % 10;
}

// Ex03

/* average2 : int int -> double
   хоёр бүхэл тооны дундаж (бутархайг алдахгүй!) */

double average2(int a, int b)
{
    return (a + b) / 2.0;
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

    // Ex01
    /* square_sum : int int -> int
   a² + b² */
    check_int(square_sum(3, 4), 25);
    check_int(square_sum(0, 5), 25);
    check_int(square_sum(-2, 1), 5);
    // Ex02
    /* tens_digit : int -> int
   эерэг тооны аравтын орны цифр: / ба % ашигла */
    check_int(tens_digit(1234), 3);
    check_int(tens_digit(57), 5);
    check_int(tens_digit(7), 0);
    // Ex03
    /* average2 : int int -> double
   хоёр бүхэл тооны дундаж (бутархайг алдахгүй!) */
    check_double(average2(7, 8), 7.5);
    check_double(average2(60, 60), 60.0);

    return 0;
}