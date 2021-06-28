/*

given string "123123" maximum substring of even numbers which have same sum

123|123
 first part produce sum -> 6
 second part produce sum -> 6
 
 both sum are equal and total length of substring is 6 i.e (even)

*/
import Foundation

func findsum(array:[Int],start:Int,count:Int) -> Int{
	var sum = 0
	var s=start,cnt=count
	while(cnt > 0){
		sum += array[s]
		s += 1
		cnt -= 1
	}	
	return sum
}

var str:String = "123123"
var arr = [Int]()

var test:Int!
for i in 0..<str.characters.count{
	let index = str.index(str.startIndex, offsetBy: i)
	test=Int(String(str[index]))
	arr.append(test)
}
var j:Int,cnt:Int,max:Int=0,start:Int=0;
for i in 0..<arr.count{
	j=i+1
	cnt = 1
	while(j < arr.count){
		let res1 = findsum(array:arr,start:i,count:cnt)
		let res2 = findsum(array:arr,start:cnt,count:cnt)
		//print(res1," equal ",res2)
		if(res1 == res2){
			if(cnt > max){
				max=cnt;
				start = i;
			}
		}
		cnt += 1
		j += 2
	}
}
max *= 2
for i in start..<max{
	print(arr[i],terminator: "")
}
