//
//  ViewController.swift
//  CalculatorApp
//
//  Created by yorimoto.atsushi on 2018/06/28.
//  Copyright © 2018 yorimoto.atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if answerLabel.text != nil {
            if answerLabel.text == "0" {
                answerLabel.text = "\(inputNumber)"
            } else {
                answerLabel.text = answerLabel.text! + "\(inputNumber)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
