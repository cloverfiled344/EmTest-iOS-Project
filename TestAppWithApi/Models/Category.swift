//
//  Category.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.03.2021.
//

import Foundation
import ObjectMapper

class Category: NSObject, Mappable {
    
    var id: Int = 0
    var title: String = ""
    var child_categories: [Category] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        child_categories <- map["child_categories"]
    }
}
