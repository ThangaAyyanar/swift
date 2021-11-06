//
//  WalletView.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 05/11/21.
//

import Foundation
import UIKit

class WalletView: UIView {
    
    let data: UILabel = ViewHelper.getUILabel()
    
    init(text: String){
        super.init(frame: .zero)
        self.data.text = text
        initializeViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViews() {
        
        data.textAlignment = .center
        data.font = UIFont.boldSystemFont(ofSize: 22.0)
        data.textColor = .white
        
        self.addSubview(data)
        
        NSLayoutConstraint.activate([
            data.leftAnchor.constraint(equalTo: self.leftAnchor),
            data.rightAnchor.constraint(equalTo: self.rightAnchor),
            data.topAnchor.constraint(equalTo: self.topAnchor),
            data.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
}
