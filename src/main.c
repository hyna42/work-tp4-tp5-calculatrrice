#include <stdio.h>
#include "../lib/dynamicCalculatrice/dynamicCal.h"
#include "../lib/staticCalculatrice/staticCal.h"

int main(void)
{

    puts("********## CALCULATRICE WITH CMAKE ##********");

    unsigned int opType = 0;
    float a, b, s_result, d_result;

    do
    {
        printf("Choisir le type de l'opération\n------------------------------ \nAddition (1)\nSoustraction (2)\nMultiplication (3)\nDivision (4)\n------------------------------\n: ");
        scanf("%u", &opType);

        if (opType > 4 || opType < 1)
        {

            printf("Opération invalide, le nombre doit etre compris entre 1 et 4\n");
        }

    } while (opType < 1 || opType > 4);

    printf("Choisir deux entiers (format avec virgule, ex: 5,3 ) : ");
    scanf("%f, %f", &a, &b);

    switch (opType)
    {
    case 1:
        d_result = dynamicAddition(a, b);
        s_result = staticAddition(a, b);

        printf("[DYNAMIC] addition : %.2f + %.2f = %.2f\n", a, b, d_result);

        printf("[STATIC] addition : %.2f + %.2f = %.2f\n", a, b, s_result);
        break;
    case 2:
        d_result = dynamicSoustraction(a, b);
        s_result = staticSoustraction(a, b);

        printf("[DYNAMIC] soustraction : %.2f + %.2f = %.2f\n", a, b, d_result);

        printf("[STATIC] soustraction : %.2f + %.2f = %.2f\n", a, b, s_result);

        break;

    case 3:
        d_result = dynamicMultiplication(a, b);
        s_result = staticMultiplication(a, b);

        printf("[DYNAMIC] multiplication : %.2f + %.2f = %.2f\n", a, b, d_result);

        printf("[STATIC] multiplication : %.2f + %.2f = %.2f\n", a, b, s_result);

        break;

    case 4:
        if (b == 0)
        {
            printf("Erreur : Division par 0 impossible !");
            break;
        }

        d_result = dynamicDivision(a, b);
        s_result = staticDivision(a, b);

        printf("[DYNAMIC] division : %.2f + %.2f = %.2f\n", a, b, d_result);

        printf("[STATIC] division : %.2f + %.2f = %.2f\n", a, b, s_result);

        break;

    default:
        break;
    }
    return 0;
}