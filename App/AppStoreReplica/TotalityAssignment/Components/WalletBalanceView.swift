//
//  WalletBalanceView.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 05/11/21.
//

import UIKit

class WalletBalance: UIView {
    
    let label: UILabel = ViewHelper.getUILabel()
    let amount: UILabel = ViewHelper.getUILabel()
    
    init(){
        super.init(frame: .zero)
        initializeViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViews() {
        
        self.addSubview(label)
        self.addSubview(amount)
        label.text = "Wallet Balance: "
        amount.text = "$500.00"
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: self.leftAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 25),
            
            amount.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 10),
            amount.topAnchor.constraint(equalTo: self.topAnchor),
            amount.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            amount.heightAnchor.constraint(equalTo: label.heightAnchor)
        
        ])
        
    }
}
