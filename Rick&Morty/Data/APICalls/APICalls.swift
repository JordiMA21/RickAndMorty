//
//  APICalls.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

class APICalls {
    static let shared = APICalls()
    let baseURL = Endpoint.production.urlPath
    
    func getCharactersList(page: Int) async throws -> Results {
        
        guard let endPoint = URL(string: baseURL + "character/?page=\(page)") else { throw ErrorMessage(type: .urlError) }
        do {
            let (data, _) = try await URLSession.shared.data(from: endPoint)
            let resultModel = try JSONDecoder().decode(Results.self, from: data)
            return resultModel
        } catch {
            throw ErrorMessage(type: .dataError)
        }
    }
}
