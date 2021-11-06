//
//  DetailScreen.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 03/11/21.
//

import UIKit

class DetailScreen: UIViewController {
    
    
    var topView: DetailScreenTopView?
    var midView: DetailMidView?
    var bottomView : DetailScreenBottomView?
    
    var midViewLeftConstraint: NSLayoutConstraint?
    var midViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view?.backgroundColor = .white
        topView = DetailScreenTopView(detailScreen: self)
        midView = DetailMidView()
        midView?.layer.opacity = 0.5
        bottomView = DetailScreenBottomView(detailScreen: self)
        
        midViewLeftConstraint = midView!.leftAnchor.constraint(equalTo: self.view.rightAnchor)
        midViewBottomConstraint = midView!.bottomAnchor.constraint(equalTo: bottomView!.topAnchor, constant: -200)
        
        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Detail Screen Animations
        
        topView?.animateAppName()
        topView?.animateAppDescriptionView()
        topView?.animateReadMore()
        topView?.animateCloseButton()
        
        midViewLeftConstraint?.isActive = false
        midViewLeftConstraint = midView!.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        midViewLeftConstraint?.isActive = true
        midViewBottomConstraint?.constant = 0
        
        UIView.animate(withDuration: 0.8, delay: 0.2) {
            self.midView?.layer.opacity = 1
            self.view.layoutIfNeeded()
        }
    }
    
    func configureViews() {
        
        guard let topView = topView,
              let midView = midView,
              let bottomView = bottomView else {
            return
        }
        topView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topView)
        
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bottomView)
        
        midView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(midView)
        
        NSLayoutConstraint.activate([
        
            topView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            topView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            topView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 75),
            topView.heightAnchor.constraint(equalToConstant: 275),
        
            midViewLeftConstraint!,
            midView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            midView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            midViewBottomConstraint!,
            
            bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -15),
            bottomView.heightAnchor.constraint(equalToConstant: 85),
        ])
        
    }
    
    func dismissDetailScreen() {
        midView?.isHidden = true
        self.dismiss(animated: true, completion: nil)
    }
}
