//
//  LocationsBuilder.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import UIKit

class LocationsBuilder {
    
    static func buildLocations() -> LocationsViewController {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "LocationsStoryboard", bundle: nil)
        let locationViewController = storyBoard.instantiateViewController(withIdentifier: "LocationsViewController") as! LocationsViewController
        locationViewController.title = "LOCATIONS"
        
        let viewModel = LocationsViewModel()
        
        locationViewController.viewModel = viewModel
        
        locationViewController.tabBarItem = UITabBarItem(title: "LOCATIONS", image: UIImage(systemName: "mappin.and.ellipse"), tag: 0)
        
        return locationViewController
    }
}
