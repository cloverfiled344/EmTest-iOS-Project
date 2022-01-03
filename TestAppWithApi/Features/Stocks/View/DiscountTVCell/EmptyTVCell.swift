//
//  EmptyTVCell.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 30.03.2021.
//

import UIKit

class EmptyTVCell: UITableViewCell {
    
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    static let reuseIdentifier = "emptyCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    
}
