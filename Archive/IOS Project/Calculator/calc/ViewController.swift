//
//  ViewController.swift
//  calc
//
//  Created by administrator on 01/07/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let buttons = "123+456-789*0=C/"
    let secondaryview = UIView()
    let normalview = UIView()
    var display = UILabel()
    var globalconstraints1 = NSLayoutConstraint()
    var globalconstraints2 = NSLayoutConstraint()
    var globalconstraints3 = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addNormalOperation()
        addSecondaryOperation()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if(UIDevice.current.orientation.isLandscape){
            secondaryview.isHidden = false
            globalconstraints1.isActive = false
            globalconstraints2.isActive = true
            globalconstraints3.isActive = true
            
        }else{
            globalconstraints1.isActive = true
            globalconstraints2.isActive = false
            globalconstraints3.isActive = false
            secondaryview.isHidden = true
        }
    }
    
    func create_button(val:String) -> UIButton{
        let button = UIButton()
        button.setTitle(val, for: .normal)
        button.backgroundColor = UIColor.gray
        button.setTitleColor(.black , for: .normal)
        button.addTarget(self, action: #selector(sendtitle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints=false
        return button
    }
    
    func sendtitle(sender:UIButton){
        display.text = display.text! + sender.currentTitle!
    }
    
    func addLabel(){
        display = {
            let label = UILabel()
            label.text = "0"
            label.translatesAutoresizingMaskIntoConstraints=false
            label.frame = CGRect(x: view.frame.size.width, y: 50, width: view.frame.size.width, height: 30)
            label.textAlignment = .right
            label.textColor = UIColor.white
            label.backgroundColor = UIColor.black
            return label
        }()
        
        view.addSubview(display)
        
        NSLayoutConstraint(item: display, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: display, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 80).isActive = true
        NSLayoutConstraint(item: display, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: display, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    }

    func addNormalOperation(){
        
        addLabel()
        
        normalview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(normalview)
        NSLayoutConstraint(item: normalview, attribute: .top, relatedBy: .equal, toItem: display, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        normalview.backgroundColor = UIColor.black
        globalconstraints1 = NSLayoutConstraint(item: normalview, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        globalconstraints1.isActive = true
        NSLayoutConstraint(item: normalview, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: normalview, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        var buttonarray:[UIButton]=[]
        
        //to create a array of buttons
        for i in buttons.characters{
            let temp:UIButton = create_button(val: String(i))
            normalview.addSubview(temp)
            buttonarray.append(temp)
        }
        
        NSLayoutConstraint(item: buttonarray[0], attribute: .top, relatedBy: .equal, toItem: normalview, attribute: .top, multiplier: 1.0, constant: 5).isActive = true
        NSLayoutConstraint(item: buttonarray[0], attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: normalview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 5).isActive = true
        
        NSLayoutConstraint(item: buttonarray[0], attribute: .width, relatedBy: .equal, toItem: normalview, attribute: .width, multiplier: 0.25, constant: -5).isActive = true
        NSLayoutConstraint(item: buttonarray[0], attribute: .height, relatedBy: .equal, toItem: normalview, attribute: .height, multiplier: 0.25, constant: -5).isActive = true
        
        for i in 1..<buttons.characters.count{
            if i%4 == 0{
                
                buttonarray[i-1].backgroundColor = UIColor.orange
                //buttonarray[i-1].setTitleColor(.white, for: .normal)
                
                NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: buttonarray[0], attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: buttonarray[i], attribute: .top, relatedBy: .equal, toItem: buttonarray[i-4], attribute: .bottom, multiplier: 1, constant: 5).isActive = true
                
                
            }else{
                NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: buttonarray[i-1], attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: buttonarray[i], attribute: .top, relatedBy: .equal, toItem: buttonarray[i-1], attribute: .top, multiplier: 1, constant: 0).isActive = true
            }
//            NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: normalview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: ).isActive = true
            
            NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: buttonarray[0], attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0).isActive = true
            
            NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: buttonarray[0], attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0).isActive = true
        }
        
        buttonarray[buttons.characters.count-1].backgroundColor = UIColor.orange
        
    }
    
    func addSecondaryOperation(){
        
        secondaryview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondaryview)
        secondaryview.backgroundColor = UIColor.black
        secondaryview.isHidden = true;
        
        globalconstraints2 = NSLayoutConstraint(item: secondaryview, attribute: .width, relatedBy: .equal, toItem: normalview, attribute: .width, multiplier: 1, constant:0)
        globalconstraints2.isActive = false
        globalconstraints3 = NSLayoutConstraint(item: secondaryview, attribute: .trailing, relatedBy: .equal, toItem: normalview, attribute: .leading, multiplier: 1, constant: 0)
        globalconstraints3.isActive = false
        NSLayoutConstraint(item: secondaryview, attribute: .top, relatedBy: .equal, toItem: display, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: secondaryview, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: secondaryview, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        var buttonarray:[UIButton]=[]
        
        //to create a array of buttons
        for i in buttons.characters{
            let temp:UIButton = create_button(val: String(i))
            secondaryview.addSubview(temp)
            buttonarray.append(temp)
        }
        
        NSLayoutConstraint(item: buttonarray[0], attribute: .top, relatedBy: .equal, toItem: secondaryview, attribute: .top, multiplier: 1.0, constant: 5).isActive = true
        NSLayoutConstraint(item: buttonarray[0], attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: secondaryview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 5).isActive = true
        
        NSLayoutConstraint(item: buttonarray[0], attribute: .width, relatedBy: .equal, toItem: secondaryview, attribute: .width, multiplier: 0.25, constant: -5).isActive = true
        NSLayoutConstraint(item: buttonarray[0], attribute: .height, relatedBy: .equal, toItem: secondaryview, attribute: .height, multiplier: 0.25, constant: -5).isActive = true
        
        for i in 1..<buttons.characters.count{
            if i%4 == 0{
                
                
                NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: buttonarray[0], attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: buttonarray[i], attribute: .top, relatedBy: .equal, toItem: buttonarray[i-4], attribute: .bottom, multiplier: 1, constant: 5).isActive = true
                
            }else{
                NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: buttonarray[i-1], attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: buttonarray[i], attribute: .top, relatedBy: .equal, toItem: buttonarray[i-1], attribute: .top, multiplier: 1, constant: 0).isActive = true
            }
            //            NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: normalview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: ).isActive = true
            
            NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: buttonarray[0], attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0).isActive = true
            
            NSLayoutConstraint(item: buttonarray[i], attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: buttonarray[0], attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0).isActive = true
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

