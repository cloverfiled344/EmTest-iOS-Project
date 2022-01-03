//
//  StockTVC + actions.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 31.03.2021.
//

import UIKit

extension StockTVC {
    
    @objc func refresh(sender: AnyObject) {
        self.viewModel.stocksResult?.next = nil
        self.viewModel.stocksResult?.count = 0
        self.getStocks()
    }
    
    @objc func didTappedShowRest(_ sender: UIButton) {
        sender.pulsate(sender: sender)
        self.tabBarController?.selectedIndex = 0
    }
}
