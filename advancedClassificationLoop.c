#include "NumClass.h"
#include <math.h>

int isPalindrome(int i){
    int palind;
    int rev=0;
    int temp=i;
    while(temp>0){
        palind = temp%10;
        rev= rev*10 +palind;
        temp = temp/10;
    }
    if(rev==i){
        return 1;
    }
    else{
        return 0;
    }
}
    int numLen(int i){
        int length=0;
        while(i!=0){
            i=i/10;
            length++;
        }
        return length;
    }

    int power(int oneNum, int length){
    int total=oneNum;
    for(int i=0;i<length-1;i++){
        total=total*oneNum;
    }
    return total;
}

    int isArmstrong(int i){
        int len= numLen(i);
        int oneNum;
        int sum=0;
        while(i!=0){
            oneNum=i%10;
            sum=sum+power(oneNum,len);
            i=i/10;
        }
        if(sum==i){
            return 1;
        }
        else {return 0;}
    }



