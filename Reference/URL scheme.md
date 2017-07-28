# creating the URL scheme

* to create a URL scheme click the project root
* Info -> URL Types -> create new
* wala you get your url scheme

url scheme can be used to lauch app from other application 
eg:
  From widget to the main app
  
## Code to lauch the container app from the widget

        let url = URL.init(fileURLWithPath: "<URL scheme>")
        extensionContext?.open(url, completionHandler: nil)
