import Foundation
/*
The program to seperate the postive and negative element in an array(order of the element is important
*/
func findnextnegative(array:[Int],start:Int) -> Int{ //function to find the index of negative element
	for i in start..<array.count{
		if(array[i] < 0){
			return i;
		}
	}
	return -1;
}

var negative:Int,swap:Int;
var array = [-1,2,-3,4,1]

for i in 0..<array.count{ //loop to traverse the elements
	if(array[i] > 0){    // to check wheth
		negative=findnextnegative(array:array,start:i)
		if(negative>0){
			for j in i..<negative{
				swap = array[i]
				array[i] = array[i+1]
				array[i+1] = swap
			}
		}else{
			break;
		}
	}
}
for i in 0..<array.count{
	print(array[i])
}
