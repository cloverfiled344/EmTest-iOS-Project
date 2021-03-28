//
//  Checker.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 15.03.2021.
//

import Foundation
import Network

class Checker {
    
    static let instance = Checker()
    private var reachability: Reachability?
    
    func checkToken() -> (String) {
        let token = KeychainService.instance().getToken()
        return (token == nil || token == "") ? "" : (token ?? "")
    }
    
    // Mark: - Internet check function
    func checkNetwork() -> Bool {
        do {
            try reachability = Reachability.init()
            
            if (self.reachability?.connection) == .wifi || (self.reachability?.connection) == .cellular {
                return true
            } else if self.reachability?.connection == .unavailable {
                return false
            }
            else { return false }
        }
        catch { return false }
    }
    
    func checkIsNotFirstSetup() -> Bool {
        let isNotFirstSetup = UserDefaults.standard.bool(forKey: "isNotFisrtSetup")
        return isNotFirstSetup
    }
    
    func isLoggedIn() -> Bool {
        let token = UserDefaults.standard.bool(forKey: "isLogged")
        return token
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "token")
    }
}
