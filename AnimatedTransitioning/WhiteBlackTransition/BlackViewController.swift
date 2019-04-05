//
//  BlackViewController.swift
//  AnimatedTransitioning
//
//  Created by Olga Lidman on 30/03/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class BlackViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var bigImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let closeSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToClose(recognizer:)))
        closeSwipe.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(closeSwipe)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionSwipeDown()
    }
    
    @objc func swipeToClose(recognizer: UISwipeGestureRecognizer){
        let storyboardName = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        
        let identifier = "WhiteViewController"
        let newVC = storyboard.instantiateViewController(withIdentifier: identifier) as! WhiteViewController
        newVC.transitioningDelegate = self
        present(newVC, animated: true)
    }
}
