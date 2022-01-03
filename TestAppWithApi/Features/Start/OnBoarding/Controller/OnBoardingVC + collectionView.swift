//
//  OnBoardingVC + collectionView.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 05.04.2021.
//

import UIKit

extension OnBoardingVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCVCell.reusableCell, for: indexPath) as! OnboardingCVCell
        cell.setupTitle(title: self.arrayOfTitles[indexPath.row], subTitle: self.arrayOfSubtitles[indexPath.row], imgName: self.arrayOfImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: self.view.layoutMarginsGuide.layoutFrame.height - 108)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        didScroll()
    }
    
    private func didScroll() {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let indexPath = self.collectionView.indexPathForItem(at: visiblePoint)
        self.pageControl.currentPage = indexPath?.row ?? 0
        if self.pageControl.currentPage + 1 == self.arrayOfTitles.count {
            onBoardingCell.skipButton.alpha = 0
        }
        else {
            onBoardingCell.skipButton.alpha = 1
        }
    }
    
}
