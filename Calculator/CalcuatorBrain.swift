//
//  AppDelegate.swift
//  Calculator
//
//  Created by The1PrimeYT on 6/30/18.
//  Copyright © 2018 The1PrimeYT. All rights reserved.
//

import Foundation


struct CalcuatorBrain {
    
    private(set) var result: Double? {
        didSet {
            if result != nil {
                operand = result
            }
        }
    }
    
    private var operand: Double?
    
    private var pendingOperation: PendingBinaryOperation?
    

    mutating func setOperand(_ operand: Double) {
        self.operand = operand
        result = operand
    }
    

    mutating func performOperation(_ symbol: String) {
        

        let operation = operations[symbol]!
        
        switch operation {
        case .constant(let value):
            result = value
            pendingOperation = nil
        case .unary(let function):
            if operand != nil {
                result = function(operand!)
            }
        case .binary(let function):
 
            if operand != nil {
                pendingOperation = PendingBinaryOperation(firstOperand: operand!, operation: function)
                result = nil
            }
        case .equal:
            if pendingOperation != nil && operand != nil {
                result = pendingOperation?.perform(with: operand!)
            }
        }
    }
    

    private struct PendingBinaryOperation {
        let firstOperand: Double
        let operation: (Double, Double) -> Double
        func perform(with secoundOperand: Double) -> Double {
            return operation(firstOperand,secoundOperand)
        }
    }
    
    

    private enum Operation {

        case constant(Double)

        case unary((Double) -> Double)

        case binary((Double,Double) -> Double)

        case equal
    }
    

    private var operations: [String: Operation] = [
        "AC":   .constant(0),
        "±" :   .unary({-$0}),
        "%" :   .unary({$0 / 100}),
        "+" :   .binary( + ),
        "−" :   .binary( - ),
        "×" :   .binary( * ),
        "÷" :   .binary( / ),
        "=" :   .equal,
    ]
    
}
