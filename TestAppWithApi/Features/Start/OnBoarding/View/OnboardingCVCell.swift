//
//  OnboardingCVCell.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 02.04.2021.
//

import UIKit

class OnboardingCVCell: UICollectionViewCell {
    
    static let reusableCell = "onBoardingCell"
    
    @IBOutlet weak var iconIV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
}
