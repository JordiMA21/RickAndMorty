//
//  APICalls.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

class APICalls {
    static let shared = APICalls()
    let baseURL = Endpoint.production.urlPath
    
    func getAllCharactersData() async throws -> Results  {
        guard let endPoint = URL(string: baseURL + "character") else { throw ErrorMessage.urlError }
        
        let (data, _) = try await URLSession.shared.data(from: endPoint)
        let resultModel = try JSONDecoder().decode(Results.self, from: data)
        print("Character result \(resultModel)")
        return resultModel
    }
    
    func getCharacterInfo() async throws -> CharacterModel {
        
        guard let endPoint = URL(string: baseURL + "character/1") else { throw ErrorMessage.urlError }
        
        let (data, _) = try await URLSession.shared.data(from: endPoint)
        let characterModel = try JSONDecoder().decode(CharacterModel.self, from: data)
        print("Character Model \(characterModel)")
        return characterModel
    }
}
