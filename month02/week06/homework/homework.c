#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "check.h"

struct student {
    char name[20];
    int quiz;
    int project;
};

struct student group[6] = {
    {"Aki", 80, 90}, {"Sora", 60, 60}, {"Mina", 95, 91},
    {"Ren", 45, 55}, {"Bat", 70, 75}, {"Uka", 100, 34}
};

double final_score(struct student s) {
    return 0.4 * s.quiz + 0.6 * s.project;
}

/* letter_grade : double -> char   (W5 Мягмар) */
char letter_grade(double score) {
    if (score >= 90) {
        return 'A';
    } else if (score >= 80) {
        return 'B';
    } else if (score >= 70) {
        return 'C';
    } else if (score >= 60) {
        return 'D';
    } else {
        return 'F';
    }
}
    int sortByFinal(struct student s[], int size)
    {
        int swaps = 0;
        for (int i = 0; i < size - 1; i++)
        {
            for (int j = 0; j < size - 1 - i; j++)
            {
                if (final_score(s[j]) < final_score(s[j + 1]))
                {
                    struct student t = s[j];
                    s[j] = s[j + 1];
                    s[j + 1] = t;
                    swaps += 1;
                }
            }
        }
        return swaps;
    }

    int findByName(struct student s[], int size, char name[])
    {
        for (int i = 0; i < size; i++)
        {
            if (strcmp(s[i].name, name) == 0)
            {
                return i;
            }
        }
        return -1;
    }

    void printReport(struct student s[], int size)
    {
        for (int i = 0; i < size; i++)
        {
            double f = final_score(s[i]);
            printf("%2d %-6s %5.1f %c\n", i + 1, s[i].name, f, letter_grade(f));
        }
    }
/*
int countWords(const char *str) {
    if (str == NULL) {
        return 0;
    }

    int count = 0;
    bool inWord = false;

    for (int i = 0; str[i] != '\0'; i++) {
        // Cast to unsigned char to prevent undefined behavior with negative char values
        if (isalpha((unsigned char)str[i])) {
            if (!inWord) {
                inWord = true;
                count++;
            }
        } else {
            inWord = false;
        }
    }

    return count;
}
*/

int countWords(const char *a) {
    if (a == NULL) {
        return 0;
    }

    int count = 0;
    bool inWord = false;

    for (int i = 0; a[i] != '\0'; i++) {
        if (isalpha((unsigned char)a[i])) {
            if (!inWord) {
                inWord = true;
                count++;
            }
        } else {
            inWord = false;
        }
    }

    return count;
}
// Ex02
/* 2. best_project_index : struct student[] int -> int   project хамгийн өндөр, тэнцвэл эхнийх */
    int bestProjectIndex(struct student s[], int size)
    {
        int maxId = 0;
        for (int i = 0; i < size; i++)
        {
            if (s[i].project > s[maxId].project)
            {
                maxId = i;
            }
        }
        return maxId;
    }
// Ex03
/* 3. countPassFail : struct student[] int int* int* -> void   (Баасангийн pointer) */
    void countPassFail(struct student s[], int size, int *passCount, int *failCount)
    {
        *passCount = 0;
        *failCount = 0;
        for (int i = 0; i < size; i++)
        {
            if (final_score(s[i]) >= 60)
            {
                (*passCount)++;
            } else {
                (*failCount)++;
            }
        
        }
    }
// Ex04
/* 4. longestNameIndex : struct student[] int -> int   нэр хамгийн урт, тэнцвэл эхнийх
        Алдаатай: засаад тестийг PASS болго. */
    int longestNameIndex(struct student s[], int n) {
        int best = 0;
        for (int i = 0; i < n; i++) {
            if (strlen(s[i].name) > strlen(s[best].name)) {

                best = i;
            } 
        }
        return best;
    }


int main(void)
{   
    
    /* 1. countWords : char[] -> int   үгс нэг зайгаар тусгаарлагдсан */
    checkInt(countWords("hello world"), 2);
    checkInt(countWords("a b c"), 3);
    checkInt(countWords("one"), 1);
    checkInt(countWords(""), 0);

    /* 2. bestProjectIndex : struct student[] int -> int   project хамгийн өндөр, тэнцвэл эхнийх */
    checkInt(bestProjectIndex(group, 6), 2);
    struct student two[2] = {{"Ana", 50, 80}, {"Bo", 90, 80}};
    checkInt(bestProjectIndex(two, 2), 0);

    /* 3. countPassFail : struct student[] int int* int* -> void   (Баасангийн pointer) */
    int pass;
    int fail;
    countPassFail(group, 6, &pass, &fail);
    checkInt(pass, 5);
    checkInt(fail, 1);

    /* 4. longestNameIndex : struct student[] int -> int   нэр хамгийн урт, тэнцвэл эхнийх
        Алдаатай: засаад тестийг PASS болго. */
    checkInt(longestNameIndex(group, 6), 1);
    checkInt(longestNameIndex(two, 2), 0);

    return 0;
}