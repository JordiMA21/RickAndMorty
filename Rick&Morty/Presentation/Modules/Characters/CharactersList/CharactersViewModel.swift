//
//  CharactersViewModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

class CharactersViewModel {
    
    //MARK: Properties
    var characterResult: CharacterResults?
    var charactersList: [Character] = []
    var info: Info?
    var pageNum = 1
    var searchText = ""
    
    //MARK: Functions
    func loadPageIfNeeded(at index: Int, completion: @escaping () -> ()) {
        if index >= (charactersList.count) - 5 {
            if info?.pages != pageNum {
                pageNum += 1
                getCharactersList(searchTextInput: searchText) {
                    completion()
                }
            }
        }
    }
    
    //MARK: APIFunctions
    func getCharactersList(searchTextInput: String?, restart: Bool = false, completion: @escaping () -> ()) {
        if restart {
            searchText = searchTextInput ?? ""
            self.pageNum = 1
            // Lo quito porque se estaba haciendo antes de que se vuelva a hacer la llamada y se rompe
//            self.charactersList.removeAll()
        }
        Task {
            do {
                self.characterResult = try await APICalls.shared.getCharactersList(page: pageNum, name: searchText)
                guard let characters = characterResult?.charactersResults else { return }
                // Este if gestiona que si se ejecuta "restart" se iguale a la lista que recibo de la API, si no se ejecuta, entonces se concatenan los resultados
                if restart {
                    charactersList = characters
                } else {
                    charactersList.append(contentsOf: characters)
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

