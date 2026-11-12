#ifndef CHECK_H
#define CHECK_H

#include <stdbool.h>

void checkInt(int actual, int expected);
void checkDouble(double actual, double expected);
void checkChar(char actual, char expected);
void checkBool(bool actual, bool expected);
void checkString(const char actual[], const char expected[]);

#endif
