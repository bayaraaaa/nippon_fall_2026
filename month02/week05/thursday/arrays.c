#include <stdio.h>

// Functions

    int scores[5] = {70, 82, 95, 63, 88}; 
    int mixed[5] = {40, 60, 72, 58, 100};

// Ex01

    int total(int a[], int n) {
        
        int aSum = 0;
        for (int i = 0; i < n; i++)
        {
            aSum += a[i];
        }
        return aSum;
    }

// Ex02

    int count_passing(int a[], int n) 
    { 
        int c = 0; 
        for (int i = 0; i < n; i++) 
        { 
            if (a[i] >= 60) 
            { 
                c = c + 1; 
            } 
        } 
        return c; 
    }

// Ex03

/* max_score : int[] int -> int   n >= 1; эхний элементээс эхэл */
    int max_score(int a[], int n)
    {
        int max = a[0];
        for (int i = 1; i < n; i++)
        {
            if (a[i] > max)
            {
                max = a[i];
            }   
        }
        return max;
    }

// Ex04

/* average : int[] int -> double   n >= 1 */


double average(int a[], int n)
{
    return (double) total(a, n) / n;
}

// Ex05

/* find_index : int[] int int -> int
   key-ийн хамгийн эхний index; байхгүй бол -1 */

int find_index(int a[], int n, int find)
{
    for (int i = 0; i < n; i++)
    {
        if (a[i] == find)
        {
            return i;
        }   
    }
    return -1;
}

// end function;

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

int main(void) {
    

// sample
/*
    int scores[5] = {70, 82, 95, 63, 88};
    int n = 5;
    printf("%d\n", scores[0]);
    printf("%d\n", scores[4]);
    scores[1] = 90;
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum = sum + scores[i];
    }
    printf("%d\n", sum);

    */
    check_int(total(scores, 5), 398);
    check_int(total(mixed, 5), 330);

    /* count_passing : int[] int -> int   60+ оноо хэд вэ */
    check_int(count_passing(scores, 5), 5);
    check_int(count_passing(mixed, 5), 3);

    /* max_score : int[] int -> int   n >= 1; эхний элементээс эхэл */
    check_int(max_score(scores, 5), 95);
    check_int(max_score(mixed, 5), 100);

    /* average : int[] int -> double   n >= 1 */
    check_double(average(scores, 5), 79.6);
    check_double(average(mixed, 5), 66.0);

    /* find_index : int[] int int -> int
        key-ийн хамгийн эхний index; байхгүй бол -1 */
    check_int(find_index(scores, 5, 95), 2);
    check_int(find_index(scores, 5, 50), -1);
    int dup[3] = {7, 3, 7};
    check_int(find_index(dup, 3, 7), 0);

    return 0;
}