//
//  ProfileComponent.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 05/11/21.
//

import UIKit

class ProfileComponent{
    
    var bottomSheetView: BottomSheetView
    
    init(bottomSheetView: BottomSheetView) {
        self.bottomSheetView = bottomSheetView
    }
    
    func initialize() {
        
        // Creating View
        
        let bottonViewTitle = ViewHelper.getUILabel(text: "Starter Pack")
        bottonViewTitle.textAlignment = .center
        bottonViewTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        let profileView1 = PreviewView(profile: Profile(name: "Bulbasar", type: "Grass", imageName: "bulbasar"))
        profileView1.translatesAutoresizingMaskIntoConstraints = false
        let profileView2 = PreviewView(profile: Profile(name: "Charmander", type: "Fire", imageName: "chramander"))
        profileView2.translatesAutoresizingMaskIntoConstraints = false
        
        let nextButton = ViewHelper.getUIButton(color: ColorHelper.green)
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.layer.cornerRadius = 35
        nextButton.addTarget(self, action: #selector(bottomSheetView.showWalletBalance), for: .touchUpInside)
        
        // Adding constraints and Animation
        
        bottomSheetView.containerView.addSubview(bottonViewTitle)
        bottomSheetView.containerView.addSubview(profileView1)
        bottomSheetView.containerView.addSubview(profileView2)
        bottomSheetView.containerView.addSubview(nextButton)
        
        let bottomTitleWidthConstraint: NSLayoutConstraint = bottonViewTitle.widthAnchor.constraint(equalToConstant: 200)
        let bottomTitleHeightConstraint: NSLayoutConstraint = bottonViewTitle.heightAnchor.constraint(equalToConstant: 40)
        
        var profileView1LeftConstraint: NSLayoutConstraint = profileView1.leftAnchor.constraint(equalTo: bottomSheetView.containerView.rightAnchor, constant: 35)
        
        NSLayoutConstraint.activate([
            
            bottonViewTitle.centerXAnchor.constraint(equalTo: bottomSheetView.containerView.centerXAnchor),
            bottonViewTitle.topAnchor.constraint(equalTo: bottomSheetView.containerView.topAnchor, constant: 35),
            bottomTitleWidthConstraint,
            bottomTitleHeightConstraint,
            
            profileView1LeftConstraint,
            profileView1.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10),
            profileView1.widthAnchor.constraint(equalToConstant: 160),
            profileView1.heightAnchor.constraint(equalToConstant: 170),
            
            profileView2.leftAnchor.constraint(equalTo: profileView1.rightAnchor, constant: 10),
            profileView2.bottomAnchor.constraint(equalTo: profileView1.bottomAnchor),
            profileView2.widthAnchor.constraint(equalToConstant: 160),
            profileView2.heightAnchor.constraint(equalToConstant: 170),
            
            nextButton.leftAnchor.constraint(equalTo: bottomSheetView.containerView.leftAnchor, constant: 35),
            nextButton.rightAnchor.constraint(equalTo: bottomSheetView.containerView.rightAnchor, constant: -35),
            nextButton.bottomAnchor.constraint(equalTo: bottomSheetView.containerView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            nextButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        bottonViewTitle.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        let dispatchTime = DispatchTime.now() + 0.25
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            profileView1LeftConstraint.isActive = false
            profileView1LeftConstraint = profileView1.leftAnchor.constraint(equalTo: self.bottomSheetView.containerView.leftAnchor, constant: 45)
            profileView1LeftConstraint.isActive = true
            UIView.animate(withDuration: 0.5) {
                bottonViewTitle.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.bottomSheetView.containerView.layoutIfNeeded()
            }
        }
        
        
    }
}
