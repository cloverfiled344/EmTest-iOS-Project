//
//  Extensions + UITableView.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 17.03.2021.
//

import Foundation
import UIKit

extension UITableViewCell {
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    class var identifier: String {
        return String(describing: self)
    }
}
