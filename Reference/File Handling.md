# File Handling and sharing between the widget and App

## Writing to a file in appGroup

        let filemgr = FileManager.default
        let dirPaths = filemgr.containerURL(forSecurityApplicationGroupIdentifier: "<< app Group >>")
        let content = "Hello world"
        
        // Convert the string to data
        
        let data = content.data(using: String.Encoding.utf8)
        let filePath = dirPaths?.appendingPathComponent("file.txt")
        filemgr.createFile(atPath: (filePath?.path)!, contents: data, attributes: nil)
        
## Reading the file in the group location
        
        let readingdata:Data!
        let filePathForForms = dirPaths?.appendingPathComponent("objfile.txt")
        readingdata = filemgr.contents(atPath: (filePathForForms?.path)!)
        
        // Convert the data to string
        
        let unwarpfromdata:String = String(data: readingdata, encoding: String.Encoding.utf8)!
        print("print the data written by zoho forms \(unwarpfromdata)")
        
src:http://www.theappguruz.com/blog/working-ios-file-management-using-swift
