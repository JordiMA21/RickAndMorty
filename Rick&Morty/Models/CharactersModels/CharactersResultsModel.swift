//
//  CharactersResultsModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

struct CharacterResults: Decodable {
    let info: Info?
    let charactersResults: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case charactersResults = "results"
    }
}
