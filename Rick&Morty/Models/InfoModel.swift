//
//  InfoModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

struct Info: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
