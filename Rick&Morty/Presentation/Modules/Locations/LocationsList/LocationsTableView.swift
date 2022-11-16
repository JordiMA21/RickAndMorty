//
//  LocationsTableView.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 11/11/22.
//

import UIKit

extension LocationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView (_ tableView: UITableView) {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LocationCustomCell", bundle: nil), forCellReuseIdentifier: "LocationCustomCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.locationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCustomCell", for: indexPath) as! LocationCustomCell
        
        cell.display(summary: LocationCustomCellSummary(locationName: viewModel.locationList[indexPath.row].name,
                                                        typeName: viewModel.locationList[indexPath.row].type,
                                                        dimesionName: viewModel.locationList[indexPath.row].dimension))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //        goToTopButton.isHidden = indexPath.row >= 20 ? false : true
        viewModel.loadPageIfNeeded(at: indexPath.row) {
            self.locationsTableView.reloadData()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        goToTopButton.isHidden = (scrollView.contentOffset.y <= 0)
    }
}
