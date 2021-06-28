//
//  chatController.swift
//  thirdparty
//
//  Created by administrator on 04/07/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit
import FirebaseDatabase

var table:UITableView!
var MessageView:UIView!
struct Message{
    var user:String
    var msg:String
}

class chatController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var constraint1 : NSLayoutConstraint!
    private var constraint2 : NSLayoutConstraint!
    private var constraint3 : NSLayoutConstraint!
    private var currentmessage:[Message] = []
    var textview:UITextView!
    let cell1 = "lcell"
    let cell2 = "rcell"
    var KeyboardHeight:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentmessage.count)
        navigationItem.title = "Chat"
        DatabaseRelatedStuff()
        self.navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = .white
        AddEssentialComponents()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cell1)
        table.register(UITableViewCell.self, forCellReuseIdentifier: cell2)
    }
    
    func DatabaseRelatedStuff(){
                let ref = Database.database().reference()
        
                print(ref)
        
        
                ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
        
                    let value = snapshot.value as? NSDictionary
        
                    if(value![CurrentUser] == nil){
                        
                    }else{
                        print(value![CurrentUser]!)
                    }
        
                }) { (error) in
                    print(error.localizedDescription)
                }
        
        let chatReference = ref.child("chats").queryOrdered(byChild: "time")
                //currentmessage = []
                chatReference.observe(.childAdded, with: { (snapshot) in
                    let dict = snapshot.value as? [String : AnyObject] ?? [:]
                    print(dict)
                    print(dict["msg"]!)
                    self.newMessage(user: dict["user"] as! String, msg: dict["msg"] as! String)
                    print("===========================================================================")
                    print(self.currentmessage)
                    print("===========================================================================")
                    DispatchQueue.main.async(execute: {
                        table.reloadData()
                    })
                    self.tableViewScrollToBottom(animated:true)
                })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(currentmessage.count)
        return currentmessage.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textview.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == currentmessage.count-1){
            
        }
        print("Nubers :",currentmessage.count)
        if(((currentmessage[indexPath.row].user).range(of:CurrentUser)) != nil){
            let rcell = table.dequeueReusableCell(withIdentifier: cell2, for: indexPath)
            rcell.textLabel?.textAlignment = .right
            rcell.textLabel?.text = currentmessage[indexPath.row].msg
            return rcell
        }
        let lcell = table.dequeueReusableCell(withIdentifier: cell1, for: indexPath)
        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15.0),NSForegroundColorAttributeName:UIColor.magenta]
        let bod:NSMutableAttributedString = NSMutableAttributedString(string: currentmessage[indexPath.row].user, attributes: boldFontAttribute)
        bod.append(NSMutableAttributedString(string:(" : " + currentmessage[indexPath.row].msg)))
        lcell.textLabel?.attributedText = bod
        
        return lcell
    }
    
    func newMessage(user:String,msg:String){
        let temp:Message = Message(user: user, msg: msg)
        currentmessage.append(temp)
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view is disappering")
        //currentmessage = []
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        super.viewWillDisappear(animated)
    }
    
    func KeyboardShown(notification:NSNotification){
        print("keyboard Activated")
        guard let height:CGRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue else { return }
        print(height.size.height)
        
        constraint3.constant = -height.height
        
        UIView.animate(withDuration: 0, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion:nil)
        
        tableViewScrollToBottom(animated:true)
        
    }
    
    func KeyboardHidden(notification:NSNotification){
        constraint3.constant = 0
        UIView.animate(withDuration: 0, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion:nil)
        
        print("keyboard Deactivated")
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        checkOrientation()
    }
    
    func checkOrientation(){
        if UIDevice.current.orientation.isLandscape {
            constraint1.isActive = false
            constraint2.isActive = true
            
        }else{
            constraint1.isActive = true
            constraint2.isActive = false
            
        }
    }
    
    func AddEssentialComponents(){
        table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        MessageView = UIView()
        MessageView.translatesAutoresizingMaskIntoConstraints = false
        MessageView.backgroundColor = .white
        view.addSubview(MessageView)
        view.addSubview(table)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardShown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardHidden), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        textview = {
            let tv:UITextView = UITextView()
            tv.textAlignment = .justified
            tv.backgroundColor = .yellow
            tv.layer.cornerRadius = 10
            tv.translatesAutoresizingMaskIntoConstraints = false
            return tv
        }()
        
        let send:UIButton = {
            let button = UIButton()
            button.setTitle("Send", for: .normal)
            button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .red
            return button
        }()
        
        MessageView.addSubview(textview)
        MessageView.addSubview(send)
        
        NSLayoutConstraint(item: table, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: table, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: table, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: table, attribute: .bottom, relatedBy: .equal, toItem: MessageView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        constraint1 = NSLayoutConstraint(item: MessageView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.07, constant: 0)
        constraint1.isActive = false
        constraint2 = NSLayoutConstraint(item: MessageView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.12, constant: 0)
        constraint2.isActive = false
        NSLayoutConstraint(item: MessageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: MessageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        constraint3 = NSLayoutConstraint(item: MessageView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(constraint3)
        NSLayoutConstraint(item: textview, attribute: .leading, relatedBy: .equal, toItem: MessageView, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: textview, attribute: .top, relatedBy: .equal, toItem: MessageView, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: textview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: send, attribute: .top, relatedBy: .equal, toItem: MessageView, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: send, attribute: .width, relatedBy: .equal, toItem: MessageView, attribute: .width, multiplier: 0.15, constant: 0).isActive = true
        NSLayoutConstraint(item: send, attribute: .leading, relatedBy: .equal, toItem: textview, attribute: .trailing, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: send, attribute: .height, relatedBy: .equal, toItem: textview, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: send, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -5).isActive = true
        
        checkOrientation()
        
    }
    
    func sendMessage(){
        if(textview.text != ""){
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.none
            dateFormatter.timeStyle = DateFormatter.Style.short
            print(dateFormatter.string(from: NSDate() as Date))
            
            let ref = Database.database().reference(fromURL: "https://sample-43aed.firebaseio.com/")
            let messageTree = ref.child("chats")
            let uniquemsg = messageTree.childByAutoId()
            let currentmsg = [
                "user":CurrentUser,
                "msg":textview.text!,
                "time":dateFormatter.string(from: NSDate() as Date)
            ]
            uniquemsg.setValue(currentmsg)
            textview.text = ""
            textview.endEditing(true)
        }
    }
    
    func tableViewScrollToBottom(animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = table.numberOfSections
            let numberOfRows = table.numberOfRows(inSection: numberOfSections-1)
            
            if numberOfRows > 0 {
                let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                table.scrollToRow(at: indexPath, at: .bottom, animated: animated)
            }
        }
    }
    
    
    
    
}



