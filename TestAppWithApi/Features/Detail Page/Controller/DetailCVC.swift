//
//  DetailCVC.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 25.03.2021.
//

import UIKit
import ProgressHUD


class DetailCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let reuseCVId = "DetailDishCVCell"
    let countCells: Int = 2
    let offset: CGFloat = 5.0
    
    var viewModel: InstitutionVM = InstitutionVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.type = .restaurant
        ProgressHUD.show("", interaction: false)
        
        self.setupUI()
        self.fetchData()
        
        // Setup tableView height
    
    }
    
    private func setupHeightRow() {
       
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.dishesResult?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailPageCHRV.registerID, for: indexPath) as! DetailPageCHRV
            headerView.restaurant = self.viewModel.restaurant
            return headerView
        }
        fatalError()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailDishCVCell", for: indexPath) as! DetailDishCVCell
        cell.viewModel = DishesVM()
        cell.dish = self.viewModel.dishesResult?.results[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastItem = self.viewModel.dishesResult?.results.count ?? 0
        if indexPath.row == lastItem - 1, self.viewModel.dishesResult?.next != nil {
            self.getDishesById()
        }
    }

    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
 
        return .init(width: UIScreen.main.bounds.width, height: 290)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = self.collectionView.bounds
        let cellWidth: CGFloat = (bounds.width-24) / 2
        let cellHeight: CGFloat = cellWidth
        return .init(width: cellWidth, height: cellHeight)
    }
    
    fileprivate func makeSize(_ width: inout CGFloat, _ height: inout CGFloat, _ indexPath: IndexPath) {
        width = (self.viewModel.dishesResult?.results.count ?? 0) > 0 ?
            (self.view.frame.width-24) / 2 : self.view.frame.width
        height = (self.viewModel.dishesResult?.results.count ?? 0) > 0 ? self.viewModel.type == DishListsType.restaurant ? 299 : 333 : self.view.frame.height
    }
    
}
