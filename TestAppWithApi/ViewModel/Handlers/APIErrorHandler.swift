//
//  APIErrorHandler.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 15.03.2021.
//

import Foundation
import SwiftyJSON
import Alamofire
import ProgressHUD

public typealias APIClosure = (_ response: AnyObject?, _ error: Error?) -> Void

extension NSObject {
    public func handle(shouldShowMessageErrorIfExists: Bool = true, response: DataResponse<Any>, completion: (_ succeeded: Bool, _ response: [String: Any]?, _ error: Error?) -> Void) {
        let error = response.result.error
        guard error == nil else {
            if shouldShowMessageErrorIfExists {
                DesignHelpers.showToast(message: error?.localizedDescription, and: .red)
            }
            completion(false, nil, error)
            return
        }
        
        let statusCode = response.response!.statusCode
        guard statusCode < 500 else {
            if shouldShowMessageErrorIfExists {
                DesignHelpers.showToast(message: "Ошибка сервера :(", and: .red)
            }
            completion(false, nil, NSError(domain: "", code: statusCode, userInfo: nil))
            return
        }
        
        let responseJSON = response.result.value as? [String: Any]
        guard statusCode == 200 || statusCode == 201 else {
            if let detail = responseJSON?["message"] as? String {
                DesignHelpers.showToast(message: detail, and: .red)
            }
            else if let message = responseJSON?.first?.value as? String {
                DesignHelpers.showToast(message: message, and: .red)
            }
            else if let message = responseJSON?.first {
                DesignHelpers.showToast(message: "\(message.key): \(String(describing: message.value))", and: .red)
            }
            completion(false, nil, NSError(domain: "", code: statusCode, userInfo: nil))
            
            if statusCode == 101 {
                // token is outdated
                
            }
            
            
            return
        }
        
    }
    
    
    
}
