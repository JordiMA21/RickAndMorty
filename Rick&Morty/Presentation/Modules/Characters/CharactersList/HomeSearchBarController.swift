//
//  HomeSearchBarController.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 7/11/22.
//

import UIKit

extension HomeViewController: UISearchResultsUpdating {
    func configureSearchController() {
        navigationItem.searchController = searchController
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
}
