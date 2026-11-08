#include <stdio.h>

    int scores[5] = {70, 82, 95, 63, 88}; 
    int mixed[5] = {40, 60, 72, 58, 100};
     
    // Ex01

    int count_above(int s[], int size, int limit)
    {
        int c = 0;
        for (int i = 0; i < size; i++)
        {
            if (s[i] > limit)
            {
                c += 1;
            }
        }
        return c;        
        
    }

    // Ex02

    /* min_score : int[] int -> int   n >= 1 */

    int min_score(int a[], int size)
    {
        int n = 0;
        for (int i = 0; i < size; i++)
        {
            if(a[n] > a[i])
            {
                n = i;
            }
        }
        return a[n];
    }

    // Ex03

    /* contains : int[] int int -> int   1 эсвэл 0; find_index-ийг дууд */

    int contains(int a[], int size, int score)
    {
        for (int i = 0; i < size; i++)
        {
            if (a[i] == score)
            {
                return 1;
            }
        }
        return 0;
        
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
    /* count_above : int[] int int -> int
    limit-ээс ИХ (тэнцүү биш) оноо хэд вэ */
    check_int(count_above(scores, 5, 85), 2);
    check_int(count_above(mixed, 5, 100), 0);

    /* min_score : int[] int -> int   n >= 1 */
    check_int(min_score(scores, 5), 63);
    check_int(min_score(mixed, 5), 40);

    /* contains : int[] int int -> int   1 эсвэл 0; find_index-ийг дууд */
    check_int(contains(scores, 5, 63), 1);
    check_int(contains(scores, 5, 64), 0);

    return 0; 
}