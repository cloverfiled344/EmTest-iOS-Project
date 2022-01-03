//
//  OnBoardingVC + functions.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 05.04.2021.
//

import UIKit

extension OnBoardingVC {
    
    func setDataTitle() {
        self.arrayOfTitles = ["Заказывать стало \nв 2 раза проще!", "Доставка в любое место \nи в любое время", "Лучшие рестораны \nв нашем приложении"]
    }
    
    @objc func didTappedSkipButton() {
        self.onBoardingCell.skipButton.pulsate(sender: self.onBoardingCell.skipButton)
        
        self.collectionView.scrollToItem(at: .init(row: self.arrayOfTitles.count - 1, section: 0), at: .centeredHorizontally, animated: true)
        self.pageControl.currentPage = self.pageControl.currentPage + self.arrayOfTitles.count - 1
        if self.pageControl.currentPage + 1 == self.arrayOfTitles.count {
            self.onBoardingCell.skipButton.alpha = 0
        }
        else {
            self.onBoardingCell.skipButton.alpha = 0
        }

    }
    
    @objc func didTappedContinueButton() {
        
    }
    
}
