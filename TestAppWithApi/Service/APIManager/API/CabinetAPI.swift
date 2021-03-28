//
//  CabinetAPI.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 15.03.2021.
//

import Foundation
import ObjectMapper

class CabinetAPI: NSObject {
    
    func getProfile(completion: @escaping(Profile?, String?) -> Void) {
        let pathStr = Global.pathFor(key: "profile_detail")
        
        ApiManager.shared.GET(path: pathStr, parameters: nil) { (json, error) in
            guard error == nil else {
                completion(nil, "\(error?.localizedDescription ?? "")")
                return
            }
            guard let orderResult = Mapper<Profile>().map(JSONObject: json.dictionaryObject) else {
                completion(nil, "Ошибка при разборе ресторанов!")
                return
            }
            completion(orderResult, nil)
        }
    }
    
    func updateProfile(_ params: Dictionary<String, Any>, completion: @escaping (Profile?, String?) -> Void) {
        let pathStr = Global.pathFor(key: "profile_detail")
        
        guard let token = KeychainService.instance().getToken() else {return}
        
        let headers = [
            "authorization": "Token \(token)",
            "content-type": "application-json",
            "cache-control": "no-cache"
        ]
        do {
            let postData = try JSONSerialization.data(withJSONObject: params, options: [])
            let request = NSMutableURLRequest(url: NSURL(string: pathStr)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            request.httpMethod = "PATCH"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data
            
            URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
                if error != nil {
                    completion(nil, "Профиль не обновился")
                }
                else {
                    let httpResponse = response as? HTTPURLResponse
                    if httpResponse?.statusCode == 200 {
                        self.getProfile { (profile, error) in
                            completion(profile, error)
                        }
                    }
                    else {
                        completion(nil, "Профиль не обновился")
                    }
                }
            }.resume()
        }
        catch {}
    }
    
    func getPages(completion: @escaping(AboutResult?, String?) -> Void) {
        let pathStr = Global.pathFor(key: "pages")
        
        ApiManager.shared.GET(path: pathStr, parameters: nil) { (json, error) in
            guard error == nil else {
                completion(nil, "\(error?.localizedDescription ?? "")")
                return
            }
            guard let aboutResult = Mapper<AboutResult>().map(JSONObject: json.dictionaryObject) else {
                completion(nil, "Ошибка при разборе ресторанов!")
                return
            }
            completion(aboutResult, nil)
        }
    }
    
}
