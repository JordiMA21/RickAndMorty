//
//  LocationsViewModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 11/11/22.
//

import UIKit

class LocationsViewModel {
    
    //MARK: Properties
    var locationResult: LocationResults?
    var locationList: [Location] = []
    var info: Info?
    var pageNum = 1
    var searchText = ""
    
    //MARK: Functions
    func loadPageIfNeeded(at index: Int, completion: @escaping () -> ()) {
        if index >= (locationList.count) - 5 {
            if info?.pages != pageNum {
                pageNum += 1
                getLocationsList(searchTextInput: searchText) {
                    completion()
                }
            }
        }
    }
    
    //MARK: APIFunctions
    func getLocationsList(searchTextInput: String?, restart: Bool = false, completion: @escaping () -> ()) {
        if restart {
            searchText = searchTextInput ?? ""
            self.pageNum = 1
            // Lo quito porque se estaba haciendo antes de que se vuelva a hacer la llamada y se rompe
//            self.episodesList.removeAll()
        }
        Task {
            do {
                self.locationResult = try await APICalls.shared.getLocationsList(page: pageNum, name: searchText)
                guard let episodes = locationResult?.locationResults else { return }
                
                if restart {
                    locationList = episodes
                } else {
                    locationList.append(contentsOf: episodes)
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