//
//
//import UIKit
//import FirebaseDatabase
//
//var table:UITableView!
//
//class chatController: UITableViewController {
//    
//    let cellid = "cell"
//   
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        table = tableView
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(message))
//    
//        print(NSDate(timeIntervalSince1970: Double()))
//        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
//        
//        let ref = Database.database().reference()
//        
//        print(ref)
//        
//        ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
//            
//            let value = snapshot.value as? NSDictionary
//            
//            if(value![CurrentUser] == nil){
//                
//            }else{
//                print(value![CurrentUser]!)
//            }
//
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//        
////        ref.child("chats").observeSingleEvent(of: .value, with: { (snapshot) in
////            
////            //let value = snapshot.childSnapshot(forPath: "msg").value as? [String : AnyObject]
////            let value = snapshot.c
////            print(value!)
////            //currentmessage.append((value?["user"]!)! + " : " + (value?["msg"]!)!)
////            
////        }) { (error) in
////            print(error.localizedDescription)
////        }
//        
//        ref.child("chats").observe(DataEventType.value, with: { (snapshot) in
//            let dict = snapshot.value as? [String : AnyObject] ?? [:]
//            for (_,value) in dict{
//                //print(key)
//                for (k,v) in value as! Dictionary<String, String> as Dictionary{
//                    print(k)
//                    print(v)
//                }
//            }
//        })
//        
//        
//        
//    }
//    
//    func message(){
//        let message = messageController()
//        navigationController?.pushViewController(message, animated: true)
//    }
//    
//    
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return currentmessage.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
//        cell.textLabel?.text = currentmessage[indexPath.row]
//        //cell.detailTextLabel?.text = currentmessage[indexPath.row]
//        return cell
//    }
//    
//}
//
//class mycell : UITableViewCell{
//    
//    let l1 : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    let l2 : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    func setconstraints(){
//        addSubview(l1)
//        addSubview(l2)
//        NSLayoutConstraint(item: l1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 100).isActive = true
//        NSLayoutConstraint(item: l1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30).isActive = true
//        NSLayoutConstraint(item: l1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 300).isActive = true
//        NSLayoutConstraint(item: l1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30).isActive = true
//        
//    }
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setconstraints()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
