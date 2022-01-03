//
//  DetailPageCHRV.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 26.03.2021.
//

import UIKit

class DetailPageCHRV: UICollectionReusableView {

    static let shared = DetailPageCHRV()
    
    static let registerID = "DetailPageCHRV"
    
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var receiptLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    var restaurant: Restaurant? {
        didSet {
            self.logoIV.image = nil
            self.logoIV.loadImageWithSDWebImage(self.restaurant?.logo ?? "" , "")
            self.titleLbl.text = self.restaurant?.title ?? ""
            self.timeLbl.text = "\(self.restaurant?.start_time ?? "00:00") - \(self.restaurant?.end_time ?? "00:00")"
            self.receiptLbl.text = "\(self.restaurant?.avg_price ?? 0) сом"
            self.addressLbl.text = "\(self.restaurant?.address ?? "")"

        }
    }
}
