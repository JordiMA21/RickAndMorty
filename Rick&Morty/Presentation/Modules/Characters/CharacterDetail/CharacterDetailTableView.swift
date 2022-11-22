//
//  CharactersVC.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import UIKit

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView (_ tableView: UITableView) {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NameCharacterDetailCustomCell", bundle: nil), forCellReuseIdentifier: "NameCharacterDetailCustomCell")
        tableView.register(UINib(nibName: "HeaderCustomCell", bundle: nil), forCellReuseIdentifier: "HeaderCustomCell")
        tableView.register(UINib(nibName: "TwoCharacterDetailsCustomCell", bundle: nil), forCellReuseIdentifier: "TwoCharacterDetailsCustomCell")
        tableView.register(UINib(nibName: "OneCharacterDetailCustomCell", bundle: nil), forCellReuseIdentifier: "OneCharacterDetailCustomCell")
        tableView.register(UINib(nibName: "EpisodesCharacterDetailCell", bundle: nibBundle), forCellReuseIdentifier: "EpisodesCharacterDetailCell")
        tableView.register(UINib(nibName: "EpisodeCustomCell", bundle: nibBundle), forCellReuseIdentifier: "EpisodeCustomCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "EmptyHeaderCell")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 3:
                return 3
            case 5:
                if isOpened == true {
                    return viewModel?.chosenCharacter.episode.count ?? 0
                } else {
                    return 0
                }
            default:
                return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let emptyCell = tableView.dequeueReusableCell(withIdentifier: "EmptyHeaderCell", for: indexPath)
                emptyCell.textLabel?.text = ""
                return emptyCell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "NameCharacterDetailCustomCell", for: indexPath) as! NameCharacterDetailCustomCell
                cell.display(summary: NameCharacterDetailCustomCellSummary(characterName: viewModel?.chosenCharacter.name))
                cell.selectionStyle = .none
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwoCharacterDetailsCustomCell", for: indexPath) as! TwoCharacterDetailsCustomCell
                
                cell.display(summary: TwoCharacterDetailsCustomCellSummary(titleLeft: "Last known location:",
                                                                           labelLeft: viewModel?.chosenCharacter.location.name,
                                                                           titleRight: "First seen in:",
                                                                           labelRight: viewModel?.chosenCharacter.origin.name))
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "OneCharacterDetailCustomCell", for: indexPath) as! OneCharacterDetailCustomCell
                switch indexPath.row {
                    case 0:
                        cell.display(summary: OneCharacterDetailCustomCellSummary(title: "Status:", label: viewModel?.chosenCharacter.status))
                    case 1:
                        cell.display(summary: OneCharacterDetailCustomCellSummary(title: "Species:", label: viewModel?.chosenCharacter.species))
                    case 2:
                        cell.display(summary: OneCharacterDetailCustomCellSummary(title: "Gender:", label: viewModel?.chosenCharacter.gender))
                    default:
                        return cell
                }
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCustomCell", for: indexPath) as! HeaderCustomCell
                cell.display(summary: HeaderCustomCellSummary(characterName: "Episodes:",
                                                              episodesNum: viewModel.chosenCharacter.episode.count ?? 0,
                                                              isOpened: isOpened))
                tableView.reloadSections(IndexSet(integer: 4), with: .automatic)
                return cell
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodesCharacterDetailCell", for: indexPath) as! EpisodesCharacterDetailCell
                cell.loadEpisode(url: viewModel.chosenCharacter.episode[indexPath.row])
                return cell
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 232
            default:
                return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
            case 4:
                isOpened.toggle()
                print(isOpened)
                tableView.reloadSections(IndexSet(integer: 5), with: .automatic)
                tableView.reloadSections(IndexSet(integer: 4), with: .automatic)
            default:
                return
        }
    }

    // It controls the image animation when scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        
        goToTopButton.isHidden = !((offset > 0) && (isOpened == true))
        
        //ImageView height
        let newHeaderHeight = 232 - scrollView.contentOffset.y
        heightHeader.constant = newHeaderHeight
        
        //ImageView alpha
        UIView.animate(withDuration: 0.25) {
            self.headerTableView.alpha = (232 - offset)/232
        }
    }
}
