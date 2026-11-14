#include <stdio.h>
#include <string.h>
struct student {
    char name[20];
    int quiz;
    int project;
};

int main(void) {
    struct student group[6] = {
        {"Aki", 80, 90}, {"Sora", 60, 60}, {"Mina", 95, 91},
        {"Ren", 45, 55}, {"Bat", 70, 75}, {"Uka", 100, 34}
    };
    printf("%s\n", group[2].name);
    printf("%d\n", group[3].project);
    printf("%c\n", group[4].name[0]);
    group[1].quiz = 90;
    printf("%d\n", group[1].quiz);
    struct student copy = group[0];
    copy.project = 0;
    printf("%d\n", group[0].project);
    return 0;
}