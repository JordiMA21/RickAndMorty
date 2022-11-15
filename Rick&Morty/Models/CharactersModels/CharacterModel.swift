//
//  CharacterModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

struct Character: Decodable {
    var id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin
    let location: CharacterLocation
    let image: String?
    let episode: [String]
}
