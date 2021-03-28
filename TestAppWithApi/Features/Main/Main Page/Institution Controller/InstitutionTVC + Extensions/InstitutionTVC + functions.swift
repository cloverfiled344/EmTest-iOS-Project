//
//  InstitutionTVC + functions.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.03.2021.
//

import UIKit
import ProgressHUD

extension InstitutionTVC {
    
    func fetchData() {
        self.getMainPage()
        self.getRestaurants()
    }
    
    func getRestaurants() {
        self.viewModel.getRestaurants(self.viewModel.category?.id) {
            self.reloadTVData()
        }
    }
    
    func getMainPage() {
        self.viewModel.getMainPage {
            self.reloadTVData()
        }
    }
    
    func pushIDDetailCVC(_ id: Int?) {
        guard let restaurantID = id else {
            DesignHelpers.showToast(message: "Идентификатор не найден", and: .red)
            return
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailCVC") as! DetailCVC
        vc.viewModel.restaurant_id = restaurantID
    
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func reloadTVData() {
        ProgressHUD.dismiss()
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
            self.activityIndicatiorView?.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    
    
    @objc func refresh(sender: AnyObject) {
        self.viewModel.restaurantResult?.next = nil
        self.viewModel.restaurantResult?.count = 0
        self.getRestaurants()
    }
}
