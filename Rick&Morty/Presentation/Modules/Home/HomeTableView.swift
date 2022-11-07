//
//  HomeViewController.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView (_ tableView: UITableView) {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeCustomCell", bundle: nil), forCellReuseIdentifier: "HomeCustomCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.resultList?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCustomCell", for: indexPath) as! HomeCustomCell
        cell.display(summary: HomeCustomCellSummary(image: viewModel.resultList?[indexPath.row].image,
                                                    characterName:  viewModel.resultList?[indexPath.row].name,
                                                    characterStatus: viewModel.resultList?[indexPath.row].status,
                                                    characterGender: viewModel.resultList?[indexPath.row].gender,
                                                    characterID: viewModel.resultList?[indexPath.row].id ?? 1))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "CharacterViewController", bundle: nil)
        guard let characterViewController = storyBoard.instantiateViewController(withIdentifier: "CharacterViewController") as? CharacterViewController else { return }
        guard let selectedCharacter = viewModel.resultList?[indexPath.row] else { return }
        let charcterViewModel = CharacterViewModel(character: selectedCharacter)
        characterViewController.viewModel = charcterViewModel
        self.navigationController?.pushViewController(characterViewController, animated: true)
        print("The selected character is the number: \(selectedCharacter)")
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= (viewModel.resultList?.count ?? viewModel.limit) - 5 {
            if viewModel.info?.pages != viewModel.pageNum {
                viewModel.pageNum += 1
                viewModel.getCharactersList {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

