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
