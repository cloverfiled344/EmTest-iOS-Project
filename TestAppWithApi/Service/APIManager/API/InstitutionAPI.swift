//
//  InstitutionAPI.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 19.03.2021.
//

import Foundation
import ObjectMapper

class InstitutionAPI: NSObject {
    
    func getInstitutions(_ page: Int?, _ restaurant_categories: Int?, _ searchTxt: String? = nil, completion: @escaping(ResultRestaurant?, String?) -> Void) {
        var pathStr = Global.pathFor(key: "restaurants")
        var params = ["page": page ?? 1] as [String: Any]
        if restaurant_categories != nil && restaurant_categories != 0 {
            params["restaurant_categories"] = restaurant_categories
        }
        if searchTxt != nil {
            params["search"] = searchTxt
            pathStr = Global.pathFor(key: "restaurant_search")
        }
        
        ApiManager.shared.GET(path: pathStr, parameters: params) { (json, error) in
            guard error == nil else {
                completion(nil, "\(error?.localizedDescription ?? "")")
                return
            }
            guard let results = Mapper<ResultRestaurant>().map(JSONObject: json.dictionaryObject) else {
                completion(nil, "Ошибка при разборе ресторанов")
                return
            }
            completion(results, nil)
        }
    }
    
    func getMainPage(completion: @escaping(MainPage?, String?) -> Void) {
        let path = Global.pathFor(key: "mainPage")
        
        ApiManager.shared.GET(path: path, parameters: nil) { (json, error) in
            guard error == nil else {
                completion(nil, "\(error?.localizedDescription ?? "")")
                return
            }
            guard let mainPage = Mapper<MainPage>().map(JSONObject: json.dictionaryObject) else {
                completion(nil, "Ошибка при разборе ресторанов")
                return
            }
            completion(mainPage, nil)
        }
    }
    
    func getRestaurantById(_ id: Int, completion: @escaping (Restaurant?, String?) -> Void) {
        let path = Global.pathFor(key: "restaurants")
        
        ApiManager.shared.GET(path: "\(path)\(id)/", parameters: nil) { (json, error) in
            guard error == nil else {
                completion(nil, "\(error?.localizedDescription ?? "")")
                return
            }
            
            guard let restaurant = Mapper<Restaurant>().map(JSONObject: json.dictionaryObject) else {
                completion(nil, "Ошибка при разборе ресторанов")
                return
            }
            completion(restaurant, nil)
        }
    }
    
    func getAndSearchDishesById(_ page: Int?, _ categoryId: Int?, _ restaurantId: Int?, _ searchTxt: String?, _ type: DishListsType, completion: @escaping(DishesResult?, String?) -> Void) {
        var path: String = ""
        var params = ["page": page ?? 1] as [String: Any]
        switch type {
        case .category:
            if categoryId != nil && restaurantId != nil {
                params["category"] = categoryId
                params["restaurant"] = restaurantId
            }
            path = Global.pathFor(key: "restaurants_dishes")
        case .restaurant:
            if restaurantId != nil {
                params["restaurant"] = restaurantId
            }
            path = Global.pathFor(key: "restaurants_dishes")
        case .search:
            if searchTxt != nil {
                params["search"] = searchTxt
            }
            path = Global.pathFor(key: "dishes_search")
        case .favorites:
            completion(nil, nil)
            return
        }
        
        ApiManager.shared.GET(path: path, parameters: params) { (json, error) in
            guard error == nil else {
                completion(nil, "\(error?.localizedDescription ?? "")")
                return
            }
            
            guard let results = Mapper<DishesResult>().map(JSONObject: json.dictionaryObject) else {
                completion(nil, "Ошибка при разборе ресторанов")
                return
            }
            completion(results, nil)
        }
    }
    
    func getStocksByRestaurantId(_ page: Int?, _ id: Int?, _ type: DishListsType, completion: @escaping(StocksResult?, String?) -> Void) {
        let path = Global.pathFor(key: "restaurants_stocks")
        var params = ["page": page ?? 1] as [String: Any]
        switch type {
        case .restaurant:
            params["restaurant"] = id
        case .category:
            break
        case .search:
            break
        case .favorites:
            break
        }
        
        ApiManager.shared.GET(path: path, parameters: params) { (json, error) in
            guard error == nil else {
                completion(nil, "\(error?.localizedDescription ?? "")")
                return
            }
            
            guard let stocksResult = Mapper<StocksResult>().map(JSONObject: json.dictionaryObject) else {
                completion(nil, "Ошибка при разборе ресторанов")
                return
            }
             completion(stocksResult, nil)
        }
    }
    
    func dishFavoriteCreateById(_ id: Int, completion: @escaping(String?) -> Void) {
        let path = Global.pathFor(key: "restaurants_favorite")
        let params = ["dish_id": id] as [String: Any]
        ApiManager.shared.POST(path: path, parameters: params) { (json, error) in
            guard error == nil else {
                completion("\(error?.localizedDescription ?? "")")
                return
            }
            DesignHelpers.showToast(message: json["message"].stringValue, and: .systemGreen)
            completion(nil)
        }
    }
    
    func dishCartUpdateById(_ id: Int, _ quantity: Int, completion: @escaping(String?) -> Void) {
        let path = Global.pathFor(key: "cart")
        let params = ["id": id, "quantity": quantity] as [String: Any]
        ApiManager.shared.PATCH(path: path, parameters: params) { (json, error) in
            guard error == nil else {
                completion("\(error?.localizedDescription ?? "")")
                return
            }
            DesignHelpers.showToast(message: json["message"].stringValue, and: .systemGreen)
            completion(nil)
        }
    }
    
    func getDishesCountInCarts(completion: @escaping(Int?, String?) -> Void) {
        let path = Global.pathFor(key: "dishes_count_in_carts")
        ApiManager.shared.GET(path: path, parameters: nil) { (json, error) in
            guard error == nil else {
                completion(nil, "\(error?.localizedDescription ?? "")")
                return
            }
            completion(json["cart_quantity"].intValue, nil)
        }
    }
    
}
