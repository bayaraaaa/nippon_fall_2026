#include <stdio.h>

struct student {
    char name[20];
    int quiz;
    int project;
};

struct student group[4] = 
{{"Aki", 80, 90}, {"Sora", 60, 60}, {"Mina", 95, 91}, {"Ren", 45, 55}};

// Ex01
double final_score(struct student s) {
    return 0.4 * s.quiz + 0.6 * s.project;
}

// Ex02

/* count_passing_students : struct student[] int -> int   эцсийн оноо >= 60 */
int count_passing_students(struct student students[], int n)
{
    int c = 0;
    for (int i = 0; i < n; i++)
    {
        double finalScore = final_score(students[i]);
        if (finalScore >= 60)
        {
            c += 1;
        }
    }
    return c;
}

// Ex03
/* best_index : struct student[] int -> int   эцсийн оноо хамгийн их сурагчийн index */
int best_index(struct student students[], int size)
{
    int bestIndex = 0;
    for (int i = 1; i < size; i++)
    {
        if (final_score(students[i]) > final_score(students[bestIndex]))
        {
            bestIndex = i;
        }
    }
    return bestIndex;
}

// Ex04
/* average_final : struct student[] int -> double */

double average_final(struct student students[], int size)
{
    double total = 0.0;
        for (int i = 0; i < size; i++)
        {
            total += final_score(students[i]);
        }
    return total / size;
}
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
void print_student(struct student s)
{
    printf("%s %.1f %c\n", s.name, final_score(s), letter_grade(final_score(s)));
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
    check_double(final_score(group[0]), 86.0);
    check_double(final_score(group[2]), 92.6);  

    /* count_passing_students : struct student[] int -> int   эцсийн оноо >= 60 */
    check_int(count_passing_students(group, 4), 3);

    /* best_index : struct student[] int -> int   эцсийн оноо хамгийн их сурагчийн index */
    check_int(best_index(group, 4), 2);

    /* average_final : struct student[] int -> double */
    check_double(average_final(group, 4), 72.4);
    return 0;
}