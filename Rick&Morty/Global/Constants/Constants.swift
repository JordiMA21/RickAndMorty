//
//  Constants.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

enum Endpoint {
    case production
    
    var urlPath: String {
        switch self {
            case .production:
                return "https://rickandmortyapi.com/api/"
        }
    }
}
