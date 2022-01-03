//
//  OnBoardingVC.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 02.04.2021.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    var onBoardingCell: OnboardingCVCell!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var continueButton: UIButton!
    
    var arrayOfSubtitles: [String] = []
    var arrayOfImages: [String] = []
    
    var arrayOfTitles: [String] = [] {
        didSet {
            self.arrayOfSubtitles = ["Теперь заказывать еду из любимых заведений можно со смартфона, не выходя из дома! ", "Вы получите заказанные блюда настолько оперативно, насколько это возможно, блюда не успеют даже остыть. ", "Доставляем блюда из сотен заведений на выбор! Скидки. Наличный и безналичный расчет. "]
            self.arrayOfImages = [Asset.onBoarding1.name, Asset.onBoarding2.name, Asset.onBoarding3.name]
            self.pageControl.numberOfPages = self.arrayOfTitles.count
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDataTitle()
        self.setupUI()
        
    }
    
}
