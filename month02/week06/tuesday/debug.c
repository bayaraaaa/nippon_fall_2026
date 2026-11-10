#include <stdio.h>
#include "check.h"
#include <string.h>
/* 1. is_same : char[] char[] -> int   агуулга ижил бол 1 */
    // return a == b; -> return strcmp(a, b) == 0;
int is_same(char a[], char b[]) {
    return strcmp(a, b) == 0;
}

/* 2. reverse_str : char[] -> void */

// i < n -> i < n / 2
void reverse_str(char s[]) {
    int n = strlen(s);
    for (int i = 0; i < n / 2; i++) {
        char t = s[i];
        s[i] = s[n - 1 - i];
        s[n - 1 - i] = t;
    }
}

/* 3. count_vowels : char[] -> int */
// if (s[i] == 'a' || 'e' || 'i' || 'o' || 'u') -> if (s[i] == 'a' || s[i] == 'e' || s[i] == 'i' || s[i] == 'o' || s[i] == 'u')
int count_vowels(char s[]) {
    int k = 0;
    for (int i = 0; s[i] != '\0'; i++) {
        if (s[i] == 'a' || s[i] == 'e' || s[i] == 'i' || s[i] == 'o' || s[i] == 'u') {
            k = k + 1;
        }
    }
    return k;
}

/* 4. caesar : char[] int -> void */
// s[i] + k -> (s[i] - 'a' + k) % 26 + 'a'
void caesar(char s[], int k) {
    for (int i = 0; s[i] != '\0'; i++) {
        if (s[i] >= 'a' && s[i] <= 'z') {
            s[i] = (s[i] - 'a' + k) % 26 + 'a';
        }
    }
}

int main(void)
{
    char x[] = "cat";
    char y[] = "cat";
    checkInt(is_same(x, y), 1);
    char r[] = "abc"; reverse_str(r); checkString(r, "cba");
    checkInt(count_vowels("sky"), 0);
    char z[] = "xyz"; caesar(z, 3); checkString(z, "abc");
    return 0;
}