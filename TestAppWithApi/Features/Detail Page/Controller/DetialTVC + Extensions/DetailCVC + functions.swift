//
//  DetailCVC + functions.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 25.03.2021.
//

import UIKit
import ProgressHUD

extension DetailCVC {
    
    func reloadCVData() {
        ProgressHUD.dismiss()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
