# how to programmatically do some stuff

## 1) How to perform segue Programmatically in swift?

If your segue exists in the storyboard with a segue identifier between your two views, you can just call it programmatically using:

performSegue(withIdentifier: "mySegueID", sender: nil)
For older versions:

performSegueWithIdentifier("mySegueID", sender: nil)
You could also do:

presentViewController(nextViewController, animated: true, completion: nil)
Or if you are in a Navigation controller:

self.navigationController?.pushViewController(nextViewController, animated: true)

src: https://stackoverflow.com/questions/27604192/ios-how-to-segue-programmatically-using-swift

## 2) Add Button,Label,Imageview to the ViewController Programmatically in swift?

### For Button

override func viewDidLoad() {
  super.viewDidLoad()

  let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
  button.backgroundColor = .green
  button.setTitle("Test Button", for: .normal)
  button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

  self.view.addSubview(button)
}

func buttonAction(sender: UIButton!) {
  print("Button tapped")
}

### For Label

    var label: UILabel = UILabel()
    label.frame = CGRectMake(50, 50, 200, 21)
    label.backgroundColor = UIColor.blackColor()
    label.textColor = UIColor.whiteColor()
    label.textAlignment = NSTextAlignment.Center
    label.text = "test label"
    self.view.addSubview(label)
    
### For Textfield

    var txtField: UITextField = UITextField()
    txtField.frame = CGRectMake(50, 70, 200, 30)
    txtField.backgroundColor = UIColor.grayColor()
    self.view.addSubview(txtField)

src: https://stackoverflow.com/questions/24030348/how-to-create-a-button-programmatically

## 3) ViewController with Navigation controller

src: https://stackoverflow.com/questions/25444213/presenting-viewcontroller-with-navigationviewcontroller-swift
