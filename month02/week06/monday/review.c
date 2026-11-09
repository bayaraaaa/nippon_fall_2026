#include <stdio.h>
// Functions

struct student {
    char name[20];
    int quiz;
    int project;
};

struct student group[4] = 
{{"Aki", 80, 90}, {"Sora", 60, 60}, {"Mina", 95, 91}, {"Ren", 45, 55}};

double final_score(struct student s)
{
    return 0.4 * s.quiz + 0.6 * s.project;
};

char letter_grade(double n)
{

    if (n >= 90)
    {
        return 'A';
    } else if (n >= 80)
    {
        return 'B';
    } else if (n >= 70)
    {
        return 'C';
    } else if (n >= 60)
    {
        return 'D';
    } else
    {
        return 'F';
    }
        
}

// End Functions
// Ex01

    /* count_grade : struct student[] int char -> int
    өгөгдсөн үсгэн үнэлгээтэй сурагчийн тоо (final_score, letter_grade) */
int count_grade(struct student s[], int n, char letter)
{
    int c = 0;
    for (int i = 0; i < n; i++)
    {
        
        if (letter_grade(final_score(s[i])) == letter)
        {
            c += 1;
        }
    }
    return c;
}

// Ex02
    /* second_max : int[] int -> int   n >= 2 */

    int second_max(int a[], int n)
    {
        int max1 = a[0];
        int max2 = a[1];
        if (a[1] > a[0])
        {
            max1 = a[1];  
            max2 = a[0];
        }
        for (int i = 2; i < n; i++)
        {
            if (a[i] > max1)
            {
                max2 = max1;
                max1 = a[i];
            } else if (a[i] > max2)
            {
                max2 = a[i];
            }
        }
        return max2;
    }

    // Ex03

    /* count_in_range : int[] int int int -> int   lo <= a[i] <= hi */
int count_in_range(int a[],int n, int min, int max)
{
    int c = 0;
    for (int i = 0; i < n; i++)
    {
        if (min < a[i] && a[i] < max)
        {
            c += 1;
        }
    }
    return c;
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
int main(void)
{
    /* count_grade : struct student[] int char -> int
    өгөгдсөн үсгэн үнэлгээтэй сурагчийн тоо (final_score, letter_grade) */
    check_int(count_grade(group, 4, 'A'), 1);
    check_int(count_grade(group, 4, 'F'), 1);
    check_int(count_grade(group, 4, 'C'), 0);

    /* second_max : int[] int -> int   n >= 2 */
    int scores[5] = {70, 82, 95, 63, 88};
    int b[6] = {5, 2, 7, 2, 9, 1};
    check_int(second_max(scores, 5), 88);
    check_int(second_max(b, 6), 7);

    /* count_in_range : int[] int int int -> int   lo <= a[i] <= hi */
    check_int(count_in_range(scores, 5, 80, 90), 2);
    check_int(count_in_range(scores, 5, 0, 100), 5);

    return 0;
}