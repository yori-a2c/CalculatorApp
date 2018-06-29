//
//  ViewController.swift
//  CalculatorApp
//
//  Created by yorimoto.atsushi on 2018/06/28.
//  Copyright © 2018 yorimoto.atsushi. All rights reserved.
//

import UIKit

enum operationType {
    case add
    case subtract
    case multiply
    case divide
    case none
}

class ViewController: UIViewController {
    var numberOnScreen:Double = 0
    var previousNumver:Double = 0
    var preformingMath = false
    var opertion:operationType = .none
    var newCalculation = true
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if answerLabel.text != nil {
            if newCalculation == true {
                answerLabel.text = "\(inputNumber)"
                newCalculation = false
            } else {
                if answerLabel.text == "0" || answerLabel.text == "+" || answerLabel.text == "-" || answerLabel.text == "×" || answerLabel.text == "÷" {
                    answerLabel.text = "\(inputNumber)"
                } else {
                    answerLabel.text = answerLabel.text! + "\(inputNumber)"
                }
            }
        }
        numberOnScreen = Double(answerLabel.text!) ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func add(_ sender: UIButton) {
        opertion = .add
        preformingMath = true
        previousNumver = numberOnScreen
        answerLabel.text = "+"
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        opertion = .subtract
        preformingMath = true
        previousNumver = numberOnScreen
        answerLabel.text = "-"
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        opertion = .multiply
        preformingMath = true
        previousNumver = numberOnScreen
        answerLabel.text = "×"
    }
    
    @IBAction func divide(_ sender: UIButton) {
        opertion = .divide
        preformingMath = true
        previousNumver = numberOnScreen
        answerLabel.text = "÷"
    }
    
    @IBAction func answer(_ sender: UIButton) {
        if preformingMath == true {
            switch opertion {
                case .add:
                    numberOnScreen = previousNumver + numberOnScreen
                    makeNumberString(from: numberOnScreen)
                case .subtract:
                    numberOnScreen = previousNumver - numberOnScreen
                    makeNumberString(from: numberOnScreen)
                case .multiply:
                    numberOnScreen = previousNumver * numberOnScreen
                    makeNumberString(from: numberOnScreen)
                case .divide:
                    numberOnScreen = previousNumver / numberOnScreen
                    makeNumberString(from: numberOnScreen)
                case .none:
                    answerLabel.text = "0"
            }
            preformingMath = false
            newCalculation = true
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        answerLabel.text = "0"
        numberOnScreen = 0
        previousNumver = 0
        preformingMath = false
        opertion = .none
        newCalculation = true
    }
    
    private func makeNumberString(from number:Double) {
        if floor(number) == number {
            answerLabel.text = "\(Int(number))"
        } else {
            answerLabel.text = "\(number)"
        }
    }
}

