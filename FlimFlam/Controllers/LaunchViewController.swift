//
//  LaunchViewController.swift
//  FlimFlam
//
//  Created by Marcy Vernon on 10/31/18.
//  Copyright © 2018 Marcy Vernon. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    
    @IBOutlet var buttonStart: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        animateButton()
    }
    
    @IBAction func startQuiz(_ sender: Any) {
        performSegue(withIdentifier: "start", sender: nil)
    }
    
    func animateButton() {
        let bounds = buttonStart.bounds
        let shrinkSize = CGRect(x      : bounds.origin.x + 5,
                                y      : bounds.origin.y + 5,
                                width  : bounds.size.width + 5,
                                height : bounds.size.height + 5)
        
        UIView.animate(withDuration: 4.0,
                       delay: 0.0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 15,
                       options: [.curveEaseInOut, .allowUserInteraction, .repeat],
                       animations: { self.buttonStart.bounds = shrinkSize },
                       completion: nil )
    }
}
