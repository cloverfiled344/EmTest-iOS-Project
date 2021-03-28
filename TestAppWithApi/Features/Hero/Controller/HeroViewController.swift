//
//  HeroViewController.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.02.2021.
//

import UIKit

class HeroViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var legsLabel: UILabel!
    
    // Mark: - Model's value
    var hero: HeroModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        nameLabel.text = "Hero's name: \((hero?.localized_name)!)"
        attributeLabel.text = "Hero's nickname: \((hero?.primary_attr)!)"
        attackLabel.text = "This hero has an attack type: \((hero?.attack_type)!)"
        legsLabel.text = "Hero has \((hero?.legs)!) legs"
        
        let urlString = "https://api.opendota.com" + (hero?.img)!
        let url = URL(string: urlString)

        imageView.downloaded(from: url!)
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    }
    
}

// Mark: - Image extension
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
