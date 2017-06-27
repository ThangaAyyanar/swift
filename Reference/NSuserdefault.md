# NSuserdefault is a way to store persistant information in swift

src : https://stackoverflow.com/questions/31203241/how-to-use-nsuserdefaults-in-swift
      https://stackoverflow.com/questions/30118735/swift-storing-and-retrieving-array-to-nsuserdefaults
      
## for swift 2.0 
    
        var arr = ["h","g","l"]

        func inital(){
            //NSUserDefaults.standardUserDefaults().setBool(true, forKey: "zoho")
             //NSUserDefaults.standardUserDefaults().setInteger(55, forKey: "zoho")
             NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "zoho")
        }

        func unwarp(){

            print( NSUserDefaults.standardUserDefaults().objectForKey("zoho")!)
            //print( NSUserDefaults.standardUserDefaults().stringForKey("zoho")!)
            //print( NSUserDefaults.standardUserDefaults().boolForKey("zoho"))
            //print( NSUserDefaults.standardUserDefaults().integerForKey("zoho"))
        }

## for swift 3.0

    ### Store

            UserDefaults.standard.set(true, forKey: "Key") //Bool
            UserDefaults.standard.set(1, forKey: "Key")  //Integer
            UserDefaults.standard.set("TEST", forKey: "Key") //setObject
            Retrieve

             UserDefaults.standard.bool(forKey: "Key")
             UserDefaults.standard.integer(forKey: "Key")
             UserDefaults.standard.string(forKey: "Key")
             
    ### Remove

             UserDefaults.standard.removeObject(forKey: "Key")
