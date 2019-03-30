//
//  ShowBigPicSegue.swift
//  AnimatedTransitioning
//
//  Created by Olga Lidman on 30/03/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class ShowBigPicSegue: UIStoryboardSegue {
    
    override func perform() {
        
        guard let containerView = source.view.superview else { return }
        containerView.addSubview(destination.view)
        
        let sourceTargetFrame = CGRect(x: 0,
                                       y: -containerView.frame.height,
                                       width: source.view.frame.width,
                                       height: source.view.frame.height)
        let destinationTargetFrame = containerView.frame
        
        destination.view.frame = CGRect(x: 0,
                                        y: containerView.frame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.1,
                       options: [],
                       animations: {
                        self.source.view.frame = sourceTargetFrame
                        self.destination.view.frame = destinationTargetFrame
        }, completion: { finished in
            self.source.present(self.destination,
                                animated: false,
                                completion: nil)
        })
    }
}
