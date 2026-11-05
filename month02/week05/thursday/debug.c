#include <stdio.h>

/* 1 */
// i = 1; -> i = 0;
int total(int a[], int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum = sum + a[i];
    }
    return sum;
}
/* check_int(total(scores, 5), 398); */

/* 2 */
// total(a, n) / n; -> (double) total(a, n) / n;
double average(int a[], int n) {
    return (double) total(a, n) / n;
}
/* check_double(average(scores, 5), 79.6); */

/* 3 */
// int m = 0; -> int m = a[0];
int max_score(int a[], int n) {
    int m = a[0];
    for (int i = 0; i < n; i++) {
        if (a[i] > m) {
            m = a[i];
        }
    }
    return m;
}
/* int temps[3] = {-5, -2, -9};  check_int(max_score(temps, 3), -2); */

/* 4 */
// return 0; -> return -1;
int find_index(int a[], int n, int key) {
    for (int i = 0; i < n; i++) {
        if (a[i] == key) {
            return i;
        }
    }
    return -1;
}
/* check_int(find_index(scores, 5, 50), -1); */

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
    int scores[5] = {70, 82, 95, 63, 88}; 
    check_int(total(scores, 5), 398); 
    check_double(average(scores, 5), 79.6);
    int temps[3] = {-5, -2, -9};  
    check_int(max_score(temps, 3), -2);
    check_int(find_index(scores, 5, 50), -1);


    return 0;
}