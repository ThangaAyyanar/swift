//
//  HomeScreenCell.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 03/11/21.
//

import UIKit

class HomeScreenCell: UICollectionViewCell {
    
    let appName = ViewHelper.getUILabel()
    let appDescription = ViewHelper.getUILabel()
    let imageView: UIImageView = ViewHelper.getImageView()
    let detailButton: UIButton = ViewHelper.getUIButton(color: ColorHelper.green)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        cardView()
        viewInitialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cardView() {
        
        self.layer.cornerRadius = 10.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.7
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
    }
    
    func viewInitialize() {
        
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(detailButton)
        self.contentView.addSubview(appName)
        self.contentView.addSubview(appDescription)
        
        appName.font = UIFont.boldSystemFont(ofSize: 20.0)
        appDescription.numberOfLines = 0
        let imageViewConstant:CGFloat = 100
        
        NSLayoutConstraint.activate([
        
            imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: imageViewConstant),
            imageView.heightAnchor.constraint(equalToConstant: imageViewConstant),
            
            appName.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10),
            appName.topAnchor.constraint(equalTo: imageView.topAnchor),
            appName.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            appName.heightAnchor.constraint(equalTo: imageView.heightAnchor),
            
            appDescription.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            appDescription.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            appDescription.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15),
            appDescription.bottomAnchor.constraint(equalTo: detailButton.topAnchor, constant: -10),
            
            detailButton.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 25),
            detailButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -25),
            detailButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -25),
            detailButton.heightAnchor.constraint(equalToConstant: 60),
        
        ])
        
        detailButton.layer.cornerRadius = 60/2
    }
    
    
    func setView(appModel: AppModel) {
        appName.text = appModel.appName
        appDescription.text = appModel.appDescription
        imageView.image = UIImage(named: appModel.imageName)
    }
}
