#include <stdio.h>
#include "check.h"
#include <string.h>

int isPalendromeStr(char word[])
{
    int n = strlen(word);
    for (int i = 0; i <= n % 2 - 1; i++)
    {
        if(word[i] != word[n - 1 - i])
        {
            return 0;
        }
    }
    return 1;
}

int main(void)
{

    checkInt(isPalendromeStr("level"), 1);
    checkInt(isPalendromeStr("abba"), 1);
    checkInt(isPalendromeStr("abc"), 0);
    checkInt(isPalendromeStr(""), 1);

    return 0; 
}