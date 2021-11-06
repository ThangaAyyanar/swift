//
//  WalletComponent.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 05/11/21.
//

import UIKit

class PaymentComponent{
    
    var bottomSheetView: BottomSheetView
    
    init(bottomSheetView: BottomSheetView) {
        self.bottomSheetView = bottomSheetView
    }
    
    func bottomViewTitle() -> UIView {
        
        let view = UIView()
        
        let title = UILabel()
        title.textAlignment = .center
        title.text = "Ready to play?"
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        let description = UILabel()
        description.textAlignment = .center
        description.text = "Pokemon"
        description.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(title)
        view.addSubview(description)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: view.leftAnchor),
            title.rightAnchor.constraint(equalTo: view.rightAnchor),
            title.topAnchor.constraint(equalTo: view.topAnchor),
            title.heightAnchor.constraint(equalToConstant: 30),
            
            description.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 5),
            description.rightAnchor.constraint(equalTo: view.rightAnchor),
            description.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            description.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        return view
    }
    
    func initialize() {
        
        // Creating Views
        
        let bottonViewTitle = bottomViewTitle()
        
        let balance = WalletBalance()
        balance.translatesAutoresizingMaskIntoConstraints = false
        
        let walletOptions = UIView()
        
        let amount5 = WalletView(text: "5")
        amount5.backgroundColor = ColorHelper.green
        amount5.translatesAutoresizingMaskIntoConstraints = false
        
        let amount10 = WalletView(text: "10")
        amount10.backgroundColor = .gray
        amount10.translatesAutoresizingMaskIntoConstraints = false
        
        let amount15 = WalletView(text: "15")
        amount15.backgroundColor = .gray
        amount15.translatesAutoresizingMaskIntoConstraints = false
        
        walletOptions.translatesAutoresizingMaskIntoConstraints = false
        
        let nextButton = ViewHelper.getUIButton(color: .black)
        nextButton.tintColor = .white
        nextButton.setTitle("Confirm", for: .normal)
        nextButton.layer.cornerRadius = 35
        nextButton.addTarget(self, action: #selector(bottomSheetView.paymentComplete), for: .touchUpInside)
        nextButton.isHidden = true
        
        // Adding Constraints
        
        walletOptions.addSubview(amount5)
        walletOptions.addSubview(amount10)
        walletOptions.addSubview(amount15)
        
        bottomSheetView.containerView.addSubview(bottonViewTitle)
        bottomSheetView.containerView.addSubview(walletOptions)
        bottomSheetView.containerView.addSubview(balance)
        bottomSheetView.containerView.addSubview(nextButton)
        
        let bottomTitleWidthConstraint: NSLayoutConstraint = bottonViewTitle.widthAnchor.constraint(equalToConstant: 200)
        let bottomTitleHeightConstraint: NSLayoutConstraint = bottonViewTitle.heightAnchor.constraint(equalToConstant: 40)
        
        let viewHeight: CGFloat = 60
        let spacing: CGFloat = 25
        amount5.layer.cornerRadius = viewHeight/2
        amount10.layer.cornerRadius = viewHeight/2
        amount15.layer.cornerRadius = viewHeight/2
        let walletWidth = (viewHeight*3) + (spacing*3)
        
        let walletBalanceHeight:CGFloat = 25
        let bottomViewTitleTopPadding: CGFloat = 45
        
        var walletCenterXConstraint: NSLayoutConstraint = walletOptions.leftAnchor.constraint(equalTo: bottomSheetView.containerView.rightAnchor)
        let balanceBottonConstraint: NSLayoutConstraint = balance.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -40)
        NSLayoutConstraint.activate([
            
            bottonViewTitle.centerXAnchor.constraint(equalTo: bottomSheetView.containerView.centerXAnchor),
            bottonViewTitle.topAnchor.constraint(equalTo: bottomSheetView.containerView.topAnchor, constant: bottomViewTitleTopPadding),
            bottomTitleWidthConstraint,
            bottomTitleHeightConstraint,
            
            walletCenterXConstraint,
            walletOptions.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -80),
            walletOptions.widthAnchor.constraint(equalToConstant: walletWidth),
            walletOptions.heightAnchor.constraint(equalToConstant: viewHeight + 10),
            
            amount5.leftAnchor.constraint(equalTo: walletOptions.leftAnchor, constant: 15),
            amount5.centerYAnchor.constraint(equalTo: walletOptions.centerYAnchor),
            amount5.widthAnchor.constraint(equalToConstant: viewHeight),
            amount5.heightAnchor.constraint(equalToConstant: viewHeight),
            
            amount10.leftAnchor.constraint(equalTo: amount5.rightAnchor, constant: spacing),
            amount10.centerYAnchor.constraint(equalTo: amount5.centerYAnchor),
            amount10.widthAnchor.constraint(equalTo: amount5.widthAnchor),
            amount10.heightAnchor.constraint(equalTo: amount5.heightAnchor),

            amount15.leftAnchor.constraint(equalTo: amount10.rightAnchor, constant: spacing),
            amount15.centerYAnchor.constraint(equalTo: amount5.centerYAnchor),
            amount15.widthAnchor.constraint(equalTo: amount5.widthAnchor),
            amount15.heightAnchor.constraint(equalTo: amount5.heightAnchor),
            
            balance.leftAnchor.constraint(equalTo: bottomSheetView.containerView.leftAnchor, constant: 115),
            balance.rightAnchor.constraint(equalTo: nextButton.rightAnchor),
            balanceBottonConstraint,
            balance.heightAnchor.constraint(equalToConstant: walletBalanceHeight),
            
            nextButton.leftAnchor.constraint(equalTo: bottomSheetView.containerView.leftAnchor, constant: 35),
            nextButton.rightAnchor.constraint(equalTo: bottomSheetView.containerView.rightAnchor, constant: -35),
            nextButton.bottomAnchor.constraint(equalTo: bottomSheetView.containerView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            nextButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        bottonViewTitle.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        let dispatchTime = DispatchTime.now() + 0.25
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            
            UIView.transition(with: nextButton, duration: 0.5, options: .transitionCrossDissolve) {
                nextButton.isHidden = false
            } completion: { _ in
                print("Transistion complete")
            }
            
            walletCenterXConstraint.isActive = false
            walletCenterXConstraint = walletOptions.centerXAnchor.constraint(equalTo: self.bottomSheetView.containerView.centerXAnchor)
            walletCenterXConstraint.isActive = true
            
            UIView.animate(withDuration: 0.5) {
                bottonViewTitle.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.bottomSheetView.containerView.layoutIfNeeded()
            }
        }
    }
    
    
}
