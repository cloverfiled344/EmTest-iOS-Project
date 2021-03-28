//
//  DesignHelpers.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 16.03.2021.
//

import UIKit
import BRYXBanner
import XLPagerTabStrip

class DesignHelpers: NSObject {
    
    static let instance = DesignHelpers()
    var banner: Banner?
    
    static func showToast(message: String?, and bgColor: UIColor = UIColor(hex: "#8080ff")) {
        guard let message = message else { return }
        
        instance.banner?.dismiss()
        instance.banner = Banner(title: nil, subtitle: message, image: nil, backgroundColor: bgColor, didTapBlock: nil)
        instance.banner?.dismissesOnSwipe = true
        instance.banner?.dismissesOnTap = true
        instance.banner?.show(duration: 3.0)
    }
    
    static func makeToastWithText(_ text: String) {
        showToast(message: text)
    }
    
}
