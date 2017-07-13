# Accessing API 

    func sendData(sender:UIButton!){
        view.backgroundColor = .white
        guard let Url = email.text else {
            return
        }
        let urlString = ("https://email-address-validation.p.mashape.com/validate?address="+Url) // url to be parsed
        guard let requestUrl = URL(string:urlString) else { return }
        var request = URLRequest(url:requestUrl)
        request.setValue("2mLo0qQAOZmshDTLRWuHvGzRiVDap1QvNexjsnWhqynAPfwl3k", forHTTPHeaderField: "X-Mashape-Key") //header information
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        print("********************************")
        print(request)
        print("********************************")
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if error == nil,let usableData = data {
                print("========================================")
                do{
                    let temp = try JSONSerialization.jsonObject(with: usableData, options: .mutableContainers) as! NSDictionary //convert the data to JSON and cast as Dictionary
                    print("the result",temp["is_valid"]!)
                    self.Validation(value: temp["is_valid"]! as! Bool)
                }catch {
                    print("error occured")
                }
                print(usableData) //JSONSerialization
//                
                //print("========================================")
//                print(response!)
//                print("========================================")
                   }
               }
               task.resume()

           }

           func Validation(value:Bool){
               if(value){
                   DispatchQueue.main.async { // to execute the below code in main thread
                       self.email.text = ""
                       self.view.backgroundColor = .green
                   }
               }else{
                   DispatchQueue.main.async {
                       self.view.backgroundColor = .red
                   }
               }
           }


 (Reading and writing)
 
 http://www.kaleidosblog.com/nsurlsession-in-swift-get-and-post-data
 
 https://code.bradymower.com/swift-3-apis-network-requests-json-getting-the-data-4aaae8a5efc0
