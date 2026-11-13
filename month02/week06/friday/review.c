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


double final_score(struct student s)
{
    return 0.4 * s.quiz + 0.6 * s.project;
}

int countAbove(struct student s[], int size, double limit)
{
    int c = 0;
    for (int i = 0; i < size; i++)
    {
        if (final_score(s[i]) > limit)
        {
            c += 1;
        }
    }
    return c;
}


int totalProject(struct student s[], int size)
{
    int total = 0;
    for (int  i = 0; i < size; i++)
    {
        total = total + s[i].project;
    }
    
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
int hasStudent(struct student s[], int size, char name[])
{
    return findByName(s, size, name) != -1;
}

int main(void)
{
    /* count_above : struct student[] int double -> int   эцсийн оноо limit-ээс их */
    checkInt(countAbove(group, 6, 80), 2);
    checkInt(countAbove(group, 6, 100), 0);

    /* total_project : struct student[] int -> int */
    checkInt(totalProject(group, 6), 405);
    checkInt(totalProject(group, 1), 90);

    /* hasStudent : struct student[] int char[] -> int   Пүрэвийн find_by_name-ийг дууд */
    checkInt(hasStudent(group, 6, "Ren"), 1);
    checkInt(hasStudent(group, 6, "Zaya"), 0);
    return 0;
}