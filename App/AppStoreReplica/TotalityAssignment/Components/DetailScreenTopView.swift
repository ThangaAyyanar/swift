//
//  DetailScreenTopView.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 03/11/21.
//

import UIKit

class DetailScreenTopView: UIView {
    
    let imageView = ViewHelper.getImageView()
    let appName = ViewHelper.getUILabel()
    let appDescription = ViewHelper.getUILabel()
    let readMoreButton: UIButton = ViewHelper.getUIButton(color: .clear)
    let closeButton: UIButton = ViewHelper.getUIButton(color: .clear)
    
    var closeButtonTopAnchor: NSLayoutConstraint?
    
    var parentView: DetailScreen
    
    init(detailScreen: DetailScreen) {
        parentView = detailScreen
        super.init(frame: .zero)
        viewInitialize()
        setView()
    }
    
    func setView() {
        let appModel = AppModel.getDummyModel()
        appName.text = appModel.appName
        appDescription.text = appModel.appDescription
        imageView.image = UIImage(named: appModel.imageName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissDetailScreen() {
        
        appDescription.isHidden = true
        readMoreButton.isHidden = true
        parentView.dismissDetailScreen()
    }
    
    //MARK: - Animations
    
    func animateAppName() {
        UIView.transition(with: appName, duration: 0.5, options: .curveEaseIn, animations: {
            self.appName.isHidden = false
        })
    }
    
    func animateAppDescriptionView() {
        setView(view: appDescription, hidden: false)
    }
    
    func animateReadMore() {
        setView(view: readMoreButton, hidden: false)
    }
    
    func animateCloseButton() {
        
        UIView.animate(withDuration: 0.4) {
            self.closeButton.isHidden = false
            self.closeButtonTopAnchor?.constant = 0
        }
    }
    
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }
    
    //MARK: - Constraints
    
    func viewInitialize() {
        self.addSubview(imageView)
        self.addSubview(appName)
        self.addSubview(appDescription)
        self.addSubview(readMoreButton)
        self.addSubview(closeButton)
        
        appName.numberOfLines = 0
        appName.font = UIFont.boldSystemFont(ofSize: 20.0)
        appDescription.numberOfLines = 0
        readMoreButton.setTitleColor(ColorHelper.green, for: .normal)
        closeButton.setTitle("✕", for: .normal)
        closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        closeButton.setTitleColor(.black, for: .normal)
        closeButton.addTarget(self, action: #selector(dismissDetailScreen), for: .touchUpInside)
        
        appName.isHidden = true
        appDescription.isHidden = true
        readMoreButton.isHidden = true
        closeButton.isHidden = true
        
        let imageViewConstant:CGFloat = 100
        closeButtonTopAnchor = closeButton.topAnchor.constraint(equalTo: imageView.topAnchor,constant: 50)
        
        NSLayoutConstraint.activate([
            
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: imageViewConstant),
            imageView.heightAnchor.constraint(equalToConstant: imageViewConstant),
            
            appName.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10),
            appName.topAnchor.constraint(equalTo: imageView.topAnchor),
            appName.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            appName.heightAnchor.constraint(equalTo: imageView.heightAnchor),
            
            appDescription.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            appDescription.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            appDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            appDescription.heightAnchor.constraint(equalToConstant: 100),
            
            readMoreButton.topAnchor.constraint(equalTo: appDescription.bottomAnchor, constant: 5),
            readMoreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            readMoreButton.widthAnchor.constraint(equalToConstant: 75),
            readMoreButton.heightAnchor.constraint(equalToConstant: 25),
            
            closeButtonTopAnchor!,
            closeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
