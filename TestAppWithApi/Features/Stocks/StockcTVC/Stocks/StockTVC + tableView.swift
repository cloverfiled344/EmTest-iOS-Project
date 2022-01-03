//
//  StockTVC + tableView.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 30.03.2021.
//

import UIKit

extension StockTVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = (self.viewModel.stocksResult?.results.count ?? 0)
        return count > 0 ? count: 2
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = (self.viewModel.stocksResult?.count ?? 0)
        if indexPath.row == lastItem - 1, self.viewModel.stocksResult?.next != nil {
            self.activityIndicatorView?.startAnimating()
            self.getStocks()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.configureCell(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if self.tableView.dequeueReusableCell(withIdentifier: DiscountTVCell.reuseIdentifier, for: indexPath) is DiscountTVCell {
            self.didselectRowAt(self.viewModel.stocksResult?.results[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
