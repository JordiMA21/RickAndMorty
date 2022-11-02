//
//  HomeViewModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

class HomeViewModel {
    
    //MARK: Properties
    var character: CharacterModel?
    var result: Results?
    
    func executeAPICalls() {
        Task {
            do {
                self.character = try await APICalls.shared.getCharacterInfo()
            } catch {
                print("Request failed with error in character info: \(ErrorMessage.dataError.rawValue)")
            }
        }
    }
    
    func executeAPI() {
        Task {
            do {
                self.result = try await APICalls.shared.getAllCharactersData()
            } catch {
                print("Request failed with error in results list: \(ErrorMessage.dataError.rawValue)")
            }
        }
    }
}

