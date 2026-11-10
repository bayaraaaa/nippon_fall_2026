#include <stdio.h>

int total(int a[], int n)
{
    int sum = 0;
    for (int i = 0; i < n; i++)
    {
        sum += a[i];
    }
    return sum;
}

double average(int a[], int n)
{
    return total(a, n) / n;
}

int main(void) {
    int scores[5] = {70, 82, 95, 63, 88};
    FILE *f = fopen("report.txt", "w");
    if (f == NULL) {
        printf("файл нээгдсэнгүй\n");
        return 1;
    }
    for (int i = 0; i < 5; i++) {
        fprintf(f, "%d\n", scores[i]);
    }

    fprintf(f, "total: %d\n", total(scores, 5)); 
    fprintf(f, "average: %.1f\n", average(scores, 5));

    fclose(f);
    printf("report.txt бичигдлээ\n");
    return 0;
}