//
//  PopAnimator.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 03/11/21.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let recipeView = presenting ? toView : transitionContext.view(forKey: .from
        )!
        
        let initialFrame = presenting ? originFrame : recipeView.frame
        let finalFrame = presenting ? recipeView.frame : originFrame
        
        let XScaleFactor = presenting ? initialFrame.width/finalFrame.width : finalFrame.width/initialFrame.width
        let YScaleFactor = presenting ? initialFrame.height/finalFrame.height : finalFrame.height/initialFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: XScaleFactor, y: YScaleFactor)
        
        if presenting {
            recipeView.transform = scaleTransform
            recipeView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            recipeView.clipsToBounds = true
        }
        recipeView.layer.cornerRadius = presenting ? 20.0 : 0.0
        recipeView.layer.masksToBounds = true
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(recipeView)
        
        UIView.animate(
          withDuration: duration,
          delay:0,
          animations: {
            recipeView.transform = self.presenting ? .identity : scaleTransform
            recipeView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
            recipeView.layer.cornerRadius = !self.presenting ? 20.0 : 0.0
          }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}
