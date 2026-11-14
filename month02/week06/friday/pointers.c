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
// Ex01
void simpleSwap(int a, int b)
{
    int c = a;
    a = b;
    b = c;
}
void swap(int *a, int *b)
{
    int c = *a;
    *a = *b;
    *b = c;
}
// Ex02
void addBonus(int *score, int bonus) 
{
    *score = *score + bonus; 
    if (*score > 100) 
    { 
        *score = 100; 
    } 
}
// Ex03
/* min_max : int[] int int* int* -> void   хамгийн бага, их утгыг *min, *max-д бичнэ */
void minMax(int a[], int n, int *min, int *max) {
    *min = a[0];
    *max = a[0];
    for (int i = 1; i < n; i++) {
        if (a[i] < *min) {
            *min = a[i];
        }
        if (a[i] > *max) {
            *max = a[i];
        }
    }
}

// Ex04

/* bonusCopy : struct student int -> struct student   W4-ийн add-bonus: шинэ struct буцаана */
struct student bonusCopy(struct student s, int bonus) {
    s.project = s.project + bonus;
    if (s.project > 100) {
        s.project = 100;
    }
    return s;
}

/* bonusInPlace : struct student* int -> void   эх struct-ийг өөрчилнө */
void bonusInPlace(struct student *s, int bonus) {
    s->project = s->project + bonus;
    if (s->project > 100) {
        s->project = 100;
    }
}

int main(void)
{
    printf("---- swap ---- \n");
    int x = 2; 
    int y = 1;
    simpleSwap(x, y);
    printf("%d\n", x);
    printf("%d\n", y);

    swap(&x, &y);
    printf("%d\n", x);
    printf("%d\n", y);


    checkInt(x, 1);
    checkInt(y, 2);

    /* add_bonus : int* int -> void   *score-д bonus нэмнэ, 100-аас хэтрүүлэхгүй (W4!) */
    int s = 95;
    addBonus(&s, 3);  checkInt(s, 98);
    addBonus(&s, 5);  checkInt(s, 100);

    int scores[5] = {70, 82, 95, 63, 88};
    int lo;
    int hi;
    minMax(scores, 5, &lo, &hi);
    checkInt(lo, 63);
    checkInt(hi, 95);

    struct student aki = {"Aki", 80, 90};
    struct student copy = bonusCopy(aki, 5);
    checkInt(copy.project, 95);
    checkInt(aki.project, 90);
    bonusInPlace(&aki, 5);
    checkInt(aki.project, 95);
    bonusInPlace(&aki, 20);
    checkInt(aki.project, 100);
    return 0;
}