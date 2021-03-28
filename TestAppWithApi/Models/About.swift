//
//  About.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 16.03.2021.
//

import Foundation
import UIKit
import ObjectMapper


class AboutResult: NSObject, Mappable {
    var about_services: String = ""
    var static_pages: [About] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        about_services <- map["about_services"]
        static_pages <- map["static_pages"]
    }
    
}


class About: NSObject, Mappable {
    var id: Int = 0
    var title: String?
    var desc: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        desc <- map["desc"]
    }
}
