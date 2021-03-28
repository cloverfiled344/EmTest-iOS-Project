//
//  WelcomeViewController.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 11.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var bannerIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerIV.contentMode = .scaleAspectFill
        bannerIV.image = Asset.image112.image
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        let signVC = UIStoryboard.createViewController(storyboard: .main, controllerType: MainTabBarController.self)
        signVC.modalPresentationStyle = .fullScreen
        self.present(signVC, animated: true, completion: nil)
    }
}
