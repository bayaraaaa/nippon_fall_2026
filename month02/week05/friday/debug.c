#include <stdio.h>

struct student {
    char name[20];
    int quiz;
    int project;
};

struct student group[4] = 
{{"Aki", 80, 90}, {"Sora", 60, 60}, {"Mina", 95, 91}, {"Ren", 45, 55}};

double final_score(struct student s) {
    return 0.4 * s.quiz + 0.6 * s.project;
}

/* 1 */
// {"Aki", 90, 80} -> {"Aki", 80, 90}
struct student aki = {"Aki", 80, 90};

// struct student aki = {"Aki", 90, 80};
/* check_double(final_score(aki), 86.0); */

/* 2 */
// if (a[i].quiz > a[best].quiz) -> if (a[i].project > a[best].project)
int best_index(struct student a[], int n) {
    int best = 0;
    for (int i = 1; i < n; i++) {
        if (a[i].project > a[best].project) {
            best = i;
        }
    }
    return best;
}
/* struct student pair[2] = {{"Ana", 100, 50}, {"Bat", 70, 90}};
   check_int(best_index(pair, 2), 1); */
/* 3 */
// int sum = 0; -> double sum = 0.0;
double average_final(struct student a[], int n) {
    double sum = 0.0;
    for (int i = 0; i < n; i++) {
        sum = sum + final_score(a[i]);
    }
    return (double) sum / n;
}
/* check_double(average_final(group, 4), 72.4); */

/* 4 */
void print_bar(int n) {
        for (int i = 1; i <= n; i++) {
            printf("*");
        }
        printf("\n");
    }

// print_bar(a[i] % 10); -> print_bar(a[i] / 10);
void print_bars(int a[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%3d ", a[i]);
        print_bar(a[i] / 10);
    }
}
/* print_bars(scores, 5) — 70-ийн мөрөнд од гарахгүй байна */

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

    check_double(final_score(aki), 86.0);
    struct student pair[2] = {{"Ana", 100, 50}, {"Bat", 70, 90}};
    check_int(best_index(pair, 2), 1);
    check_int(best_index(pair, 2), 1); 
    check_double(average_final(group, 4), 72.4);
    int scores[5] = {70, 82, 95, 63, 88}; 
    print_bars(scores, 5);
    return 0;
}