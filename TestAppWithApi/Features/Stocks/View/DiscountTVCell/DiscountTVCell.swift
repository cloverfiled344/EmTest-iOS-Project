//
//  DiscountTVCell.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 30.03.2021.
//

import UIKit

class DiscountTVCell: UITableViewCell {
    
    static let reuseIdentifier = "discountCell"
    
    // Mark: - Outlets
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var discountIV: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    var stock: Stocks? {
        didSet {
            self.logoIV.loadImageWithSDWebImage("\(self.stock?.restaurant?.logo ?? "")", "")
            self.titleLabel.text = "\(self.stock?.restaurant?.title ?? "")"
            self.timeLabel.text = "\(self.stock?.restaurant?.start_time ?? "")-\(self.stock?.restaurant?.end_time ?? "")"
            self.discountIV.loadImageWithSDWebImage("\(self.stock?.cover ?? "")", "")
            self.descLabel.text = "\(self.stock?.desc ?? "")"
        }
    }
    
    
    
}
