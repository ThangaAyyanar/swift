import Foundation  // this is the basic header file which contains string,int and print ...


//variable declaration
var f1:Int = -1
var f2:Int = 1
var f3:Int
var n:Int = 10 

print("The fibonacci sequence for",n,"are")

//Generating fibonacci series
for i in 0..<n{
	f3=f1+f2
	print(f3)
	f1=f2
	f2=f3
}
