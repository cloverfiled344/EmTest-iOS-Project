//
//  MainTabBarController.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 10.03.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyleNavBar()
    }

    func setupStyleNavBar() {
        self.tabBar.tintColor = UIColor.emGreen
    }
    
}

