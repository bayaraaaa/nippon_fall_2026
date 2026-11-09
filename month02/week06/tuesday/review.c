#include <stdio.h>
#include "check.h"

// Ex01
    /* index_of_max : int[] int -> int   n >= 1, эхний их утгын index */
int index_of_max(int array[], int size)
{
    int maxIndex = 0;
    for (int i = 0; i < size; i++)
    {
        if (array[i] > array[maxIndex])
        {
            maxIndex = i;
        }
    }
    return maxIndex;
}

// Ex02
    /* count_even : int[] int -> int */
int countEven(int array[], int size)
{
    int counter = 0;
    for(int i = 0; i < size; i++)
    {
        if(array[i] % 2 == 0)
        {
            counter += 1;
        }
    }
    return counter;
}

// Ex03
    /* digitSum 
    10 -> 1
    124 -> 7
    */

int digitSum(int number)
{
    if(number < 0)
    {
        number = -number;
    }
    int sum = 0;
    for (; 0 < number; number = number / 10)
    {
        sum = sum + number % 10;
    }
    return sum;
}

/* sumDigitsArray : int[] int -> int
   элемент бүрийн цифрийн нийлбэрийг нэмнэ (W5-ийн digit_sum-ийг дууд) */

int sumDigitsArray(int array[], int size)
{
    int sum = 0;
    for(int i = 0; i < size; i++)
    {
        int temp = digitSum(array[i]);
        sum = sum + temp;
    }
    return sum;
}

int main(void)
{
    /* index_of_max : int[] int -> int   n >= 1, эхний их утгын index */
    int scores[5] = {70, 82, 95, 63, 88};
    int tie[4] = {9, 9, 1, 2};
    checkInt(index_of_max(scores, 5), 2);
    checkInt(index_of_max(tie, 4), 0);

    /* count_even : int[] int -> int */
    checkInt(countEven(scores, 5), 3);
    checkInt(countEven(tie, 4), 1);

    /* digitSum : int[] int -> int
    элемент бүрийн цифрийн нийлбэрийг нэмнэ (W5-ийн digit_sum-ийг дууд) */
    checkInt(sumDigitsArray(scores, 5), 56);
    checkInt(sumDigitsArray(tie, 4), 21);

    return 0;
}