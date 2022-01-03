//
//  DetailDiscountTVC.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 31.03.2021.
//

import UIKit

class DetailDiscountTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var stock: Stocks?
    
    public var tappedCell: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.setupUI()
        
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureCell(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath.row == 1 ? self.didTappedCloseButton() : nil
    }
    
    fileprivate func configureCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return makeDiscountTVCell(tableView, indexPath)
        }
        else {
            return makeShowButtonCell(tableView, indexPath)
        }
    }
    
    fileprivate func makeDiscountTVCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DetailDiscountTVCell.reuseIdentifier, for: indexPath) as! DetailDiscountTVCell
        cell.setupForDetailDiscount(self.stock?.cover ?? "", self.stock?.desc ?? "")
        cell.backgroundColor = .white
        return cell
    }
    
    fileprivate func makeShowButtonCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DetailButtonTVCell.reusableIdentifier, for: indexPath) as! DetailButtonTVCell
        cell.selectionStyle = .none
        cell.closeButton.setTitle("Закрыть", for: .normal)
        cell.closeButton.addTarget(self, action: #selector(didTappedCloseButton), for: .touchUpInside)
        return cell
    }
    
}
