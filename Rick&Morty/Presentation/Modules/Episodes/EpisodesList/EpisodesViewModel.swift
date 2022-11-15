//
//  EpisodesViewModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 11/11/22.
//

import UIKit

class EpisodesViewModel {
    
    //MARK: Properties
    var episodeResult: EpisodeResults?
    var episodesList: [Episode] = []
    var info: Info?
    var pageNum = 1
    var searchText = ""
    
    //MARK: Functions
    func loadPageIfNeeded(at index: Int, completion: @escaping () -> ()) {
        if index >= (episodesList.count) - 5 {
            if info?.pages != pageNum {
                pageNum += 1
                getEpisodesList(searchTextInput: searchText) {
                    completion()
                }
            }
        }
    }
    
    //MARK: APIFunctions
    func getEpisodesList(searchTextInput: String?, restart: Bool = false, completion: @escaping () -> ()) {
        if restart {
            searchText = searchTextInput ?? ""
            self.pageNum = 1
            // Lo quito porque se estaba haciendo antes de que se vuelva a hacer la llamada y se rompe
//            self.episodesList.removeAll()
        }
        Task {
            do {
                self.episodeResult = try await APICalls.shared.getEpisodesList(page: pageNum, name: searchText)
                guard let episodes = episodeResult?.episodeResults else { return }
                if restart {
                    episodesList = episodes
                } else {
                    episodesList.append(contentsOf: episodes)
                }
            } catch {
                if let errorMessage = error as? ErrorMessage {
                    switch errorMessage.type {
                        case .urlError:
                            print("The URL request failed.")
                        case .dataError:
                            print("The DATA request failed.")
                    }
                }
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
