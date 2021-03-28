//
//  Profile.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 15.03.2021.
//

import Foundation
import ObjectMapper

class Profile: NSObject, Mappable {
    
    var name: String = ""
    var phone_number: String = ""
    var street: String = ""
    var birth_date: String = ""
    var total_sum: String = ""
    var bonuses: String = ""
    var gender: String = ""
    var email: String = ""
    var user_status: UserStatus?
    
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        phone_number <- map["phone_number"]
        street <- map["street"]
        birth_date <- map["birth_date"]
        total_sum <- map["total_sum"]
        bonuses <- map["bonuses"]
        gender <- map["gender"]
        email <- map["email"]
        user_status <- map["user_status"]
    }
}

class UserStatus: NSObject, Mappable {
    
    var id: Int = 0
    var title: String = ""
    var discount: String = ""
    var status_image: String = ""
    var status_image_panel: String = ""
    
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        discount <- map["discount"]
        status_image <- map["status_image"]
        status_image_panel <- map["status_image_panel"]
    }
}
