#include <stdio.h>

// Ex01 
    /* count_multiples : int int -> int
    1..n дотор k-д хуваагдах тооны тоо */
    int count_multiples(int n, int k){
        int c = 0;
        while (n > 0)
        {
            if (n % k == 0){
                c = c + 1;
            }
            n = n - 1;
        }
        return c;
    }

// Ex02

    /* reverse_number : int -> int   (while, %, /) */

int reverse_number(int n){
    int rev = 0;
    while (n > 0)
    {
            rev = rev * 10 + (n % 10);
        n = n / 10;
    }
    return rev;
}

// Ex03 

/* max3 : int int int -> int   (if) */

int max3(int a, int b, int c){
    int max = 0;
    if (a > b){
        max = a;
        if (max > c){
            return max;
        } else {
            return c;
        }
    } else {
        max = b;
        if (max > c){
            return max;
        } else {
            return c;
        }
    }
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

int main(void) {

    /* count_multiples : int int -> int
    1..n дотор k-д хуваагдах тооны тоо */
    check_int(count_multiples(10, 3), 3);
    check_int(count_multiples(12, 4), 3);
    check_int(count_multiples(5, 7), 0);

    /* reverse_number : int -> int   (while, %, /) */
    check_int(reverse_number(1234), 4321);
    check_int(reverse_number(120), 21);
    check_int(reverse_number(7), 7);

    /* max3 : int int int -> int   (if) */
    check_int(max3(1, 5, 3), 5);
    check_int(max3(9, 2, 9), 9);
    check_int(max3(-1, -5, -3), -1);

    return 0;
}