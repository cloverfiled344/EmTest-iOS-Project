//
//  HeroModel.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.02.2021.
//

import Foundation
import UIKit

struct HeroModel: Decodable {
    
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
    
}


