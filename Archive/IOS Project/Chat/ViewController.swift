//
//  ViewController.swift
//  thirdparty
//
//  Created by administrator on 03/07/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

var CurrentUser:String!

class ViewController: UIViewController {
    var ref: DatabaseReference!
    var textfield:UITextField!,nick:UITextField!
    var status:UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        view.backgroundColor = .white
        FirebaseApp.configure()
        addComponents()
        ref = Database.database().reference()
        print(Database.database())  
        print(ref)
    }
    
    func addComponents(){
        textfield={
            let field = UITextField()
            field.translatesAutoresizingMaskIntoConstraints = false
            //field.addTarget(self, action: #selector(insertfire), for: .)
            field.placeholder = "Enter data"
            return field
        }()
        nick={
            let field = UITextField()
            field.translatesAutoresizingMaskIntoConstraints = false
            //field.addTarget(self, action: #selector(insertfire), for: .)
            field.placeholder = "Enter Your nick name"
            return field
        }()
        let button:UIButton = {
            let b = UIButton()
            b.setTitle("Insert To DB", for: .normal)
            b.setTitleColor(.blue, for: .normal)
            b.addTarget(self, action: #selector(insertfire), for: .touchUpInside)
            b.translatesAutoresizingMaskIntoConstraints = false
            return b
        }()
        status = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        self.view.addSubview(button)
        self.view.addSubview(nick)
        self.view.addSubview(textfield)
        self.view.addSubview(status)
        NSLayoutConstraint(item: textfield, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: textfield, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: textfield, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: nick, attribute: .top, relatedBy: .equal, toItem: textfield, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: nick, attribute: .top, relatedBy: .equal, toItem: textfield, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: nick, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: nick, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: nick, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 75).isActive = true
        NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: status, attribute: .top, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: status, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: status, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: status, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 75).isActive = true
    }
    
    
    func insertfire(sender:UIButton){
        let data = textfield.text
        let chat = chatController()
        
        status.text = ""
        if data! != "" && nick.text! != ""{
            let company = self.ref.child("users")
            let employee = company.child(nick.text!)
            employee.setValue(data)
            status.textColor = .green
            status.text = "Success"
            nick.text = ""
            textfield.text = ""
            
            
            
        }else if data! == "" && nick.text! != "" {
            CurrentUser = nick.text!
            navigationController?.pushViewController(chat, animated: true)
            //present(chat, animated: true, completion: nil)
        }else{
            //navigationController?.pushViewController(chat, animated: true)
            status.textColor = .red
            status.text = "Failure"
            nick.text = ""
            textfield.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

