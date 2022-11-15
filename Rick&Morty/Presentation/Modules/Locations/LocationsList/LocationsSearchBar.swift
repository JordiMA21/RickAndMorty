//
//  LocationsSearchBar.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 7/11/22.
//

import UIKit

extension LocationsViewController: UISearchResultsUpdating {
    
    func configureSearchBar() {
        searchController.searchResultsUpdater = self
//        searchController.loadViewIfNeeded()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text ?? ""
        viewModel.getLocationsList(searchTextInput: search, restart: true) {
            self.locationsTableView.reloadData()
        }
    }
}
