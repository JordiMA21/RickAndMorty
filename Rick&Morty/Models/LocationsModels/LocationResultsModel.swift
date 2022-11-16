//
//  LocationResultsModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import Foundation

struct LocationResults: Decodable {
    let info: Info?
    let locationResults: [Location]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case locationResults = "results"
    }
}
