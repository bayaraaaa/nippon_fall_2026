#include <stdio.h>
#include <unistd.h>

int main(void) 
{
    printf("Би process %d\n", (int) getpid());
    fflush(stdout);
    sleep(30);
    printf("дууслаа\n");
    return 0;
}