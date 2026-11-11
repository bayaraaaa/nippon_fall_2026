#include <stdio.h>
#include <ctype.h>
#include "check.h"

// Ex01
/* count_upper : char[] -> int   'A'–'Z' хоорондох тэмдэгтийн тоо */
int countUpper(char s[])
{
    int count = 0;
    for (int i = 0; s[i] != '\0'; i++)  
    {
        if (s[i] >= 'A' && s[i] <= 'Z')
        {
            count++;
        }
    }
    return count;
}

// Ex02
/* index_of_char : char[] char -> int   эхний байр, олдоогүй бол -1 */
int indexOfChar(char s[], char c)
{
    for (int i = 0; s[i] != '\0'; i++)
    {
        if (s[i] == c)
        {
            return i;
        }
    }
    return -1;
}

// Ex03
/* to_lower : char[] -> void   (tolower, <ctype.h>) */
void toLower(char s[])
{
    for (int i = 0; s[i] != '\0'; i++)
    {
        s[i] = tolower(s[i]);
    }
}

int main(void)
{
    /* count_upper : char[] -> int   'A'–'Z' хоорондох тэмдэгтийн тоо */
    printf(" --- countUpper ---\n");
    checkInt(countUpper("Hello World"), 2);
    checkInt(countUpper("abc"), 0);
    checkInt(countUpper("ABC"), 3);
    printf(" --- indexOfChar ---\n");
    /* index_of_char : char[] char -> int   эхний байр, олдоогүй бол -1 */
    checkInt(indexOfChar("banana", 'n'), 2);
    checkInt(indexOfChar("abc", 'z'), -1);
    checkInt(indexOfChar("", 'a'), -1);
    printf(" --- toLower ---\n");
    /* to_lower : char[] -> void   (tolower, <ctype.h>) */
    char a[] = "HeLLo"; toLower(a); checkString(a, "hello");
    char b[] = "ABC";   toLower(b); checkString(b, "abc");

    return 0;
}