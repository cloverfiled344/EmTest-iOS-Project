//
//  ApiManager.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 15.03.2021.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import MobileCoreServices

final class ApiManager: NSObject {
    
    // Mark: - Shared Instance
    static let shared = ApiManager()
    private var manager: SessionManager!
    
    // Mark: - Init
    private override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        self.manager = Alamofire.SessionManager(configuration: configuration)
    }
    
    // Mark: - GET
    func GET(path: String, parameters: Parameters?, completion: @escaping(JSON, Error?) -> Void) {
        print(path)
        manager.request(path, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers()).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if response.response?.statusCode == 401 {
//                    NotificationCenter.default.post(name: .tokenReqiured, object: nil)
//                    return
                }
                if let jsonData = response.result.value {
                    let json = JSON(jsonData)
                    completion(json, nil)
                } else {
                    completion(JSON.null, nil)
                }
                break
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    completion(JSON.null, error)
                }
                else {
                    completion(JSON.null, error)
                    print("error:\(error)")
                }
            }
        }
    }
    
// Mark: - POST
    func POST(path: String, parameters: Parameters?, completion: @escaping(JSON, Error?) -> Void) {
        Alamofire.request(path, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers()).responseJSON { (response) in
            self.handle(shouldShowMessageErrorIfExists: true, response: response) { (succeeded, json, error) in
                switch succeeded {
                case true:
                    if response.response?.statusCode == 401 {
                        NotificationCenter.default.post(name: .tokenReqiured, object: nil)
                        return
                    }
                    if let jsonData = json {
                        let json = JSON(jsonData)
                        completion(json, nil)
                    }
                    else {
                        completion(JSON.null, error)
                    }
                    break
                case false:
                    completion(JSON.null, error)
                }
            }
        }
    }
    
    
    func PATCH(path: String, parameters: Parameters?, completion: @escaping(JSON, Error?) -> Void) {

        Alamofire.request(path, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers()).responseJSON { (response) in
            self.handle(shouldShowMessageErrorIfExists: true, response: response) { (succeeded, json, error) in
                switch succeeded {
                case true:
                    if response.response?.statusCode == 401 {
                       
                    }
                    
                    if let jsonData = json {
                        let json = JSON(jsonData)
                        completion(json, nil)
                    }
                    else {
                        completion(JSON.null, nil)
                    }
                    break
                case false:
                    if response.response?.statusCode == 401 {
                        
                    }
                    else {
                        completion(JSON.null, nil)
                    }
                }
            }
        }

    }
    
    
    private func headers() -> [String: String]? {
        if Checker.instance.isLoggedIn() {
            guard let token = KeychainService.instance().getToken() else {
                let vc = UIStoryboard.createViewController(storyboard: .main, controllerType: MainTabBarController.self)
                UIApplication.keyWindow?.rootViewController = vc
                return nil
            }
            let myHeader = [
                "Authorization": "Token \(token)",
                "content-type": "application-json",
                "cache-control": "no-cache",
            ]
            return myHeader
        }
        return nil
    }
    
}
