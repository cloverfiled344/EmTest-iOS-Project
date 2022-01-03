//
//  Extensions + UIView.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 31.03.2021.
//

import UIKit

extension UIView {
    
    func pulsate(sender: UIView) {
        let pulsate = CASpringAnimation(keyPath: "transform.scale")
        pulsate.duration = 0.5
        pulsate.repeatCount = 0
        pulsate.autoreverses = false
        pulsate.fromValue = 0.94
        pulsate.toValue = 0.99
        pulsate.autoreverses = false
        pulsate.initialVelocity = 0
        pulsate.damping = 1
        layer.add(pulsate, forKey: nil)
    }
    
}
