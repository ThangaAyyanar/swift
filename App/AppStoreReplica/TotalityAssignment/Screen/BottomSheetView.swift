//
//  BottomSheetView.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 04/11/21.
//

import UIKit


enum BottomSheetState {
    case profile
    case cash
    case ready
}

//https://betterprogramming.pub/how-to-present-a-bottom-sheet-view-controller-in-ios-a5a3e2047af9

class BottomSheetView: UIViewController {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    let maxDimmedAlpha: CGFloat = 0.6
    
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    let defaultHeight: CGFloat = 400
    var state: BottomSheetState = .profile
    
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupGestures()
        setupConstraints()
        showProfileView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatePresentContainer()
        animateShowDimmedView()
    }
    
    func animatePresentContainer() {
        
        self.containerViewBottomConstraint?.constant = 0
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        dimmedView.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissView() {
        self.containerViewBottomConstraint?.constant = defaultHeight
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: false, completion: nil)
        }
        
    }
    
    func setupConstraints() {
        // 4. Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leftAnchor.constraint(equalTo: view.leftAnchor),
            dimmedView.rightAnchor.constraint(equalTo: view.rightAnchor),
            // set container static constraint (trailing & leading)
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
        // 6. Set container to default height
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        // 7. Set bottom constant to 0
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        // Activate constraints
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
    
    func showProfileView() {
        let profileComponent = ProfileComponent(bottomSheetView: self)
        profileComponent.initialize()
    }
    
    @objc func showWalletBalance() {
        removeSubViews()
        let walletComponent = WalletComponent(bottomSheetView: self)
        walletComponent.initialize()
    }
    
    @objc func paymentComponentView() {
        removeSubViews()
        let paymentComponent = PaymentComponent(bottomSheetView: self)
        paymentComponent.initialize()
    }
    
    @objc func paymentComplete() {
        self.dismissView()
    }
    
    func removeSubViews() {
        for view in self.containerView.subviews{
            view.removeFromSuperview()
        }
    }
}
