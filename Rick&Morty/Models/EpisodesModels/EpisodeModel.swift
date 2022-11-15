//
//  EpisodeModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import Foundation

struct Episode: Decodable {
    var id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
    }
}
