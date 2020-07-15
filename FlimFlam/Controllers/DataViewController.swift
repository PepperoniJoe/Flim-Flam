//
//  DataViewController.swift
//  FlimFlam
//
//  Created by Marcy Vernon on 10/31/18.
//  Copyright © 2018 Marcy Vernon. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet var dataLabel        : UILabel!
    @IBOutlet var textViewPuzzle   : UITextView!
    @IBOutlet var textViewAnswer   : UITextView!
    @IBOutlet var buttonViewAnswer : UIButton!
    
    var dataObject: FlimFlam = ("","","")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textViewAnswer.isHidden   = true
        buttonViewAnswer.isHidden = dataObject.answer == "" ? true : false
        dataLabel.text            = dataObject.pageTitle
        textViewPuzzle.text       = dataObject.puzzle
        textViewAnswer.text       = dataObject.answer
    }
    
    @IBAction func viewAnswer(_ sender: Any) {
        textViewAnswer.isHidden   = false
        buttonViewAnswer.isHidden = true
    }
}

