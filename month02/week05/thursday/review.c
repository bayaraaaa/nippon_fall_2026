#include <stdio.h>

// Ex01
int sumOddTo(int n)
{
    int sum = 0;
    for(int i = 0; i <= n; i++)
    {
        if(i % 2 != 0)
        {
            sum += i;
        }
    }
    return sum;
}

// Ex02

/* is_palindrome_number : int -> int
        урвуулахад ижил бол 1. Лхагвын reverse_number-ийг дууд. */
int isPalindromeNumber(int n)
{
    
    int original = n;
    int reversed = 0;
    while (n > 0) 
    {
        int remainder = n % 10;
        reversed = reversed * 10 + remainder;
        n /= 10;
    }
    return original == reversed;
}

// Ex03

int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

/* lcm : int int -> int
   хамгийн бага ерөнхий хуваагдагч = a * b / gcd(a, b) */

int lcm(int a, int b) {
    if (a == 0 || b == 0) 
    {   
        return 0; 
    }
    return (a * b) / gcd(a, b);
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
    /* sum_odd_to : int -> int
        1-ээс n хүртэлх сондгой тоонуудын нийлбэр */
    check_int(sumOddTo(5), 9);
    check_int(sumOddTo(6), 9);
    check_int(sumOddTo(1), 1);

    /* is_palindrome_number : int -> int
        урвуулахад ижил бол 1. Лхагвын reverse_number-ийг дууд. */
    check_int(isPalindromeNumber(121), 1);
    check_int(isPalindromeNumber(123), 0);
    check_int(isPalindromeNumber(7), 1);

    /* lcm : int int -> int
        хамгийн бага ерөнхий хуваагдагч = a * b / gcd(a, b) */
    check_int(lcm(4, 6), 12);
    check_int(lcm(5, 7), 35);
    check_int(lcm(6, 6), 6);

    return 0;
}