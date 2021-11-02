#include "NumClass.h"
#include <math.h>


int isPrime(int i){
    // double sqr = sqrt(i);
    for(int j=2; j<i/2+1; j++){
        if(i%j == 0)
            return 0;
    }
    return 1;
}

int factorial(int i){
    if(i==0){
        return 1;
    }
    return i*factorial(i-1);

}

int isStrong(int i){
    int temp=i;
    int sum=0;
    while (temp!=0){
        int j=temp%10;
        int fact=factorial(j);
        sum = sum +fact;
        temp=temp/10;
    }
    if(sum == i){
        return True;
    }
    else{
        return False;
    }
} 
