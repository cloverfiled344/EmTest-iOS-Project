//
//  DetailCVC + fetchData.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 25.03.2021.
//

import UIKit
import ProgressHUD


extension DetailCVC {
    
    func fetchData() {
        self.getRestaurantById()
        self.getStocksByRestaurantId()
    }
    
    
    func getRestaurantById() {
        self.viewModel.getRestaurantById(self.viewModel.restaurant_id, completion: {
            self.reloadCVData()
            self.getDishesById()
            ProgressHUD.dismiss()
        })
    }
    

    func getDishesById() {
        print(self.viewModel.restaurant_id)
        self.viewModel.getDishesById(nil, self.viewModel.restaurant?.id, self.viewModel.type, completion: {
            ProgressHUD.dismiss()
            self.reloadCVData()
        })
    }
    
    func getStocksByRestaurantId() {
        
    }
}
