### Convert String to Data and Data to String

Convert String to Data format
```
let data = string.data(using: .utf8)
```
Converting back from Data to string
```
 let str = String(data: data, encoding: String.Encoding.utf8) as String!
```

### how to hide lines in tableview

```
tableView.separatorColor = [UIColor clearColor];

for swift

tableView.separatorColor = .clear
```

### How to check if optional is not nil and it contains something

```
if let text = history.text where !text.isEmpty {
    history.text = "\(text)\nsome content"
}
```
