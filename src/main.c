#include <stdio.h>
#include "../lib/dynamicCalculatrice/dynamicCalc.h"
#include "../lib/staticCalculatrice/staticCalc.h"

int main(void)

{

    puts("********** - CALCULATRICE WITH CMAKE - **********");

    // #########################################
    unsigned int opType = 0;
    int a = 0, b = 0;
    printf("Choisir le type de l'opération : addition (1) - soustraction (2) - multiplication (3) - division (4)");
    scanf("%d", &opType);

    printf("Choisir deux entiers (format exacte avec virgule, ex 5,3 ) %d, %d", a, b);
    scanf("%d, %d", &a, &b);

    switch (opType)
    {
    case 1:
        printf("Addition %d + %d = %d", a, b, dynamicAddition(a, b));
        break;
    case 2:
        printf("Soustraction %d - %d = %d", a, b, dynamicSoustraction(a, b));

        break;

    case 3:
        printf("Multiplication %d * %d = %d", a, b, staticMultiplication(a, b));
        break;

    case 4:
        if (b == 0)
        {
            printf("Erreur : Division par 0 impossible !");
            break;
        }

        printf("Multiplication %d * %d = %d", a, b, staticDivision(a, b));
        break;

    default:
        break;
    }
    return 0;
}