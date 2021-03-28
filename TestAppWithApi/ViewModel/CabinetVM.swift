//
//  CabinetVM.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 16.03.2021.
//

import UIKit

class CabinetVM: NSObject {
    
    var profile: Profile?
    var aboutResult: AboutResult?
    
    func getProfile(completion: @escaping() -> Void) {
        API.cabinetAPI.getProfile { (profile, error) in
            guard error == nil else {
                DesignHelpers.showToast(message: error, and: .red)
                completion()
                return
            }
            self.profile = profile
            completion()
        }
    }
    
    func updateProfile(_ params: Dictionary<String, Any>, comletion: @escaping(String?) -> Void) {
        API.cabinetAPI.updateProfile(params) { (profile, error) in
            guard error == nil else {
                DesignHelpers.showToast(message: error, and: .red)
                comletion(error)
                return
            }
            self.profile = profile
            comletion(nil)
        }
    }
    
    func getPages(completion: @escaping() -> Void) {
        API.cabinetAPI.getPages { (aboutResult, error) in
            guard error == nil else {
                DesignHelpers.showToast(message: error, and: .red)
                completion()
                return
            }
            self.aboutResult = aboutResult
            completion()
        }
    }
    
}
