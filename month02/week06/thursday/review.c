#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include "check.h"

// Ex01
/* count_inversions : int[] int -> int
    i < j боловч a[i] > a[j] хосын тоо (= bubble sort-ийн солилцоо) */
int countInversions(int arr[], int size)
{
    int swaps = 0;
    for (int i = 0; i < size - 1; i++)
    {
        int swapped = 0;
        for (int j = 0; j < size - 1 - i; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                int t = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = t;
                swaps++;
                swapped = 1;
            }
        }
        if (swapped == 0) {
            break;
        }
    }
    return swaps;
}
// Ex02
/* insertion_sort : int[] int -> int   шилжилтийн тоо (L13) */
int insertionSort(int arr[], int n) {
    int shifts = 0;
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            shifts++;
            j--;
        }
        arr[j + 1] = key;
    }
    return shifts;
}

int isSorted(int arr[], int n) {
    for (int i = 1; i < n; i++) {
        if (arr[i - 1] > arr[i]) {
            return 0;
        }
    }
    return 1;
}

// Ex03
/* median : int[] int -> int   n сондгой; эрэмбэлээд дунд элемент */

int compare(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

int median(const int arr[], int size) {
    // Allocate a temporary array so we don't mutate the original
    int *temp = malloc(size * sizeof(int));
    if (temp == NULL) {
        return 0; // Handle memory allocation failure
    }

    for (int i = 0; i < size; i++) {
        temp[i] = arr[i];
    }

    // Sort the temporary array
    qsort(temp, size, sizeof(int), compare);

    int med;
    if (size % 2 != 0) {
        // Odd number of elements: take the exact middle
        med = temp[size / 2];
    } else {
        // Even number of elements: average the two middle numbers
        med = (temp[(size / 2) - 1] + temp[size / 2]) / 2;
    }

    free(temp);
    return med;
}

int main(void)
{
    /* count_inversions : int[] int -> int
    i < j боловч a[i] > a[j] хосын тоо (= bubble sort-ийн солилцоо) */
    int a[6] = {5, 2, 8, 1, 9, 3};
    int s[3] = {1, 2, 3};
    checkInt(countInversions(a, 6), 7);
    checkInt(countInversions(s, 3), 0);

    /* insertion_sort : int[] int -> int   шилжилтийн тоо (L13) */
    int b[6] = {5, 2, 8, 1, 9, 3};
    checkInt(insertionSort(b, 6), 7);
    checkInt(isSorted(b, 6), 1);

    /* median : int[] int -> int   n сондгой; эрэмбэлээд дунд элемент */
    int c[5] = {5, 2, 8, 1, 9};
    int d[3] = {7, 7, 1};
    checkInt(median(c, 5), 5);
    checkInt(median(d, 3), 7);

    return 0;
}