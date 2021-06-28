### How to find the height for the Label if the width is fixed 

```
extension String {
    func height(for width: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = self.boundingRect(for: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSFontAttributeName: font], context: nil)
        return actualSize.height
    }
}
```

boundingRect -> Returns the bounding rectangle required to draw the string

source: https://stackoverflow.com/questions/7174007/how-to-calculate-uilabel-height-dynamically
