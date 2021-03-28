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
    
    
//     MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = (self.viewModel.restaurantResult?.results.count ?? 0) > 10 ? 10 : (self.viewModel.restaurantResult?.count ?? 0)
        return self.viewModel.inShowType == InstitutionsCVShowType.showSome ? count + 3 : (self.viewModel.restaurantResult?.count ?? 0)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = (self.viewModel.restaurantResult?.count ?? 0)
        if indexPath.row == lastItem - 1 && self.viewModel.restaurantResult?.next != nil && (self.viewModel.inShowType == .showAll || self.viewModel.inShowType == .showFiltered) {
            self.activityIndicatiorView?.startAnimating()
            self.getRestaurants()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InstitutionTVCell.cellID, for: indexPath) as? InstitutionTVCell else {
            return UITableViewCell()
        }
        let restaurant = self.viewModel.restaurantResult?.results[indexPath.row]
        cell.restaurant = restaurant
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableView.cellForRow(at: indexPath) as? InstitutionTVCell) != nil {
            let restaurant = self.viewModel.restaurantResult?.results[indexPath.row]
            self.pushIDDetailCVC(restaurant?.id ?? 0)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

}
