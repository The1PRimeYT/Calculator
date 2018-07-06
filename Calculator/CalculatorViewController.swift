//
//  AppDelegate.swift
//  Calculator
//
//  Created by The1PrimeYT on 6/30/18.
//  Copyright © 2018 The1PrimeYT. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var displayVlaueOutlet: UILabel!
    var displayValue: Double {
        get {
            return Double(displayVlaueOutlet.text!)!
        }
        set {
            if Double(Int(newValue)) == newValue {
                displayVlaueOutlet.text = String(Int(newValue))
            }else {
                displayVlaueOutlet.text = String(newValue)
            }
        }
    }
    
    var brain = CalcuatorBrain()
    
    var userIsInTyping: Bool = false

    @IBAction func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        let textCurrentInDisplay = displayVlaueOutlet.text!

        if userIsInTyping {
            if digit == "0" && textCurrentInDisplay == "0" {
                displayVlaueOutlet.text = "0"
            }
            else {
                displayVlaueOutlet.text = textCurrentInDisplay + digit
            }
        }
        else {
            
            if digit == "." {
                displayVlaueOutlet.text = "0."
            }else {
                displayVlaueOutlet.text = digit
            }
            userIsInTyping = true
        }
    }
    
    
    @IBAction func performOperation(_ sender: UIButton) {

        if userIsInTyping {
            brain.setOperand(displayValue)

            userIsInTyping = false
        }

        brain.performOperation(sender.currentTitle!)
        

        if let result = brain.result {
            displayValue = result
        }
    }
    
}


extension CalculatorViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


