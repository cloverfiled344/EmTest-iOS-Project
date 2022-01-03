//
//  AuthViewController.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 08.03.2021.
//

import UIKit
import PKHUD


class AuthViewController: UIViewController {

    // Mark: - Outlets
//    @IBOutlet weak var bannerIV: UIImageView!
//    @IBOutlet weak var iconIV: UIImageView!
//    @IBOutlet weak var nameTF: UITextField!
//    @IBOutlet weak var emailTF: UITextField!
//    @IBOutlet weak var passwordTF: UITextField!
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        bannerIV.image = Asset.loginPage.image
//        iconIV.image = Asset.icons8Dyndns64.image
//    }
//
//    @IBAction func login(_ sender: UIButton) {
//        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
//        guard let email = emailTF.text else { return }
//        guard let password = passwordTF.text else { return }
//
//        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//            if error == nil {
//                PKHUD.sharedHUD.show()
//                let vc = UIStoryboard.createViewController(storyboard: .main, controllerType: MainTabBarController.self)
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//            }
//            else {
//                self.showAlert()
//            }
//        }
//    }
//
//    @IBAction func register(_ sender: UIButton) {
//
//        guard let email = emailTF.text, !email.isEmpty, email.contains("@"), email.trimmingCharacters(in: .whitespaces).isEmpty else { return }
//        guard let password = passwordTF.text, !password.isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else { return }
//        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
//            if error == nil {
//                if let result = result {
//                    print(result.user.uid)
//                    let ref = Database.database().reference().child("users")
//                    ref.child(result.user.uid).updateChildValues(["email": email, "password": password])
//                    let newVC = UIStoryboard.createViewController(storyboard: .main, controllerType: MainTabBarController.self)
//                    newVC.modalPresentationStyle = .fullScreen
//                    self.present(newVC, animated: false, completion: nil)
//                }
//                else {
//                    print("Error to parsing json!")
//                }
//            }
//            else {
//                self.showAlert()
//            }
//        }
//    }
//
//    private func showAlert() {
//        let alert = UIAlertController(title: "Error", message: "Check in all the fields", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
}
