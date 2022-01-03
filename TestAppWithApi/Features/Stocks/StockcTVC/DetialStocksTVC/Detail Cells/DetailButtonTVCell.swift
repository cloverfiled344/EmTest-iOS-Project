//
//  DetailDiscountTVCell.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 31.03.2021.
//

import UIKit

class DetailButtonTVCell: UITableViewCell {
    
    static let reusableIdentifier = "detailButtonCell"

    @IBOutlet weak var closeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.closeButton.backgroundColor = .white
        self.closeButton.layer.backgroundColor = UIColor.emGreen.cgColor
    }
    
}
