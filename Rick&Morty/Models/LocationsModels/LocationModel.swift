//
//  LocationModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import Foundation

struct Location: Decodable {
    var id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [String]
}
