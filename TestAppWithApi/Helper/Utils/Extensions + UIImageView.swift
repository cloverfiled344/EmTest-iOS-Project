//
//  Extensions + UIImageView.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.03.2021.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func loadImageWithSDWebImage(_ url: String, _ placeholderIN: String, completion: @escaping(UIImage?, String?) -> Void) {
        self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: placeholderIN), options: .preloadAllFrames) { (image, error, type, url) in
            guard error == nil else {
                completion(nil, "\(error?.localizedDescription ?? "")")
                return
            }
            self.image = image
            completion(image, error?.localizedDescription)
        }
    }
    
    func loadImageWithSDWebImage(_ url: String, _ placeholderIN: String) {
        self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: placeholderIN), options: .preloadAllFrames) { (image, error, type, url) in
            guard error == nil else {
                return
            }
            self.image = image
        }
    }
    
}
