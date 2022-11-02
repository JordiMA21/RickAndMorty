//
//  HomeViewController.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView (_ tableView: UITableView) {
        tableView.backgroundColor = .red
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HomeCustomCell", bundle: nil), forCellReuseIdentifier: "HomeCustomCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCustomCell", for: indexPath) as! HomeCustomCell
        
        cell.display(summary: HomeCustomCellSummary(image: viewModel.character?.image,
                                                    characterName: viewModel.character?.name))

        return cell
    }
}

