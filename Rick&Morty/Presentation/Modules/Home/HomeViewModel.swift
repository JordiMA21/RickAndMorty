//
//  HomeViewModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

class HomeViewModel {
    
    //MARK: Properties
    var result: Results?
    var resultList: [Character]? = []
    var info: Info?
    var limit = 20
    var pageNum = 1
    var reloadLimit = 5
    
    //MARK: APIFunctions
    func getCharactersList(completed: @escaping () -> ()) {
        Task {
            do {
                self.result = try await APICalls.shared.getCharactersList(page: pageNum)
                guard let characters = result?.results else { return }
                resultList?.append(contentsOf: characters)
            } catch {
                if let errorMessage = error as? ErrorMessage {
                    switch errorMessage.type {
                        case .urlError:
                            print("Request failed with error in results list:")
                        case .dataError:
                            print("Request failed with error in results list:")
                    }
                }
            }
            DispatchQueue.main.async {
                completed()
            }
        }

    }
}

