//
//  EpisodesTableView.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 11/11/22.
//

import UIKit

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView (_ tableView: UITableView) {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EpisodeCustomCell", bundle: nil), forCellReuseIdentifier: "EpisodeCustomCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.episodesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCustomCell", for: indexPath) as! EpisodeCustomCell
        
        cell.display(summary: EpisodeCustomCellSummary(episodeName: viewModel.episodesList[indexPath.row].name,
                                                       episodeNum: viewModel.episodesList[indexPath.row].episode,
                                                       episodeID: viewModel.episodesList[indexPath.row].id ?? 1))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //        goToTopButton.isHidden = indexPath.row >= 20 ? false : true
        viewModel.loadPageIfNeeded(at: indexPath.row) {
            self.episodesTableView.reloadData()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        goToTopButton.isHidden = (scrollView.contentOffset.y <= 0)
    }
}
