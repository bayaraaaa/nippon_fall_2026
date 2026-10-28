#include <stdio.h>


// Ex01

/* is_passing : double -> int
   60 ба түүнээс дээш бол 1, үгүй бол 0 */

double is_passing(double score)
{
    if (score >= 60) {
        return 1;
    } else {
        return 0;
    }
}

// Ex02

/* letter_grade : double -> char   (дээрх кодыг өөрөө бич) */

char letter_grade(double score)
{
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

// Ex03
/* in_range : int int int -> int
        lo <= x <= hi бол 1  (&& ашигла) */

int in_range(int x, int lo, int hi)
{
    return lo <= x && hi >= x;
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
    /* is_passing : double -> int
        60 ба түүнээс дээш бол 1, үгүй бол 0 */
    check_int(is_passing(60.0), 1);
    check_int(is_passing(59.8), 0);

    /* letter_grade : double -> char   (дээрх кодыг өөрөө бич) */
    check_int(letter_grade(92.6), 'A');
    check_int(letter_grade(86.0), 'B');
    check_int(letter_grade(90.0), 'A');
    check_int(letter_grade(60.0), 'D');
    check_int(letter_grade(51.0), 'F');

    /* in_range : int int int -> int
        lo <= x <= hi бол 1  (&& ашигла) */
    check_int(in_range(5, 1, 10), 1);
    check_int(in_range(10, 1, 10), 1);
    check_int(in_range(11, 1, 10), 0);

    return 0;
}