/*

Simple delegate example 

*/

import UIKit

protocol PersonProtocol{
  func getName() -> String
  func getAge() -> Int
}

class Person{
  
  var delegate:PersonProtocol!
  
  func personName() -> String{
    if let tempDelegate = delegate {
      return tempDelegate.getName()
    }else{
      return "No Name Provided by Delegate"
    }
  }
  
  func personAge() -> Int{
    if let tempDelegate = delegate {
      return tempDelegate.getAge()
    }else{
      return 0
    }
  }

}

class ViewController : UIViewController{
  
  var person:Person!                                       // somewhat similar to IBoutlet
  
  override func viewDidLoad(){
    super.viewDidLoad()
    person.delegate = self                                //  here the delegate is initialized
    
    print("Name of the Person " \(person.personName()))   //  calling the func get the value from getName in this class
    print("Age of the Person " \(person.personAge()))
    
  }
  
  func getName() -> String {
    return "Ayyanar"
  }
  
  func getAge() -> Int {
    return 20
  }
  
}

/*

source: https://www.youtube.com/watch?v=RNtkg0az_Os

Check this youtube video for more explanation on this topic

*/
