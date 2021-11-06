//
//  PreviewView.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 05/11/21.
//

import Foundation
import UIKit

class PreviewView: UIView {
    
    let starterBackground: UIView = ViewHelper.getUIView(color: .gray)
    let starterImage: UIImageView = ViewHelper.getImageView()
    let starterName: UILabel = ViewHelper.getUILabel()
    let playerType: UILabel = ViewHelper.getUILabel()
    
    init(profile: Profile) {
        super.init(frame: .zero)
        initializeViews()
        starterName.textAlignment = .center
        playerType.textAlignment = .center
        starterImage.image = UIImage(named: profile.imageName)
        starterImage.sizeToFit()
        starterName.text = profile.name
        playerType.text = profile.type
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViews() {
        
        starterBackground.addSubview(starterImage)
        self.addSubview(starterBackground)
        self.addSubview(starterName)
        self.addSubview(playerType)
        
        let playerSize:CGFloat = 70
        let starterBackgroundSize: CGFloat = playerSize + 10
        
        starterBackground.layer.cornerRadius = starterBackgroundSize / 2
        
        NSLayoutConstraint.activate([
            starterBackground.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            starterBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            starterBackground.widthAnchor.constraint(equalToConstant: starterBackgroundSize),
            starterBackground.heightAnchor.constraint(equalToConstant: starterBackgroundSize),
            
            starterImage.centerXAnchor.constraint(equalTo: starterBackground.centerXAnchor),
            starterImage.topAnchor.constraint(equalTo: starterBackground.topAnchor, constant: 2),
            starterImage.widthAnchor.constraint(equalToConstant: playerSize),
            starterImage.heightAnchor.constraint(equalToConstant: playerSize),
            
            starterName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            starterName.topAnchor.constraint(equalTo: starterImage.bottomAnchor, constant: 15),
            starterName.heightAnchor.constraint(equalToConstant: 20),
            starterName.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            playerType.topAnchor.constraint(equalTo: starterName.bottomAnchor, constant: 5),
            playerType.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            playerType.heightAnchor.constraint(equalToConstant: 20),
            playerType.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}
