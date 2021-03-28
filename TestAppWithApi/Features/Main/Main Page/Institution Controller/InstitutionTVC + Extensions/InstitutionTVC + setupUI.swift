//
//  InstitutionTVC + setupUI.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.03.2021.
//

import UIKit

extension InstitutionTVC {
    
    func setupUI() {
        self.setupNavBar()
        self.setupTableView()
    }
    
    fileprivate func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.emGreen
        
        self.navigationItem.leftBarButtonItem = .init(image: Asset.icNavEmLogo.image, style: .plain, target: self, action: nil)
    }
    
    fileprivate func setupTableView() {
       
        self.tableView.register(InstitutionTVCell.nib(), forCellReuseIdentifier: InstitutionTVCell.cellID)
        
        self.tableView.tableHeaderView = UIView()
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = .white
        self.tableView.separatorStyle = .none
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.emGreen
        self.view.backgroundColor = UIColor.white
        
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Загрузка...")
        self.refreshControl?.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        
        self.activityIndicatiorView = UIActivityIndicatorView(frame: .init(x: 0, y: 0, width: self.view.frame.width, height: 64))
        self.activityIndicatiorView?.hidesWhenStopped = true
        self.tableView.tableHeaderView = activityIndicatiorView
    }
    
}
