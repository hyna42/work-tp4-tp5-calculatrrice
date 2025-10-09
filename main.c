#include <stdio.h>
#include <stdlib.h>
#include "functions.h"

int main(void)

{
    //  ceci est un commentaire
    puts("***CALCULATRICE***");
    float a = 2;
    float b = 3;
    float c = add(a, b);

    printf("Result = %.2f\n", c);
    return 0;
}