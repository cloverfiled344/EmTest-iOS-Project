//
//  DetailTVC + setupUI.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 25.03.2021.
//

import UIKit

extension DetailCVC {
    
    func setupUI() {
        setupNavBar()
        registerCVCell()
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.emGreen
        
        self.navigationItem.rightBarButtonItem = .init(image: Asset.icBasket.image, style: .plain, target: self, action: #selector(didTapBasketBtn))
    }
    
    func registerCVCell() {
        self.collectionView.register(UINib(nibName: "DetailPageCHRV", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailPageCHRV.registerID)
        self.collectionView.register(UINib(nibName: "DetailDishCVCell", bundle: nil), forCellWithReuseIdentifier: "DetailDishCVCell")
    }
    
    @objc func didTapBasketBtn() {
        
    }
}
