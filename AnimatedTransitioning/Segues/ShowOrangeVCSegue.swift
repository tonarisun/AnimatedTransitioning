//
//  ShowRedVCSegue.swift
//  AnimatedTransitioning
//
//  Created by Olga Lidman on 29/03/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class ShowOrangeVCSegue: UIStoryboardSegue {
    
    override func perform() {
        
        guard let containerView = source.view.superview else { return }
        containerView.addSubview(destination.view)
        source.view.setAnchorPoint(CGPoint(x: 0, y: 0))
        destination.view.setAnchorPoint(CGPoint(x: 0, y: 0))
        
        destination.view.transform = CGAffineTransform.init(rotationAngle: -.pi / 2)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.1,
                       options: [],
                       animations: {
                        self.source.view.transform = CGAffineTransform(rotationAngle: .pi / 2)
                        self.destination.view.transform = CGAffineTransform(rotationAngle: 0)
        }, completion: { finished in
            self.source.present(self.destination,
                                animated: false,
                                completion: nil)
        })
    }
}
