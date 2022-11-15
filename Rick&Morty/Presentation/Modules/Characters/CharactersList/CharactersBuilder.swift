//
//  CharactersBuilder.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import UIKit

class CharactersBuilder {
    
    static func buildCharacters() -> CharactersViewController {
        // Instantiate Storyboard and ViewController
        let storyboard: UIStoryboard = UIStoryboard(name: "CharactersStoryboard", bundle: nil)
        let charactersViewController = storyboard.instantiateViewController(withIdentifier: "CharactersViewController") as! CharactersViewController
        charactersViewController.title = "CHARACTERS"
        
        // Instantiate ViewModel
        let viewModel = CharactersViewModel()
        
        // Assign var ViewModel created on specific ViewController to the above ViewModel instantiation
        charactersViewController.viewModel = viewModel
        
        // Give name and icon to the tab
        charactersViewController.tabBarItem = UITabBarItem(title: "CHARACTERS", image: UIImage(named: "rick"), tag: 0)
        
        return charactersViewController
    }
}
