#include <stdio.h>
#include "check.h"
#include <string.h>


// Ex01
void reverse_str(char s[]) 
{  
    int n = strlen(s); 
    for (int i = 0; i < n / 2; i++) 
    { 
        char t = s[i]; 
        s[i] = s[n - 1 - i]; 
        s[n - 1 - i] = t; 
    } 
}

// Ex02

int count_char(char s[], char c) 
{
    int k = 0; 
    for (int i = 0; s[i] != '\0'; i++) 
    { 
        if (s[i] == c) 
        { 
            k = k + 1; 
        } 
    } 
    return k; 
}
    
// Ex03

/*
function is_palindrome(s)
    n ← length(s)
    for i from 0 to n ÷ 2 − 1
        if s[i] ≠ s[n − 1 − i]
            return 0
        endif
    endfor
    return 1
endfunction
*/

int is_palindrome_str(char a[])
{
    int n = strlen(a);
    for (int i = 0; i <= n % 2 - 1; i++)     
    {
        if (a[i] != a[n - 1 - i])
        {
            return 0;
        }
    }
    return 1;
}

// Ex04
    /* count_vowels : char[] -> int   a, e, i, o, u-г тоолно */
int count_vowels(char a[])
{
    int c = 0;
    for (int i = 0; a[i] != '\0'; i++)
    {
        if (a[i] == 'a' || a[i] == 'e' || a[i] == 'i' || a[i] == 'o' || a[i] == 'u')
        {
            c += 1;
        }
    }
    return c;
}

// Ep05
    /* caesar : char[] int -> void   жижиг үсгийг k-аар шилжүүлнэ, z-ээс a руу эргэнэ */
void caesar(char s[], int k) 
{ 
    for (int i = 0; s[i] != '\0'; i++) 
    { 
        if (s[i] >= 'a' && s[i] <= 'z') 
        { 
            s[i] = (s[i] - 'a' + k) % 26 + 'a'; 
        } 
    }
}

// Ep06
    /* replace_char : char[] char char -> int   from-ыг to болгож, хэдийг сольсныг буцаана */

int replace_char(char s[], char from, char to) 
{ 
    int k = 0; 
    for (int i = 0; s[i] != '\0'; i++) 
    { 
        if (s[i] == from) 
        { 
            s[i] = to; 
            k = k + 1; 
        } 
    } 
    return k; 
}

int main(void)
{ 
    /* reverse_str : char[] -> void   мөрийг байранд нь урвуулна (L9: i ба n−1−i-г солих) */
    char a[] = "abc";   reverse_str(a);   checkString(a, "cba");
    char b[] = "level"; reverse_str(b);   checkString(b, "level");
    char c[] = "";      reverse_str(c);   checkString(c, "");

    /* count_char : char[] char -> int */
    checkInt(count_char("banana", 'a'), 3);
    checkInt(count_char("hello world", 'l'), 3);
    checkInt(count_char("abc", 'z'), 0);

    /* is_palindrome_str : char[] -> int   1 бол палиндром */
    checkInt(is_palindrome_str("level"), 1);
    checkInt(is_palindrome_str("abba"), 1);
    checkInt(is_palindrome_str("abc"), 0);
    checkInt(is_palindrome_str(""), 1);

    /* count_vowels : char[] -> int   a, e, i, o, u-г тоолно */
    checkInt(count_vowels("banana"), 3);
    checkInt(count_vowels("education"), 5);
    checkInt(count_vowels("sky"), 0);

    /* caesar : char[] int -> void   жижиг үсгийг k-аар шилжүүлнэ, z-ээс a руу эргэнэ */
    char s1[] = "abc";      caesar(s1, 1);  checkString(s1, "bcd");
    char s2[] = "xyz";      caesar(s2, 3);  checkString(s2, "abc");
    char s3[] = "hi there"; caesar(s3, 13); checkString(s3, "uv gurer");

    /* replace_char : char[] char char -> int   from-ыг to болгож, хэдийг сольсныг буцаана */
    char s4[] = "banana";   checkInt(replace_char(s4, 'a', 'o'), 3); checkString(s4, "bonono");
    char s5[] = "sky";      checkInt(replace_char(s5, 'a', 'o'), 0); checkString(s5, "sky");

    return 0;
}