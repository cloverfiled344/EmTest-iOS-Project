//
//  CabinetTVC.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 16.03.2021.
//

import UIKit
import SnapKit

class CabinetTVC: UITableViewCell {

    // Mark: - Identifiers
    static let cellID = "cabinetCell"
    
    //Mark: - Ohter values
    var cabinetVC = CabinetViewController()
    
    // Mark: - Outlets
    @IBOutlet weak var iconIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    var cabinetItem: CabinetItem? {
        didSet {
            self.iconIV.image = UIImage(named: self.cabinetItem?.iconIN ?? "")
            self.titleLbl.text = self.cabinetItem?.title
            self.accessoryType = .disclosureIndicator
            self.accessoryView?.tintColor = UIColor.emGreen
            
            let image = Asset.icArrow.image
            let checkmark = UIImageView(frame: CGRect(x: 0, y: 0, width: (image.size.width), height: (image.size.height)))
            checkmark.image = image
            self.accessoryView = checkmark
        }
    }
    
}
