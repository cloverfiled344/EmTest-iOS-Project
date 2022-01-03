//
//  DiscountsVM.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 30.03.2021.
//

import UIKit

class DiscountsVM: NSObject {
    
    var stocksResult: StocksResult?
    
    func getStocks(_ type: DishListsType, completion: @escaping() -> Void) {
        API.institutionAPI.getStocksByRestaurantId(self.stocksResult?.next, nil, type) { (result, error) in
            guard error == nil else {
                DesignHelpers.showToast(message: error, and: .red)
                completion()
                return
            }
            if let count = self.stocksResult?.count, count > self.stocksResult?.results.count ?? 0 {
                self.stocksResult?.results.append(contentsOf: result?.results ?? [])
                self.stocksResult?.next = result?.next
            }
            else {
                self.stocksResult = result
            }
            completion()
        }
    }
    
    func getDishesCountInCarts(completion: @escaping(Int?, String?) -> Void) {
        API.institutionAPI.getDishesCountInCarts { (cart_quantity, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            completion(cart_quantity, nil)
        }
    }
    
    
}
