#include <stdio.h>

int square(int x)
{
    return x * x;
}

int cube(int x)
{
    return x * x * x;
      
}

int last_digit(int num)
{
    return num % 10;
}

double final_score(int quiz, int project)
{
    return quiz * 0.4 + project * 0.6;
}

// Ex04
// to_fahrenheid
// c * 9 / 5 + 32
// 

double to_fahrenheit(double celcius)
{
    return celcius * 9.0 / 5.0 + 32.0;
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
    check_int(cube(2), 8);
    check_int(cube(-2), -8);
    check_int(last_digit(1234), 4);
    check_int(last_digit(7), 7);
    check_double(final_score(80, 90), 86.0);
    check_double(final_score(60, 60), 60.0);
    check_double(final_score(95, 91), 92.6);

    check_double(to_fahrenheit(20), 68.0);
    check_double(to_fahrenheit(37.0), 98.6);
    check_double(to_fahrenheit(-17), 0.0);

    return 0;
}