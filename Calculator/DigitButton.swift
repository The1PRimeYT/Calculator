//
//  AppDelegate.swift
//  Calculator
//
//  Created by The1PrimeYT on 6/30/18.
//  Copyright © 2018 The1PrimeYT. All rights reserved.
//

import UIKit

class DigitButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height * 0.5
        layer.masksToBounds = true
    }

}
