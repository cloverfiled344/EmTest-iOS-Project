//
//  StockTVC.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 30.03.2021.
//

import UIKit
import FloatingPanel
import ProgressHUD


class StockTVC: UIViewController, FloatingPanelControllerDelegate {

    // Mark: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    let badgSize: CGFloat = 20
    let badgeTag: Int = 9830384
    var badgeCount = UILabel()
    
    var viewModel: DiscountsVM = DiscountsVM()
    var activityIndicatorView: UIActivityIndicatorView?
    var refreshControl: UIRefreshControl?
    
    var detailDiscountTVC: DetailDiscountTVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show("", interaction: false)
        
        self.setupUI()
        self.getStocks()
        
    }


    func setupBadgeLabel() -> UILabel {
        badgeCount = UILabel(frame: .init(x: 0, y: 0, width: badgSize, height: badgSize))
        badgeCount.translatesAutoresizingMaskIntoConstraints = false
        badgeCount.tag = badgeTag
        badgeCount.layer.cornerRadius = badgeCount.bounds.size.height / 2
        badgeCount.layer.masksToBounds = true
        badgeCount.backgroundColor = UIColor.emGreen
        badgeCount.font = badgeCount.font.withSize(12)
        badgeCount.textColor = .white
        badgeCount.textAlignment = .center
        badgeCount.text = ""
        return badgeCount
    }
    
    
}
