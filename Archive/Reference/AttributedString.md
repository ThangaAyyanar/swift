src: https://stackoverflow.com/questions/24666515/how-do-i-make-an-attributed-string-using-swift

This answer has been updated for Swift 3.0.

Quick Reference

The general form for making and setting an attributed string is like this. You can find other common options below.

        // create attributed string
        let myString = "Swift Attributed String"
        let myAttribute = [ NSForegroundColorAttributeName: UIColor.blue ]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute) 

        // set attributed text on a UILabel
        myLabel.attributedText = myAttrString
        Text Color

        let myAttribute = [ NSForegroundColorAttributeName: UIColor.blue ]
        Background Color

        let myAttribute = [ NSBackgroundColorAttributeName: UIColor.yellow ]
        Font

        let myAttribute = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 18.0)! ]
        enter image description here

        let myAttribute = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue ]
        enter image description here

        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3
        myShadow.shadowOffset = CGSize(width: 3, height: 3)
        myShadow.shadowColor = UIColor.gray

        let myAttribute = [ NSShadowAttributeName: myShadow ]
        The rest of this post gives more detail for those who are interested.

Attributes

String attributes are just a dictionary in the form of [String: Any], where String is the key name of the attribute and Any is the value of some Type. The value could be a font, a color, an integer, or something else. There are many standard attributes in Swift that have already been predefined. For example:

          key name: NSFontAttributeName, value: a UIFont
          key name: NSForegroundColorAttributeName, value: a UIColor
          key name: NSLinkAttributeName, value: an NSURL or String
          There are many others. See this link for more. You can even make your own custom attributes.

key name: MyCustomAttributeName, value: some Type.
Creating attributes in Swift

You can declare attributes just like declaring any other dictionary.

          // single attributes declared one at a time
          let singleAttribute1 = [ NSForegroundColorAttributeName: UIColor.green ]
          let singleAttribute2 = [ NSBackgroundColorAttributeName: UIColor.yellow ]
          let singleAttribute3 = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.styleDouble.rawValue ]

          // multiple attributes declared at once
          let multipleAttributes: [String : Any] = [
              NSForegroundColorAttributeName: UIColor.green,
              NSBackgroundColorAttributeName: UIColor.yellow,
              NSUnderlineStyleAttributeName: NSUnderlineStyle.styleDouble.rawValue ]

          // custom attribute
          let customAttribute = [ "MyCustomAttributeName": "Some value" ]
          Note the rawValue that was needed for the underline style value.

Because attributes are just Dictionaries, you can also create them by making an empty Dictionary and then adding key-value pairs to it. If the value will contain multiple types, then you have to use Any as the type. Here is the multipleAttributes example from above, recreated in this fashion:

          var multipleAttributes = [String : Any]()
          multipleAttributes[NSForegroundColorAttributeName] = UIColor.green
          multipleAttributes[NSBackgroundColorAttributeName] = UIColor.yellow
          multipleAttributes[NSUnderlineStyleAttributeName] = NSUnderlineStyle.styleDouble.rawValue
          Attributed Strings

Now that you understand attributes, you can make attributed strings.

Initialization

There are a few ways to create attributed strings. If you just need a read-only string you can use NSAttributedString. Here are some ways to initialize it:

          // Initialize with a string only
          let attrString1 = NSAttributedString(string: "Hello.")

          // Initialize with a string and inline attribute(s)
          let attrString2 = NSAttributedString(string: "Hello.", attributes: ["MyCustomAttribute": "A value"])

          // Initialize with a string and separately declared attribute(s)
          let myAttributes1 = [ NSForegroundColorAttributeName: UIColor.green ]
          let attrString3 = NSAttributedString(string: "Hello.", attributes: myAttributes1)
          If you will need to change the attributes or the string content later, you should use NSMutableAttributedString. The declarations are very similar:

          // Create a blank attributed string
          let mutableAttrString1 = NSMutableAttributedString()

          // Initialize with a string only
          let mutableAttrString2 = NSMutableAttributedString(string: "Hello.")

          // Initialize with a string and inline attribute(s)
          let mutableAttrString3 = NSMutableAttributedString(string: "Hello.", attributes: ["MyCustomAttribute": "A value"])

          // Initialize with a string and separately declared attribute(s)
          let myAttributes2 = [ NSForegroundColorAttributeName: UIColor.green ]
          let mutableAttrString4 = NSMutableAttributedString(string: "Hello.", attributes: myAttributes2)
          Changing an Attributed String

          As an example, let's create the attributed string at the top of this post.

          First create an NSMutableAttributedString with a new font attribute.

          let myAttribute = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 18.0)! ]
          let myString = NSMutableAttributedString(string: "Swift", attributes: myAttribute )
          If you are working along, set the attributed string to a UITextView (or UILabel) like this:

          textView.attributedText = myString
          You don't use textView.text.

Here is the result:

enter image description here

Then append another attributed string that doesn't have any attributes set. (Notice that even though I used let to declare myString above, I can still modify it because it is an NSMutableAttributedString. This seems rather unSwiftlike to me and I wouldn't be surprised if this changes in the future. Leave me a comment when that happens.)

          let attrString = NSAttributedString(string: " Attributed Strings")
          myString.append(attrString)
enter image description here

Next we'll just select the "Strings" word, which starts at index 17 and has a length of 7. Notice that this is an NSRange and not a Swift Range. (See this answer for more about Ranges.) The addAttribute method lets us put the attribute key name in the first spot, the attribute value in the second spot, and the range in the third spot.

          var myRange = NSRange(location: 17, length: 7) // range starting at location 17 with a lenth of 7: "Strings"
          myString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: myRange)
          enter image description here

Finally, let's add a background color. For variety, let's use the addAttributes method (note the s). I could add multiple attributes at once with this method, but I will just add one again.

          myRange = NSRange(location: 3, length: 17)
          let anotherAttribute = [ NSBackgroundColorAttributeName: UIColor.yellow ]
          myString.addAttributes(anotherAttribute, range: myRange)
          enter image description here

Notice that the attributes are overlapping in some places. Adding an attribute doesn't overwrite an attribute that is already there.

Related

How to change the text of an NSMutableAttributedString but keep the attributes
Further Reading

How to retrieve the attributes from a tap location
Attributed String Programming Guide (very informitive but unfortunately only in Objective-C)
