//
//  MainPage.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.03.2021.
//

import UIKit
import ObjectMapper

class MainPage: NSObject, Mappable {
    
    var popular_words: [PopularWord] = []
    var phones: [Phone] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        popular_words <- map["popular_words"]
        phones <- map["phones"]
    }
    
}

class PopularWord: NSObject, Mappable {
    
    var word: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        word <- map["word"]
    }
}

class Phone: NSObject, Mappable {
    
    var id: Int = 0
    var phone: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        phone <- map["phone"]
    }
}
