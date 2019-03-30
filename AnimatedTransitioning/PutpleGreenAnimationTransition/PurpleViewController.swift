//
//  ViewController.swift
//  AnimatedTransitioning
//
//  Created by Olga Lidman on 28/03/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class PurpleViewController: UIViewController, UIViewControllerTransitioningDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionForward()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionBackwards()
    }
    
    @IBAction func changeControllerButton(_ sender: UIButton) {
        let newVC = GreenViewController()
        newVC.transitioningDelegate = self
        present(newVC, animated: true)
    }
}

extension UIView {
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
}
