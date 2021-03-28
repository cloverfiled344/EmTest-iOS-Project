//
//  KeychainService.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 15.03.2021.
//

import Foundation
import SwiftKeychainWrapper

struct Keys {
    static let token = "token"
    static let phone = "phone"
}

class KeychainService: NSObject {
    
    // Mark: - Shared Instance
    class func instance() -> KeychainService { return sharedManager }
    
    private static var sharedManager: KeychainService = {
        let manager = KeychainService()
        return manager
    }()
    
    func saveToken(_ token: String) {
        KeychainWrapper.standard.set(token, forKey: Keys.token, withAccessibility: .alwaysThisDeviceOnly, isSynchronizable: true)
    }
    
    func removeToken() {
        KeychainWrapper.standard.removeObject(forKey: Keys.token, withAccessibility: .alwaysThisDeviceOnly, isSynchronizable: true)
    }
    
    func getToken() -> String? {
        return KeychainWrapper.standard.string(forKey: Keys.token, withAccessibility: .alwaysThisDeviceOnly, isSynchronizable: true)
    }
    
    func savePhone(_ token: String) {
        KeychainWrapper.standard.set(token, forKey: Keys.phone, withAccessibility: .alwaysThisDeviceOnly, isSynchronizable: true)
    }
    
    func removePhone() {
        KeychainWrapper.standard.removeObject(forKey: Keys.phone, withAccessibility: .alwaysThisDeviceOnly, isSynchronizable: true)
    }
    
    func getPhone() -> String? {
        return KeychainWrapper.standard.string(forKey: Keys.phone, withAccessibility: .alwaysThisDeviceOnly, isSynchronizable: true)
    }
}
