//
//  StockTVC + fetchData.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 30.03.2021.
//

import UIKit

extension StockTVC {
    
    func getStocks() {
        self.viewModel.getStocks(.search) {
            self.reloadCVData()
        }
    }
    
    func getDishesCountInCarts() {
        self.viewModel.getDishesCountInCarts { (cart_quantity, error) in
            guard error == nil else {
                self.setupBadgeLabel().isHidden = true
                return
            }
            self.setupBadgeLabel().isHidden = (cart_quantity ?? 0) > 0 ? false : true
            self.setupBadgeLabel().text = "\(cart_quantity ?? 0)"
        }
    }
    
}
