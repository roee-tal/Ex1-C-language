#include "NumClass.h"
#include <math.h>

    int numLen(int i){
        int length=0;
        while(i!=0){
            i=i/10;
            length++;
        }
        return length;
    }

     int reverseNum(int i,int sum){
        if(i==0) {
    		return sum;
    	}
        int rev;
        rev=i%10;
        sum=sum*10+rev;
        return reverseNum(i/10,sum);

    }

int isPalindrome(int i){
	int sum=0;
    if(i==reverseNum(i,sum)){
        return 1;
    }    
    return 0;
} 

int power(int oneNum, int length){
    int total=oneNum;
    for(int i=0;i<length-1;i++){
        total=total*oneNum;
    }
    return total;
}

int isArmstrong2(int i,int sum , int length){
    if(i==0){
        return sum;
    }
    int oneNum;
    oneNum=i%10;
    sum=sum+power(oneNum, length);
    return isArmstrong2(i/10, sum, length);
}

int isArmstrong(int i){
    int length=numLen(i);
    int sum=0;
    if(i==isArmstrong2(i,sum,length)){
        return 1;
    }
    return 0;
}

