//
//  InstitutionTVC.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.03.2021.
//

import UIKit
import ProgressHUD

class InstitutionTVC: UITableViewController {

    var viewModel: InstitutionVM = InstitutionVM()
    var activityIndicatiorView: UIActivityIndicatorView?
//    var type: DishListsType = .category
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show("", interaction: false)

        self.setupUI()
        self.fetchData()
    }

}
