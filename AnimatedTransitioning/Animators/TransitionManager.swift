//
//  TransitionManager.swift
//  AnimatedTransitioning
//
//  Created by Olga Lidman on 28/03/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class TransitionForward: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let sourceVC = transitionContext.viewController(forKey: .from),
              let destinationVC = transitionContext.viewController(forKey: .to)
        else { return }
        
        sourceVC.view.setAnchorPoint(CGPoint(x: 1, y: 0))
        destinationVC.view.setAnchorPoint(CGPoint(x: 1, y: 0))
        
        transitionContext.containerView.addSubview(destinationVC.view)
        destinationVC.view.transform = CGAffineTransform.init(rotationAngle: -.pi / 2)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.1,
                       options: [],
                       animations: {
            sourceVC.view.transform = CGAffineTransform(rotationAngle: .pi / 2)
            destinationVC.view.transform = CGAffineTransform(rotationAngle: 0)
        }, completion: { finished in
            sourceVC.removeFromParent()
            transitionContext.completeTransition(finished)
        })
        }
}

class TransitionBackwards: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let sourceVC = transitionContext.viewController(forKey: .from),
            let destinationVC = transitionContext.viewController(forKey: .to)
            else { return }
        
        sourceVC.view.setAnchorPoint(CGPoint(x: 1, y: 0))
        destinationVC.view.setAnchorPoint(CGPoint(x: 1, y: 0))
        
        transitionContext.containerView.addSubview(destinationVC.view)
        destinationVC.view.transform = CGAffineTransform.init(rotationAngle: .pi / 2)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.1,
                       options: [],
                       animations: {
                        sourceVC.view.transform = CGAffineTransform(rotationAngle: -.pi / 2)
                        destinationVC.view.transform = CGAffineTransform(rotationAngle: 0)
        }, completion: { finished in
            sourceVC.removeFromParent()
            transitionContext.completeTransition(finished)
        })
    }
}

class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let sourceVC = transitionContext.viewController(forKey: .from),
            let destinationVC = transitionContext.viewController(forKey: .to)
            else { return }
        
        sourceVC.view.setAnchorPoint(CGPoint(x: 1, y: 0))
        destinationVC.view.setAnchorPoint(CGPoint(x: 1, y: 0))
        
        transitionContext.containerView.addSubview(destinationVC.view)
        destinationVC.view.transform = CGAffineTransform.init(rotationAngle: -.pi / 2)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.1,
                       options: [],
                       animations: {
                        sourceVC.view.transform = CGAffineTransform(rotationAngle: .pi / 2)
                        destinationVC.view.transform = CGAffineTransform(rotationAngle: 0)
        }, completion: { finished in
            if finished && !transitionContext.transitionWasCancelled {
                sourceVC.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        })
    }
}

class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let sourceVC = transitionContext.viewController(forKey: .from),
            let destinationVC = transitionContext.viewController(forKey: .to)
            else { return }
        
        sourceVC.view.setAnchorPoint(CGPoint(x: 1, y: 0))
        destinationVC.view.setAnchorPoint(CGPoint(x: 1, y: 0))
        
        transitionContext.containerView.addSubview(destinationVC.view)
        destinationVC.view.transform = CGAffineTransform.init(rotationAngle: .pi / 2)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.1,
                       options: [],
                       animations: {
                        sourceVC.view.transform = CGAffineTransform(rotationAngle: -.pi / 2)
                        destinationVC.view.transform = CGAffineTransform(rotationAngle: 0)
        }, completion: { finished in
            if finished && !transitionContext.transitionWasCancelled {
                sourceVC.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destinationVC.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        })
    }
}
