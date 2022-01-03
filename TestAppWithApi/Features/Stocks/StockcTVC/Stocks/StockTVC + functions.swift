//
//  StockTVC + functions.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 30.03.2021.
//

import UIKit
import ProgressHUD
//import FloatingPanel
import FittedSheets

extension StockTVC {
    
    // Mark: - TableView
    func configureCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let count = (self.viewModel.stocksResult?.count ?? 0)
        if count > 0 {
            return makeDiscountCell(tableView, indexPath)
        }
        else if indexPath.row == 0 {
            return makeEmptyCell(tableView, indexPath)
        }
        else if indexPath.row == 1 {
            return makeShowButtonCell(tableView, indexPath)
        }
        else {
            return UITableViewCell()
        }
    }

    
    fileprivate func makeDiscountCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DiscountTVCell.reuseIdentifier, for: indexPath) as! DiscountTVCell
        cell.stock = self.viewModel.stocksResult?.results[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    fileprivate func makeEmptyCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: EmptyTVCell.reuseIdentifier, for: indexPath) as! EmptyTVCell
        self.tableView.backgroundColor = .white
        return cell
    }
    
    fileprivate func makeShowButtonCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ShowButtonTVCell.reuseIdentifier, for: indexPath) as! ShowButtonTVCell
        cell.showButton.setTitle("Посмотреть рестораны", for: .normal)
        cell.showButton.addTarget(self, action: #selector(didTappedShowRest(_:)), for: .touchUpInside)
        return cell
    }
    
    func didselectRowAt(_ stock: Stocks?) {
        let count = (self.viewModel.stocksResult?.results.count ?? 0)
        if count > 0 {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailDiscountTVC") as? DetailDiscountTVC else { return }
            guard let stock = stock else { return }
            vc.stock = stock
            self.moveFSC(vc)
        }
    }
    
    fileprivate func moveFSC(_ controller: UIViewController) {
        
        let options = SheetOptions(
            useInlineMode: true)
        
        let sheetController = SheetViewController(controller: controller, sizes: [.percent(0.75), .fullscreen], options: options)
        sheetController.hidesBottomBarWhenPushed = true
        sheetController.overlayColor = UIColor.gray.withAlphaComponent(0.2)
        sheetController.cornerRadius = 15
        
        sheetController.didDismiss = { _ in
            sheetController.dismiss(animated: false, completion: nil)
        }
        self.present(sheetController, animated: true, completion: nil)
    }
    
    
    func reloadCVData() {
        ProgressHUD.dismiss()
        self.tableView.refreshControl?.endRefreshing()
        self.activityIndicatorView?.stopAnimating()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
