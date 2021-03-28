//
//  Restaurant.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 19.03.2021.
//

import Foundation
import ObjectMapper

class ResultRestaurant: NSObject, Mappable {
    
    var count: Int = 0
    var next: Int?
    var previous: Int?
    var results: [Restaurant] = []
    
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


class Restaurant: NSObject, Mappable {
    
    var id: Int = 0
    var restaurant_categories: [String] = []
    var title: String = ""
    var avg_price: Int = 0
    var address: String = ""
    var delivery_price: Int = 0
    var start_time: String = ""
    var end_time: String = ""
    var cover: String = ""
    var is_favorite: Bool = false
    
    var desc: String = ""
    var latitude: String = ""
    var longitude: String = ""
    var logo: String = ""
    var images: [String] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        restaurant_categories <- map["restaurant_categories"]
        title <- map["title"]
        avg_price <- map["avg_price"]
        address <- map["address"]
        delivery_price <- map["delivery_price"]
        start_time <- map["start_time"]
        end_time <- map["end_time"]
        cover <- map["cover"]
        is_favorite <- map["is_favorite"]
        
        desc <- map["desc"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        logo <- map["logo"]
        images <- map["images"]
    }
}
