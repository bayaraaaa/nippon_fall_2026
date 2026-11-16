#include <stdio.h>
#include <string.h>
#include <math.h>
#include "check.h"

void checkInt(int actual, int expected)
{
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d байх ёстой\n", actual, expected);
    }
}
 
void checkDouble(double actual, double expected)
{
    if (fabs(actual - expected) < 0.001) {
        printf("PASS\n");
    } else {
        printf("FAIL: %g гарсан, %g байх ёстой\n", actual, expected);
    }
}
 
void checkChar(char actual, char expected)
{
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: '%c' гарсан, '%c' байх ёстой\n", actual, expected);
    }
}


void checkBool(bool actual, bool expected)
{
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %s гарсан, %s байх ёстой\n", actual ? "true" : "false", expected ? "true" : "false");
    }
}
 
void checkString(const char actual[], const char expected[])
{
    if (strcmp(actual, expected) == 0) {
        printf("PASS\n");
    } else {
        printf("FAIL: \"%s\" гарсан, \"%s\" байх ёстой\n", actual, expected);
    }
}