# Property 

  
## Computed Property

        struct AlternativeRect {
            var origin = Point()
            var size = Size()
            var center: Point {
                get {
                    let centerX = origin.x + (size.width / 2)
                    let centerY = origin.y + (size.height / 2)
                    return Point(x: centerX, y: centerY)
                }
                set {
                    origin.x = newValue.x - (size.width / 2)
                    origin.y = newValue.y - (size.height / 2)
                }
            }
        }
        
        
## Read-Only Property

        struct Cuboid {
            var width = 0.0, height = 0.0, depth = 0.0
            var volume: Double {
                return width * height * depth
            }
        }
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
        
        
## Property Observer

 You have the option to define either or both of these observers on a property:

 *   willSet is called just before the value is stored.

 *   didSet is called immediately after the new value is stored.
 
 
             import UIKit
            var str = "Hello, playground"
            let minValue = 1
            class test{
                var temp = 1 {
                    didSet{                                 
                        if temp < minValue {
                            //propertyChanged()
                            temp = minValue
                        }
                    }
                }
                func check(){
                    temp = 10                       // temp becomes 10
                    temp = -30                      // temp becomes 1 not -30 why? because in didSet i changed when it is less than minValue
                    print(temp)
                }
                func propertyChanged(){
                    self.temp = 14
                }
            }
            var obj = test()
            obj.check()
            
            
 ## Reference
 https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html




