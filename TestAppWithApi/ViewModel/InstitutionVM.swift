//
//  InstitutionVM.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.03.2021.
//

import Foundation

class InstitutionVM: NSObject {
    
    var mainPage: MainPage?
    var restaurantResult: ResultRestaurant?
    var stockResult: StocksResult?
    var dishesResult: DishesResult?
    var restaurant: Restaurant?
    var type: DishListsType = .category
    
    var restaurant_id: Int = 0
    var inShowType: InstitutionsCVShowType = .showSome
    
    var category: Category?
    
    func getRestaurants(_ restaurant_categories: Int?, completion: @escaping() -> Void) {
        API.institutionAPI.getInstitutions(self.restaurantResult?.next, restaurant_categories) { (result, error) in
            guard error == nil else {
                DesignHelpers.showToast(message: error, and: .red)
                completion()
                return
            }
            if let count = self.restaurantResult?.count, count > self.restaurantResult?.results.count ?? 0 {
                self.restaurantResult?.results.append(contentsOf: result?.results ?? [])
                self.restaurantResult?.next = result?.next
            }
            else {
                self.restaurantResult = result
            }
            completion()
        }
    }
    
    func getMainPage(completion: @escaping() -> Void) {
        API.institutionAPI.getMainPage { (mainPage, error) in
            guard error == nil else {
                DesignHelpers.showToast(message: error, and: .red)
                completion()
                return
            }
            self.mainPage = mainPage
            completion()
        }
    }
    
    func getRestaurantById(_ id: Int, completion: @escaping() -> Void) {
        API.institutionAPI.getRestaurantById(id) { (restaurant, error) in
            guard error == nil else {
                DesignHelpers.showToast(message: error, and: .red)
                completion()
                return
            }
            self.restaurant = restaurant
            completion()
        }
    }
    
    func getDishesById(_ categoryId: Int?, _ restaurantId: Int?, _ type: DishListsType , completion: @escaping() -> Void) {
        API.institutionAPI.getAndSearchDishesById(self.dishesResult?.next, categoryId, restaurantId, nil, type) { (result, error) in
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
    
}
