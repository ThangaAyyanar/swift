/*

example

[5,6,3,4,2]

5>6 false
6>3 6>4 6>2  -> leader
3>4 false
4>2 -> leader
2 -> leader

the current number greater than all rightmost element then it is called as leader


*/

import Foundation

var array = [5,6,3,4,2]
print("The leader statements are")
var currentMaximum = array[array.count-1];
var n = array.count - 1
print(array[n])

//the for loop work in reverse from n to 0 

for i in (0..<n).reversed(){
	if(array[i] > currentMaximum){
		print(array[i])
		currentMaximum = array[i]
	}
}
