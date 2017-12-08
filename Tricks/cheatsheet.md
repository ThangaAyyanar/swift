Basic details and tricks of swift can be found in the following website
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html#//apple_ref/doc/uid/TP40014097-CH2-ID1

### Create a array of fixed size in swift

```
var digitCounts = Array(repeating: 0, count: 10)
```

### Create array of objects of fixed size

```
var array:[dummy]?                                                              // creating a array of objects for dummy class
array = [dummy?](repeating: initializeObjects(), count: 10) as? [dummy]         // 10 objects is created
for i in 0...recordCount-1{
    array![i] = initializeObjects()
    self.addSubview(array![i])
}

func initializeObjects() -> dummy{
        let temp = dummy()
        temp.translatesAutoresizingMaskIntoConstraints = false                // this is not mandatory 
        return tempGridCell
}

Note:

here i called initializeObjects two times in array initialization and allocation if not called at initialization it gives me error 
thats why i used in both 

if you know more efficient code e-mail me at "gldayan8 [ at ] gmail [ dot ] com"

Other way is 
=============

To create an empty array or dictionary, use the initializer syntax.

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

these are empty array so we can append the values 
here we cannot make complex with optionals(?)

```

### How to adjust and make the width of a UILabel to fit the text size

```
label.text ="some text" .  // simple way
label.sizeToFit()

//another way 

intrinsicContentSize

well i always use Autolayout constraints for Label or UIView so i will change the constant of the constraint if the instrinsicContentSize of the Label changes after the text is assigned

```

### Dynamically change the height of the table view cell
```
Tableview.rowHeight = UITableViewAutomaticDimension . // in view did load
Tableview.estimatedRowHeight = newValue 

and also we need to return UITableViewAutomaticDimension for heightForRowAt function

//well this will change the height of table
```

### Prevent view from hiding behind UINavigation controller when scrolling
```
self.navigationController?.navigationBar.isTranslucent = false
//set the translucent to false
```

### To Multiselect with radio in table view
```
Tableview.setEditing(true, animated: true) .                    //This will call the function editingStyleForRowAt
Tableview.allowsMultipleSelectionDuringEditing = true


func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle{
        return UITableViewCellEditingStyle.delete
    }

```

### Singleton class in swift

```
class NetworkManager {

    // MARK: - Properties

    static let shared = NetworkManager(baseURL: API.baseURL)

    // MARK: -

    let baseURL: URL

    // Initialization

    private init(baseURL: URL) {
        self.baseURL = baseURL
    }

}

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    print(NetworkManager.shared)
    return true
}
```
Reference:https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift/

### Default value for Optionals

Another way to handle optional values is to provide a default value using the ?? operator. If the optional value is missing, the default value is used instead.

```
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
```

### Powerful features of switch in swift
```
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
```

### Iterating through the Dictionary
```
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
```
### Return Mutiple values from the function
```
The elements of a tuple can be referred to either by name or by number.

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)
```

### how to hide the scrollbar indicator in the tableview
```
Tableview.showsVerticalScrollIndicator = false

for horizontal change vertical to horizontal
```

### how to scroll two tableview in a view simultaneously

```

In scroll view did scroll function 

if (scrollView == Tableview1) {
    reportTableview.contentOffset = scrollView.contentOffset;
} else if (scrollView == Tableview2) {
    checkBoxTableview.contentOffset = scrollView.contentOffset;
}

```
