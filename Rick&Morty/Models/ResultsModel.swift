//
//  ResultsModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

struct Results: Decodable {
    let info: Info?
    let results: [Character]?
}
