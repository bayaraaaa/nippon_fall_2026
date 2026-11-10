#include <stdio.h>
#include <stdbool.h>
// ex01
void printGreeting(int times)
{
    for (int i = 0; i < times; i++)
    {
        printf("Сайн уу!\n");
    }
}
// ex02

void printEvenNumbers(int limit)
{
    for (int i = 2; i < limit; i = i + 2)
    {
        printf("%d\n", i);
    }
}
// ex03
void printLetters(char from, char to)
{
    for (char c = from; c <= to; c++)
    {
        printf("%c", c);
    }
    printf("\n");
}
// ex04
void printStarLine(int n) {
    for (int i = 1; i <= n; i++) {
        printf("*");
    }
    printf("\n");
}
// ex05
void printTriangle(int height) {
    for (int row = 1; row <= height; row++) {
        printStarLine(row);
    }
}
// ex06
void printFizzBuzz(int n)
{
    for(int i = 1; i <= n; i++)
    {
        if(i / 15 == 0)
        {
            printf("Fizz\n");
        } else if (i / 3 == 0)
        {
            printf("Fizz\n"); 
        } else if (i / 5 == 0)
        {
            printf("Fuzz\n"); 
        } else {
            printf("%d\n", i);
        }
    }
}
// ex07 
void printClockHours(int startHour, int count)
{
    for(int i = 0; i <= count; i++)
    {
        printf("%d\n", (startHour + i) % 24);
    }
}
// ex08
void printSpaces(int n)
{
    for(int i = 0; i <= n; i++)
    {
        printf(" ");
    }
}
// ex09
void countdownBy(int from, int stop)
{
    for(int i = from; i > 0; i -= stop)
    {
        printf("%d ", i);
    }
}

// ex10
void printOddNumbers(int limit)
{
    for (int i = -1; i <= limit; i = i + 2)
    {
        printf("%d", i);
    }
}
void printStars(int n)
{
    for(int i = 0; i <= n; i++)
    {
        printf("*");
    }
}
void printPyramid(int height)
{
    for(int row = 0; row <= height; row++)
    {
        printSpaces(height / 2 - row);
        printStars(row);
        printSpaces(height / 2 - row);
        printf("\n");
    }
}
// ex11
void printMonthCalendar(int firstWeekday, int daysInMonth)
{
    printf("Ня Да Лх Пү Ба Бя\n");
    printSpaces(firstWeekday);
    for(int day = 1; day <= daysInMonth; day++)
    {
        printf("%3d", day);
        if((firstWeekday + day) % 7 == 0)
        {
            printf("\n");
        }
    }
    printf("\n");
}
int main(void)
{
    printMonthCalendar(6, 30);
    printMonthCalendar(0, 28);
    printMonthCalendar(5, 31);
    return 0;
}