//
//  DishesResult.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 25.03.2021.
//

import UIKit
import ObjectMapper

class DishesResult: NSObject, Mappable {
    
    var count: Int = 0
    var next: Int?
    var previous: Int?
    var results: [Dish] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
        results <- map["results"]
    }
}

class Dish: NSObject, Mappable {
    
    var id: Int = 0
    var title: String = ""
    var category: String = ""
    var weight: Int = 0
    var price: Int = 0
    var image: String = ""
    var is_favorite: Bool = false
    var in_cart: Int = 0
    var restaurant: Restaurant?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        category <- map["category"]
        weight <- map["weight"]
        price <- map["price"]
        image <- map["image"]
        is_favorite <- map["is_favorite"]
        in_cart <- map["in_cart"]
        restaurant <- map["restaurant"]
        
    }
    
}
