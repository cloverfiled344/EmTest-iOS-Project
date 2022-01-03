//
//  OnBoardingVC + setupUI.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 05.04.2021.
//

import UIKit

extension OnBoardingVC {
    
    func setupUI() {
        self.setupCV()
        self.registerCell()
        self.setupButton()
        self.setupPageControl()
        
        self.onBoardingCell.skipButton.addTarget(self, action: #selector(didTappedSkipButton), for: .touchUpInside)
        self.continueButton.addTarget(self, action: #selector(didTappedContinueButton), for: .touchUpInside)
    }
    
    func setupButton() {
        self.continueButton.layer.backgroundColor = UIColor.emGreen.cgColor
        self.continueButton.setTitleColor(UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1), for: .normal)
    }
    
    func setupPageControl() {
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = self.arrayOfTitles.count
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 0.451, green: 0.604, blue: 0.004, alpha: 1)
        self.pageControl.pageIndicatorTintColor = UIColor.emGreen
    }
    
    func setupCV() {
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func registerCell() {
        self.collectionView.register(UINib(nibName: "OnboardingCVCell", bundle: nil), forCellWithReuseIdentifier: OnboardingCVCell.reusableCell)
    }
    
}
