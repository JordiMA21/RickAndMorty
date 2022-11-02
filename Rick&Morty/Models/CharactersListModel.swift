//
//  CharactersListModel.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

struct Results: Decodable {
    let info: Info?
    let results: [Character]?
}

struct Info: Decodable {
    let count, pages: Int?
    let next, prev: String?
}


struct Character  : Decodable {
    let id : Int?
    let name : String?
    let status : String?
    let species : String?
    let type : String?
    let gender : String?
    let image : String?
    let location : Location
    let episode : [String]
}

struct Location : Decodable {
    let name : String?
    let url : String?
}
