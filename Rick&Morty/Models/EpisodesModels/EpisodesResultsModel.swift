//
//  EpisodeResultsModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import Foundation

struct EpisodeResults: Decodable {
    let info: Info?
    let episodeResults: [Episode]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case episodeResults = "results"
    }
}
