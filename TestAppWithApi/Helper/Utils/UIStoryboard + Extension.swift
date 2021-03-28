//
//  UIStoryboard + Extension.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 11.03.2021.
//

import UIKit

extension UIStoryboard {
    class func createViewController<T: UIViewController>(storyboard: AppStoryboard, controllerType: T.Type) -> T {
        let st = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: controllerType.className) as! T
        return vc
    }
}
