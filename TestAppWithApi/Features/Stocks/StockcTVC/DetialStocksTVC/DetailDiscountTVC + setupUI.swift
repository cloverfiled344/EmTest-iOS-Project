//
//  DetailDiscountTVC + setupUI.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 31.03.2021.
//

import UIKit

extension DetailDiscountTVC {
  
    func setupUI() {

        self.setViewStyle()
        self.setupTV()
    }
    
    fileprivate func setViewStyle() {
        self.view.backgroundColor = .white
        self.view.layer.cornerRadius = 12
        self.view.layer.masksToBounds = true
    }
    
    fileprivate func setupTV() {
        self.setupTVStyle()
        self.registerCell()
        self.setupTVDelegate()
    }
    
    
    fileprivate func setupTVStyle() {
        self.tableView.separatorStyle = .none
    }
    
    fileprivate func registerCell() {
        self.tableView.register(UINib(nibName: "DetailDiscountTVCell", bundle: nil), forCellReuseIdentifier: DetailDiscountTVCell.reuseIdentifier)
        self.tableView.register(UINib(nibName: "DetailButtonTVCell", bundle: nil), forCellReuseIdentifier: DetailButtonTVCell.reusableIdentifier)
    }
    
    fileprivate func setupTVDelegate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}
