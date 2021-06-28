//
//  Tableview.swift
//  thirdparty
//
//  Created by administrator on 03/07/17.
//  Copyright © 2017 administrator. All rights reserved.
//
//
//import UIKit
//import FirebaseDatabase
//
//class TableView{
//    static func observeMessages() {
//        
//        let ref = Database.database().reference(fromURL: "https://sample-43aed.firebaseio.com/").child("chats")
//    
//        let messageQuery = ref.queryLimited(toLast:25)
//        
//        messageQuery.observe(.childAdded, with: { (snapshot) -> Void in
//            
//            let messageData = snapshot.value as! Dictionary<String, String>
//            
//            if let user = messageData["user"] as String!, let msg = messageData["msg"] as String! {
//                
//                currentmessage.append(user + " : " + msg)
//            
//                
//            } else {
//                print("Error! Could not decode message data")
//            }
//        })
//        table.reloadData()
//    }
//}
