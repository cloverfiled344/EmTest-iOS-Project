//
//  DetailDishCVCell.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 25.03.2021.
//

import UIKit

class DetailDishCVCell: UICollectionViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var grbLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var viewModel: DishesVM?

    var dish: Dish? {
        didSet {
            self.iconView.image = nil
            self.iconView.loadImageWithSDWebImage(self.dish?.image ?? "", "")
            self.titleLbl.text = "\(self.dish?.title ?? "")"
            self.grbLbl.text = "\(self.dish?.weight ?? 0) гр"
            self.priceLbl.text = "\(self.dish?.price ?? 0) сом"
        }
    }
    
}
