//
//  EpisodesBuilder.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import UIKit

class EpisodesBuilder {
    
    static func buildEpisodes() -> EpisodesViewController {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "EpisodesStoryboard", bundle: nil)
        let episodesViewController = storyBoard.instantiateViewController(withIdentifier: "EpisodesViewController") as! EpisodesViewController
        episodesViewController.title = "EPISODES"
        
        let viewModel = EpisodesViewModel()
        
        episodesViewController.viewModel = viewModel
        
        episodesViewController.tabBarItem = UITabBarItem(title: "EPISODES", image: UIImage(named: "clapperboard"), tag: 0)
        
        return episodesViewController
    }
}
