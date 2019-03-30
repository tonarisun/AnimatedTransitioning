//
//  BlueViewController.swift
//  AnimatedTransitioning
//
//  Created by Olga Lidman on 28/03/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    var box : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        box = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 55))
        box.backgroundColor = .blue
        view.addSubview(box)
        box.setAnchorPoint(CGPoint(x: 1, y: 0))
        
        
        UIView.animate(withDuration: 3) {
            self.box.transform = CGAffineTransform(rotationAngle: .pi/2)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        box.transform = CGAffineTransform(rotationAngle: -.pi/2)
    }
    
    @IBOutlet weak var previousButton: UIButton!
    @objc func tap(sender: UIButton) {
        dismiss(animated: true)
    }
    


}
