//
//  DetailScreenShotView.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 03/11/21.
//

import UIKit

class DetailScreenShotView: UICollectionViewCell {
    
    let imageView = ViewHelper.getImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        viewInitialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewInitialize(){
        
        self.contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
        ])
    }
    
    func applyModel(imageName: String) {
        
        self.imageView.image = UIImage(named: imageName)
        self.imageView.sizeToFit()

    }
}
