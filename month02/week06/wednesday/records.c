 #include <stdio.h>
 #include <string.h>
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

/* final_score : struct student -> double   quiz 40%, project 60% (W5) */
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

// Ex01
    /* findByName : struct student[] int char[] -> int   олдоогүй бол -1 */
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
// Ex02
    /* countGrade : struct student[] int char -> int   ийм үнэлгээтэй сурагчийн тоо */
    int countGrade(struct student s[], int size, char grade)
    {
        int count = 0;
        for (int i = 0; i < size; i++)
        {
            if (letter_grade(final_score(s[i])) == grade)
            {
                count += 1;
            }
        }
        return count;
    }
// Ex03
    /* classAverage : struct student[] int -> double   эцсийн онооны дундаж */
    double classAverage(struct student s[], int size)
    {
        double sum = 0;
        for (int i = 0; i < size; i++)
        {
            sum += final_score(s[i]);
        }
        return (double) sum / size;
    }
// Ex04
    /* sortByFinal : struct student[] int -> int
    эцсийн оноогоор их → бага эрэмбэлнэ (Лхагвын bubble_sort), солилцооны тоог буцаана */
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
// Ex05
    /* print_report : struct student[] int -> void   байр, нэр, оноо, үнэлгээ */
    /*
        1 Mina    92.6 A
        2 Aki     86.0 B
        3 Bat     73.0 C
        4 Uka     60.4 D
        5 Sora    60.0 D
        6 Ren     51.0 F
    */
    void printReport(struct student s[], int size)
    {
        for (int i = 0; i < size; i++)
        {
            double f = final_score(s[i]);
            printf("%2d %-6s %5.1f %c\n", i + 1, s[i].name, f, letter_grade(f));
        }
    }

 int main(void)
 {
    /* find_by_name : struct student[] int char[] -> int   олдоогүй бол -1 */
    checkInt(findByName(group, 6, "Mina"), 2);
    checkInt(findByName(group, 6, "Zaya"), -1);

    /* countGrade : struct student[] int char -> int   ийм үнэлгээтэй сурагчийн тоо */
    checkInt(countGrade(group, 6, 'D'), 2);
    checkInt(countGrade(group, 6, 'A'), 1);

    /* classAverage : struct student[] int -> double   эцсийн онооны дундаж */
    checkDouble(classAverage(group, 6), 70.5);

    /* sortByFinal : struct student[] int -> int
    эцсийн оноогоор их → бага эрэмбэлнэ (Лхагвын bubble_sort), солилцооны тоог буцаана */
    checkInt(sortByFinal(group, 6), 6);
    checkInt(findByName(group, 6, "Mina"), 0);
    checkInt(findByName(group, 6, "Ren"), 5);

    /* print_report : struct student[] int -> void   байр, нэр, оноо, үнэлгээ */
   
    printReport(group, 6);

    return 0;
 }