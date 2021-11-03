#include <stdio.h>
#include "NumClass.h"
#include <math.h>

int main(){
    int first;
    int second;
    scanf("%d%d",&first,&second);
    printf("The Armstrong numbers are:");
        for(int i=first; i<=second; i++){
            if(isArmstrong(i)==1){
                 printf(" %d", i);
            }
        }
        printf("\n");

    printf("The Palindromes are:");
        for(int i=first; i<=second; i++){
            if(isPalindrome(i)==1){
                 printf(" %d", i);
            }
        }
        printf("\n");
    
    printf("The Prime numbers are:");
        for(int i=first; i<=second; i++){
            if(isPrime(i)==1) {
                printf(" %d", i);
            }
        }
        printf("\n");
    
    printf("The Strong numbers are:");
        for(int i=first; i<=second; i++){
            if(isStrong(i)==1) {
                printf(" %d", i);
            }
        }
        printf("\n");
        printf("\n");

    }







 
