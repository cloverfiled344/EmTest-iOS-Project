//
//  File.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 10.03.2021.
//

import Foundation

final class API: NSObject {
    
    // Mark: - Shared Instance
    static let shared = API()
    
    static var cabinetAPI = CabinetAPI()
    static var institutionAPI = InstitutionAPI()
    
}
