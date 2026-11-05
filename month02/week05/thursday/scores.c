#include <stdio.h>

    int scores[5] = {70, 82, 95, 63, 88}; 
    int mixed[5] = {40, 60, 72, 58, 100};

// Ex01

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

    int count_failing(int a[], int n) 
    { 
        return n - count_passing(a, n); 
    }

// Ex02
    void print_bar(int n) {
        for (int i = 1; i <= n; i++) {
            printf("*");
        }
        printf("\n");
    }

    void print_bars(int a[], int n) {
        for (int i = 0; i < n; i++) {
            printf("%3d ", a[i]);
            print_bar(a[i] / 10);
        }
    }

// Ex03

// Functions

    int total(int a[], int n) {
        
        int aSum = 0;
        for (int i = 0; i < n; i++)
        {
            aSum += a[i];
        }
        return aSum;
    }

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

    double average(int a[], int n)
    {
        return (double) total(a, n) / n;
    }

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
// end functions 

    void print_report(int a[], int n) 
    { 
        printf("total: %d\n", total(a, n)); 
        printf("average: %.1f\n", average(a, n)); 
        printf("max: %d\n", max_score(a, n)); 
        printf("passing: %d\n", count_passing(a, n)); 
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
        /* count_failing : int[] int -> int */
        check_int(count_failing(scores, 5), 0);
        check_int(count_failing(mixed, 5), 2);
        print_bars(scores, 5);
        print_report(scores, 5);
        return 0; 
    }