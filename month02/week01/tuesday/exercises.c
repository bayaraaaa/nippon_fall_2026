#include <stdio.h>
#include <stdbool.h>

// Ex01

double apply_discount(double price, double discount_perscent)
{
    return price * (1.0 - discount_perscent);
}

// Ex02

int get_hours(int total_minutes)
{
    return total_minutes / 60;
}

// Ex03

char to_upper_case(char c)
{
    return c - 32;
}

// Ex04

bool is_negative(int num)
{ 
    return num < 0;
}

// Ex05

bool is_positive_and_even(int number)
{
    return number > 0 && number % 2 == 0;
}

// Ex06

int round_down_to_ten(int n)
{
    return n / 10 * 10;
}

// Ex07
bool at_least_two_positive(int a, int b, int c)
{
    return (a > 0 && b >0) || (b > 0 && c > 0) || (a > 0 && c > 0);
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
    
    check_double(apply_discount(100.0, 0.15), 85.0);
    check_int(get_hours(120), 2);
    printf("grade = %c\n", to_upper_case('a')); // 'A'

    printf("is_negative = %d\n", is_negative(-5), true); 
    printf("is_negative = %d\n", is_negative(10), false); 

    printf("is_positive_and_even = %d\n", is_positive_and_even(4), true); 
    printf("is_positive_and_even = %d\n", is_positive_and_even(-4), false); 
    
    check_int(round_down_to_ten(47), 40);
    check_int(round_down_to_ten(129), 120);

    printf("at_least_two_positive = %d\n", at_least_two_positive(2, 3, 0), true); 
    printf("at_least_two_positive = %d\n", at_least_two_positive(2, 0, 0), false); 
    return 0;
}