//
//  Global.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 15.03.2021.
//

import UIKit

class Global {
    
    class func pathFor(key: String) -> String {
        if let path = Bundle.main.path(forResource: "api", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            let path = dict[key] as! String
            let domen = dict["domen"] as! String
            let link = "\(domen)\(path)"
            return link
        }
        else {return ""}
    }
}
