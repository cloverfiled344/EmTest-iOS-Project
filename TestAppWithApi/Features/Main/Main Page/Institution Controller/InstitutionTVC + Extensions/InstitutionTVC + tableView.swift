//
//  InstitutionTVC + tableView.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 23.03.2021.
//

import Foundation

extension InstitutionTVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = (self.viewModel?.restaurantResult?.results.count ?? 0) > 10 ? 10 : (self.viewModel?.restaurantResult?.results.count ?? 0)
        return self.viewModel?.inShowType == InstitutionsCVShowType.showSome ? count + 3 : (self.viewModel?.restaurantResult?.results.count ?? 0)
    }
}
