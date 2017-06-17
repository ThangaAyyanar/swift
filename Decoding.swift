/*

consider a=1
         b=2 ......... z=26
         
         given a number 123 find how many ways it can be decoded
         
         eg: 
         123 -> abc
         123 -> kc   (k-12 c-3)
         123 -> aw   (a-1 w-23)
         
         o/p: 3

*/

import Foundation

var decode = 123
var dig:Int,possibilities = 1

while(decode >= 0){
	dig = decode%100;
	if(dig == 10 || dig == 20){
		continue;
	}
	else{
		if(dig > 10){
			possibilities += 1
		}
	}
	decode /= 10
}

print(possibilities)
