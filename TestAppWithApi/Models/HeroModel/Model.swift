//
//  Model.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.02.2021.
//

import Foundation
import UIKit


class Model {
    var heroes = [HeroModel]()
    var filterHeroes = [HeroModel]()
    
    
    func filterHero(_ searchText: String) {
        filterHeroes.removeAll()
        
        filterHeroes = heroes.filter({ (hero) -> Bool in
            return hero.localized_name.lowercased().contains(searchText.lowercased())
        })
    }
}
