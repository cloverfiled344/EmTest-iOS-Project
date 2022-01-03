//
//  OnboardingCVCell + setupUI.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 03.04.2021.
//

import UIKit

extension OnboardingCVCell {
    
    func setupUI() {
        self.setupSkipButton()
        self.backgroundColor = .white
    }
    
    func setupSkipButton() {
        self.skipButton.setTitleColor(UIColor.emGreen, for: .normal)
    }
   
    func setupTitle(title: String, subTitle: String, imgName: String) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.03
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [.foregroundColor: UIColor(red: 0.125, green: 0.119, blue: 0.119, alpha: 1), .font: UIFont(font: FontFamily.OpenSans.bold, size: 22)!])
        attributedText.append(.init(string: "\n\n\(subTitle)", attributes: [.foregroundColor: UIColor(red: 0.596, green: 0.592, blue: 0.592, alpha: 1), .font: UIFont(font: FontFamily.OpenSans.regular, size: 15)!, .paragraphStyle: paragraphStyle]))
        
        self.titleLabel.lineBreakMode = .byWordWrapping
        self.titleLabel.attributedText = attributedText
        
        self.iconIV.image = UIImage(named: imgName)
    }
    
}
