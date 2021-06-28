//
//  messageController.swift
//  thirdparty
//
//  Created by administrator on 04/07/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit
import FirebaseDatabase



class messageController: UIViewController {
    var textfield:UITextField = UITextField()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        super.viewDidLoad()
        textfield={
            let field = UITextField()
            field.placeholder = "enter the message"
            field.translatesAutoresizingMaskIntoConstraints = false
            
            return field
        }()
        let button:UIButton = {
            let b = UIButton()
            b.setTitle("Text Him", for: .normal)
            b.setTitleColor(.blue, for: .normal)
            b.addTarget(self, action: #selector(insertfire), for: .touchUpInside)
            b.translatesAutoresizingMaskIntoConstraints = false
            return b
        }()
        self.view.addSubview(button)
        self.view.addSubview(textfield)
        NSLayoutConstraint(item: textfield, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive=true
        NSLayoutConstraint(item: textfield, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive=true
        NSLayoutConstraint(item: textfield, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive=true
        NSLayoutConstraint(item: textfield, attribute: .bottom, relatedBy: .equal, toItem: button, attribute: .top, multiplier: 1, constant: 0).isActive=true
        
        NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive=true
        NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive=true
        NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive=true
    }
    
    func insertfire(){
        if(textfield.text != ""){
            let ref = Database.database().reference(fromURL: "https://sample-43aed.firebaseio.com/")
            let messageTree = ref.child("chats")
            let uniquemsg = messageTree.childByAutoId()
            let currentmsg = [
                "user":CurrentUser,
                "msg":textfield.text!
            ]
            uniquemsg.setValue(currentmsg)
        }
    
        //TableView.observeMessages()
    }

}
