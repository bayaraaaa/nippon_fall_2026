#include <stdio.h>
#include <stdbool.h>

int sumOddTo(int limit)
{
    int sum = 0;
    for (int i = 0; i < limit; i++)
    {
        if (i % 2 == 1)
        {
            sum += i;
        }
    }
    return sum;
}

int main(void)
{
    // 1, 2, 4, 5 
    int munbers[4] = {1, 2, 4, 5};
    printf("%d \n", munbers[2]);

    // 
    int scores[5] = {70, 82, 95, 63, 88};

    printf("%d \n", scores[4]);
    printf("%d \n", scores[2]);
    printf("%d \n", scores[0]);

    // array value change
    // 63 -> 85
    printf("Before change %d \n", scores[3]);
    scores[3] = 85;
    printf("After change %d \n", scores[3]);

    printf("Before change %d \n", scores[0]);
    scores[0] = 95;
    printf("After change %d \n", scores[0]);

    // print all value of arrays
    char englishAlphabet[26] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    for(int i = 0; i < 26; i++)
    {
        printf("%c ", englishAlphabet[i]);
    }
    printf("\n");

    for(int i = 1; i <= 26; i++)
    {
        if(i == 1){
            printf("1-st letter: %c\n", englishAlphabet[0]);
        } else if (i == 2){
            printf("2-nd letter: %c\n", englishAlphabet[1]);
        } else if (i == 3){
            printf("3-rd letter: %c\n", englishAlphabet[2]);
        } else {
            printf("%d-th letter: %c\n", i, englishAlphabet[i - 1]);
        }

    }

    // size of array

    int size = sizeof(englishAlphabet);
    printf("%d\n", size);

    // number list to odd list

    int tenNumbers[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int tenNumbersSize = sizeof(tenNumbers) / sizeof(tenNumbers[0]);
    for(int i = 0; i < tenNumbersSize; i++)
    {
        printf("%d\n", tenNumbers[i]);
    }
    for(int i = 1; i <= tenNumbersSize; i++)
    {
        tenNumbers[i + 1] = i * 2;
    }
    printf("After\n");
    for(int i = 1; i <= tenNumbersSize; i++)
    {
        printf("%d \n", tenNumbers[i]);
    }


    
    printf("%d \n", sumOddTo(100));

    return 0;
}