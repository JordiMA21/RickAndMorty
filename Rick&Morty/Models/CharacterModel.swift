//
//  CharacterModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

class CharacterModel: Decodable {
    var id: Int
    var name: String
    var image: String
    var episode: [String]
    var locationName: String
    var locationURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case episode
        case location
        case locationURL = "url"
    }
    
    required init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<CharacterModel.CodingKeys>=try decoder.container (keyedBy: CharacterModel.CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: CharacterModel.CodingKeys.id)
        self.name = try container.decode(String.self, forKey: CharacterModel.CodingKeys.name)
        self.image = try container.decode(String.self, forKey: CharacterModel.CodingKeys.image)
        self.episode = try container.decode([String].self, forKey: CharacterModel.CodingKeys.episode)
        
        let locationContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        self.locationName = try locationContainer.decode(String.self, forKey: .name)
        self.locationURL = try locationContainer.decode(String.self, forKey: .locationURL)
    }
}
