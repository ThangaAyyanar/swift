/*
 
 given a array we need to find the next greatest element than current element

*/
import Foundation

func find_greatest(array:[Int],start:Int) -> Int{ // function to find the next greatest element in array
	for i in start..<array.count{
		if(array[i] > array[start]){
			return array[i];
		}
	}
	return -1;
}

var array = [6,5,1,7,2]  
print("Next greatest element in an array")
var sum:Int;
for i in 0..<array.count{
	sum=find_greatest(array:array,start:i)
	print(array[i],"-->",sum)
}
