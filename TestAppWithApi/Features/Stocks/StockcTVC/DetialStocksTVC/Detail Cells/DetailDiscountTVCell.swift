//
//  DetailDiscountTVCell.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 31.03.2021.
//

import UIKit

class DetailDiscountTVCell: UITableViewCell {

    static let reuseIdentifier = "discountCell"
    @IBOutlet weak var discountIV: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupForDetailDiscount(_ url: String, _ desc: String) {
        self.discountIV.loadImageWithSDWebImage(url, "")
        self.descLabel.text = desc
    }
    
}
