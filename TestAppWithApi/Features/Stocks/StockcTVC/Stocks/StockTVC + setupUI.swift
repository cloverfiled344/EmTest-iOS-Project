//
//  StockTVC + setupUI.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 31.03.2021.
//

import UIKit

extension StockTVC {

    func setupUI() {
        self.setupNavBar()
        self.setViewStyle()
        self.registerTVCell()
        self.setupTVDelegate()
        self.setTVCell()
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.emGreen
        
        let leftButton = UIButton()
        leftButton.setImage(Asset.icBasket.image, for: .normal)
        leftButton.addTarget(self, action: #selector(didTappedBasket), for: .touchUpInside)
        
        leftButton.addSubview(self.setupBadgeLabel())
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem.init(customView: leftButton)]
        
        self.navigationItem.leftBarButtonItem = .init(image: Asset.icNavEmLogo.image, style: .plain, target: nil, action: nil)
    }
    
    func setViewStyle() {
        self.view.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
    }
    
    
    fileprivate func setTVCell() {
        self.tableView.separatorStyle = .none
    }
    
    fileprivate func registerTVCell() {
        
        self.tableView.register(UINib(nibName: "DiscountTVCell", bundle: nil), forCellReuseIdentifier: DiscountTVCell.reuseIdentifier)
        self.tableView.register(UINib(nibName: "EmptyTVCell", bundle: nil), forCellReuseIdentifier: EmptyTVCell.reuseIdentifier)
        self.tableView.register(UINib(nibName: "ShowButtonTVCell", bundle: nil), forCellReuseIdentifier: ShowButtonTVCell.reuseIdentifier)
    
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Загрузка...")
        self.refreshControl?.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        self.tableView.refreshControl = self.refreshControl
        
        self.activityIndicatorView = UIActivityIndicatorView(frame: .init(x: 0, y: 0, width: self.view.frame.width, height: 2))
        self.activityIndicatorView?.hidesWhenStopped = true
        self.tableView.tableFooterView = self.activityIndicatorView
        
    }
    
    fileprivate func setupTVDelegate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @objc func didTappedBasket() {
        
    }
}
