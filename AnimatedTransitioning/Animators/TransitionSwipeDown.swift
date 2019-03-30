//
//  TransitionSwipeDown.swift
//  AnimatedTransitioning
//
//  Created by Olga Lidman on 30/03/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class TransitionSwipeDown: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let sourceVC = transitionContext.viewController(forKey: .from),
              let destinationVC = transitionContext.viewController(forKey: .to)
              else { return }
        let containerViewFrame = transitionContext.containerView.frame
        
        transitionContext.containerView.addSubview(destinationVC.view)
        
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: containerViewFrame.height,
                                           width: sourceVC.view.frame.width,
                                           height: sourceVC.view.frame.height)
        
        let destinationViewTargetFrame = sourceVC.view.frame
        
        destinationVC.view.frame = CGRect(x: 0,
                                          y: -containerViewFrame.height,
                                          width: sourceVC.view.frame.width,
                                          height: sourceVC.view.frame.height)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.1,
                       options: [],
                       animations: {
                        sourceVC.view.frame = sourceViewTargetFrame
                        destinationVC.view.frame = destinationViewTargetFrame
        }, completion: { finished in
            sourceVC.removeFromParent()
            transitionContext.completeTransition(finished)
        })
    }
}
