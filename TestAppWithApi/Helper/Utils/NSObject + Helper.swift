//
//  NSObject + Helper.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 11.03.2021.
//

import UIKit

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
