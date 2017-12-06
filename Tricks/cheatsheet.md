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

if you know more efficient code e-mail me at gldayan8@gmail.com

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
