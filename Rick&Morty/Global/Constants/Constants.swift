//
//  Constants.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

enum Endpoint {
    case character
    case episode
    case location
    
    var urlPath: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path.append("/api/")
        switch self {
            case .character:
                urlComponents.path.append("character/")
                return urlComponents
            case .episode:
                urlComponents.path.append("episode/")
                return urlComponents
            case .location:
                urlComponents.path.append("location/")
                return urlComponents
        }
    }
}
