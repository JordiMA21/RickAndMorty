//
//  CharactersViewController.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import UIKit

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView (_ tableView: UITableView) {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CharacterCustomCell", bundle: nil), forCellReuseIdentifier: "CharacterCustomCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.charactersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCustomCell", for: indexPath) as! CharacterCustomCell

        cell.display(summary: CharacterCustomCellSummary(image: viewModel.charactersList[indexPath.row].image,
                                                    characterName:  viewModel.charactersList[indexPath.row].name,
                                                    characterStatus: viewModel.charactersList[indexPath.row].status,
                                                    characterGender: viewModel.charactersList[indexPath.row].gender,
                                                    characterID: viewModel.charactersList[indexPath.row].id ?? 1))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "CharacterDetailStoryboard", bundle: nil)
        guard let characterDetailViewController = storyBoard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController else { return }
        
        let selectedCharacter = viewModel.charactersList[indexPath.row]
        
        let characterDetailViewModel = CharacterDetailViewModel(character: selectedCharacter)
        characterDetailViewController.viewModel = characterDetailViewModel
        
        self.navigationController?.pushViewController(characterDetailViewController, animated: true)
        print("The selected character is the number: \(selectedCharacter.id)")
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        goToTopButton.isHidden = indexPath.row >= 20 ? false : true
        viewModel.loadPageIfNeeded(at: indexPath.row) {
            self.charactersTableView.reloadData()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        goToTopButton.isHidden = (scrollView.contentOffset.y <= 0)
    }
}

