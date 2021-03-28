//
//  DishesVM.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 25.03.2021.
//

import UIKit

class DishesVM: NSObject {
    
    var dishesResult: DishesResult?
    
    func getDishesById(_ categoryId: Int?, _ restaurantId: Int?, _ searchTxt: String?, _ type: DishListsType, completion: @escaping() -> Void) {
        API.institutionAPI.getAndSearchDishesById(self.dishesResult?.next, categoryId, restaurantId, searchTxt, type) { (result, error) in
            guard error == nil else {
                DesignHelpers.showToast(message: error, and: .red)
                completion()
                return
            }
            if let count = self.dishesResult?.count, count > self.dishesResult?.results.count ?? 0 {
                self.dishesResult?.results.append(contentsOf: result?.results ?? [])
                self.dishesResult?.next = result?.next
            }
            else {
                self.dishesResult = result
            }
            completion()
        }
    }
    
    func dishFavoriteCreateById(_ id: Int, completion: @escaping(String?) -> Void) {
        API.institutionAPI.dishFavoriteCreateById(id) { (error) in
            guard error == nil else {
                DesignHelpers.showToast(message: error, and: .red)
                return
            }
            completion(nil)
        }
    }
    
    
    
}
