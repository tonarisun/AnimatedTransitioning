//
//  WhiteViewController.swift
//  AnimatedTransitioning
//
//  Created by Olga Lidman on 30/03/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class WhiteViewController: UIViewController {
    
    @IBOutlet weak var littleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    @IBAction func showBigPhoto(_ sender: Any) {
//        dismiss(animated: true)
    }
    
}
