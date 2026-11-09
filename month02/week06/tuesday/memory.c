#include <stdio.h>
#include <string.h>


int main(void)
{
    char word[] = "cat";
    printf("%zu\n", sizeof word);
    printf("%zu\n", strlen(word));

    printf("%d\n", word[3]); // \0
    printf("%c\n", word[0]); // c

    word[0] = 'b';
    printf("%s\n", word);

    char a[] = "hi";
    char b[] = "hi";
    printf("%d\n", strcmp(a, b) == 0);
    printf("%d\n", strcmp("apple", "banana") < 0);

    return 0;
}