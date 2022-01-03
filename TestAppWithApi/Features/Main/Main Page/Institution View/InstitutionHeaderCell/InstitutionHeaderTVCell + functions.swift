//
//  InstitutionHeaderTVCell + functions.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 13.04.2021.
//

import UIKit

extension InstitutionHeaderTVCell {
    
    @objc func touchOnSearchTF() {
        self.delegate?.didTappedOnSearch()
    }
    
    func setTags(_ tags: [String]) {
        self.tagListView.removeAllTags()
        self.tagListView.addTags(tags)
        self.tagListView.reload()
        self.tagListView.layoutIfNeeded()
    }
    
}
