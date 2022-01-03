//
//  StocksResult.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 25.03.2021.
//

import UIKit
import ObjectMapper

class StocksResult: NSObject, Mappable {
    
    var count: Int = 0
    var next: Int?
    var previous: Int?
    var results: [Stocks] = []
    
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

class Stocks: NSObject, Mappable {
    
    var id: Int = 0
    var title: String = ""
    var cover: String = ""
    var desc: String = ""
    var restaurant: Restaurant?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        cover <- map["cover"]
        desc <- map["description"]
        restaurant <- map["restaurant"]
    }
}
