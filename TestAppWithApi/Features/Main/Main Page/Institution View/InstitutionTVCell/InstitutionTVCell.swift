//
//  InstitutionTVCell.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.03.2021.
//

import UIKit

class InstitutionTVCell: UITableViewCell {

    // Mark: - Identifiers
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var timeTitleLbl: UILabel!
    @IBOutlet weak var receiptTitleLbl: UILabel!
    @IBOutlet weak var deliveryTitleLbl: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var receiptLbl: UILabel!
    @IBOutlet weak var deliveryLbl: UILabel!
    
    @IBOutlet weak var borderView: UIView!
    
    
    static let cellID = "mainPageCell"
    static func nib() -> UINib {
        return UINib(nibName: "InstitutionTVCell", bundle: nil)
    }
    
    // Mark: - Outlets

    override func awakeFromNib() {
        super.awakeFromNib()
        self.timeTitleLbl.textColor = UIColor(red: 0.526, green: 0.604, blue: 0.491, alpha: 1)
        self.receiptTitleLbl.textColor = UIColor(red: 0.526, green: 0.604, blue: 0.491, alpha: 1)
        self.deliveryTitleLbl.textColor = UIColor(red: 0.526, green: 0.604, blue: 0.491, alpha: 1)
        
        self.timeLbl.textColor = UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1)
        self.receiptLbl.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        self.deliveryLbl.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        
        // Mark: - Setup ImageView
        self.iv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.iv.layer.borderWidth = 1
        self.iv.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.875, alpha: 1).cgColor
        
        // Mark: - Setup borderView
        self.borderView.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.875, alpha: 1).cgColor
        self.borderView.layer.borderWidth = 1
        self.borderView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        
    }
    
    var restaurant: Restaurant? {
        didSet {
            self.iv.image = nil
            self.iv.loadImageWithSDWebImage(self.restaurant?.cover ?? "", "")
            self.lbl.text = self.restaurant?.title ?? ""
            
            self.timeLbl.text = "от \(self.restaurant?.start_time ?? "") до \(self.restaurant?.end_time ?? "")"
            self.receiptLbl.text = "\(self.restaurant?.avg_price ?? 0) сом"
            self.deliveryLbl.text = "от \(self.restaurant?.delivery_price ?? 0) сом"
        }
    }
    
}


