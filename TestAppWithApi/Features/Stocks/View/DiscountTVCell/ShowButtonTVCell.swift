//
//  ShowButtonTVCell.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 31.03.2021.
//

import UIKit

class ShowButtonTVCell: UITableViewCell {
    
    static let reuseIdentifier = "ShowButtonTVCell"
    
    var root: UIViewController?
    
    // Mark: - Outlets
    @IBOutlet weak var showButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    fileprivate func setupUI() {
        
        self.showButton.backgroundColor = .white
        self.showButton.layer.backgroundColor = UIColor.emGreen.cgColor
        self.showButton.setTitleColor(UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1), for: .normal)
        self.showButton.addTarget(self, action: #selector(didTappedShowButton), for: .touchUpInside)
        
    }
    
    @objc func didTappedShowButton() {
        self.showButton.pulsate(sender: self.showButton)
        let vc = InstitutionTVC()
        vc.hidesBottomBarWhenPushed = false
        (self.root as? InstitutionTVC)?.navigationController?.pushViewController(vc, animated: true)
    }
}
