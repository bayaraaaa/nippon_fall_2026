#include <stdio.h>
#include <stdbool.h>

void getAgeCategery(int age){
    if (0 < age && age <= 12) {
        printf("baby\n");
    } else if (13 < age & age <= 19) {
        printf ("teenager\n");
    } else if (20 < age && age <= 65) {
        printf ("adult\n");
    } else if (65 < age && age <= 120){
        printf ("senior\n");
    } else {
        printf ("invalid age\n");
    }
}
// ex01
bool checkIsDigitChar(char c) {
    if (c >= '0' && c <= '9') {
        return true;
    } else {
        return false;
    }
}
// ex02
char getTemperatureStatus(double temp) 
{
    if (temp < 0.0) 
    {
        return 'C';
    } else if (temp < 30.0) 
    {
        return 'N';
    } else {
        return 'H';
    }
}
// ex03
char getGrade (int score)
{
    if (score >= 90) 
    {
        return 'A';
    } else if (score >= 80) 
    {
        return 'B';
    }
     else if (score >= 70) 
    {
        return 'C';
    }
     else if (score >= 60) 
    {
        return 'D';
    }
     else
    {
        return 'F';
    }
}
// ex04
/*
year % 4 = true
year % 100 = false
year % 400 = true
*/
bool isLeapYear(int year) {
    if (year % 400 == 0)
    {
        return true;
    } else if (year % 100 == 0)
    {
        return true;
    } else if (year % 4 == 0)
    {
        return true;
    } else {
        return false;
    }
}

// ex05

int calculateTicketPrice(int age, bool isWeekend)
{
    int price = 0;
    if (age < 6)
    {
        price = 0;
    } else if (age <= 6 && age <= 17) {
        price = 5000;
    } else if (age <= 18 && age <= 64) 
    {
        price = 10000;
    } else {
        price = 6000;
    }

    if (isWeekend && price > 0) 
    {
        price = price + 2000;
    }
    return price;
}
// ex06

void printCountdown(int n)
{
    for (int i = n; i >= 1; i--)
    {
        printf("%d\n", i);
    }
    printf("Start!\n");
    
}

// ex07

int sum0fRange(int from, int to)
{
    int sum = 0;
    for (int i = from; i <= to; i++)
    {
        sum = sum + i;
    }
    return sum;
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

int main (void) {
    getAgeCategery(5);
    getAgeCategery(15);
    getAgeCategery(30);
    getAgeCategery(70);
    getAgeCategery(-1);
    getAgeCategery(1000);

    printCountdown(10);
    printf("%d\n", sum0fRange(10,15));
    return 0;
}

