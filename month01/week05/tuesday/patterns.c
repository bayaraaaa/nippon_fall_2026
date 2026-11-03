#include <stdio.h>

void print_bar(int n) {
    for (int i = 1; i <= n; i++) {
        printf("*");
    }
    printf("\n");
}

void print_triangle(int n) {
    for (int row = 1; row <= n; row++) {
        print_bar(row);
    }
}

void print_rect(int w, int h) {
    while (h > 0)
    {
        h = h - 1;
        print_bar(w);
    }
    printf("\n");
}

void print_score_bar(int score) {
    score = score / 10;
    print_bar(score);
}

int main(void) {
    print_bar(5);
    print_triangle(3);

    /*  print_rect : int int -> void
        өргөн w, өндөр h тэгш өнцөгт. print_rect(4, 2) хэвлэх ёстой:
        ****
        ****
    */
    
    print_rect(4, 2);

    /*  print_score_bar : int -> void
        оноо бүрийн 10-д нэг од: print_score_bar(73) → *******
        (Баасан гаригийн scores.c-ийн диаграмд хэрэг болно) */
    
    print_score_bar(73);

    return 0;
}