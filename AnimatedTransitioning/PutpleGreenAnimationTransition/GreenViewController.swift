//
//  GreenViewController.swift
//  AnimatedTransitioning
//
//  Created by Olga Lidman on 28/03/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.center.x = self.view.center.x
        button.center.y = self.view.center.y
        button.setTitle("PREVIOUS", for: .normal)
        button.addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func tap(sender: UIButton) {
        dismiss(animated: true)
    }
    
}
