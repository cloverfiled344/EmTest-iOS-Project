//
//  MainTabBarControllerExtension + setupUI.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 30.03.2021.
//

import UIKit

extension MainTabBarController {
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.tintColor = UIColor.emGreen
        
        setupBarStyle()
        setupTabBarItems()
    }
    
    
    func setupBarStyle() {
        self.tabBar.tintColor = .black
    }
    
    func setupTabBarItems() {
        self.viewControllers = [
            setupHomeVC()
        ]
    }
    
    func setupHomeVC() -> UINavigationController {
        let homeVC = templateNavController(unselectedImage: Asset.icUnselectedHome.image, selectedImage: Asset.icUnselectedHome.image, title: "Заведения")
        return homeVC
    }
    
    
    func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, title: String, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.tabBarItem.title = title
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.73
        navController.tabBarItem.setTitleTextAttributes([.font: UIFont(font: FontFamily.OpenSans.regular, size: 12) ?? UIFont.systemFont(ofSize: 12), .paragraphStyle: paragraphStyle, .kern: -0.2, .foregroundColor: UIColor(red: 0.569, green: 0.761, blue: 0.012, alpha: 1)], for: .selected)
        return navController
    }
    
}
