//
//  MainViewController.swift
//  TestAppWithApi
//
//  Created by Zhoomartov Erbolot on 22.02.2021.
//

import UIKit

class MainViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Mark: - Constants
    let segueID = "showDetails" 
    let cellID = "heroCell"
    
    // Mark: - Model's value
    var heroesModel = Model()
    
    // Mark: - Search controller
    private let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        
        
        downloadJSON {
            self.tableView.reloadData()
        }
        
        // Setup the search methods
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }

    // Json setup
    func downloadJSON(completed: @escaping () -> Void) {
        let url = URL(string: "https://api.opendota.com/api/heroStats")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                do {
                    if let data = data {
                        self.heroesModel.heroes = try JSONDecoder().decode([HeroModel].self, from: data)
                    }
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch {
                    print("Error")
                }
            }
        }.resume()
    }
    
    // Mark: - Search controller methods
    func searchBarIsEmpty() -> Bool {
        if let text = searchController.searchBar.text {
            return text.isEmpty
        }
        else {
            return false
        }
    }
    
    func isSearch() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func filterHeroes(text: String) {
        heroesModel.filterHero(text)
        self.tableView.reloadData()
    }
    
}


// Mark: - Extensions
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch() {
            return heroesModel.filterHeroes.count
        }
        return heroesModel.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! HeroTableViewCell
        
        var hero: HeroModel
        if isSearch() {
            hero = heroesModel.filterHeroes[indexPath.row]
        }
        else {
            hero = heroesModel.heroes[indexPath.row]
        }
        cell.heroName.text = hero.localized_name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueID, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID {
            let vc = segue.destination as! HeroViewController
            if let row = tableView.indexPathForSelectedRow?.row {
                if isSearch() {
                    vc.hero = heroesModel.filterHeroes[row]
                }
                else {
                    vc.hero = heroesModel.heroes[row]
                }
            }
        }
    }
}

extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterHeroes(text: searchController.searchBar.text!)
    }
}
