//
//  APICalls.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

class APICalls {
    static let shared = APICalls()
    
    func getCharactersList(/*location: String?, episode: String?,*/ page: Int?, name: String?/*, status: String?, species: String?, type: String?, gender: String?*/) async throws -> CharacterResults {
        
        var characterURLComponents = Endpoint.character.urlPath
        characterURLComponents.queryItems = []
        
//        if let location = location {
//            characterURLComponents?.queryItems?.append(URLQueryItem(name: "location", value: location))
//        }
//
//        if let episode = episode {
//            characterURLComponents?.queryItems?.append(URLQueryItem(name: "episode", value: episode))
//        }
        
        if let page = page {
            characterURLComponents.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        }
        
        if let name = name {
            characterURLComponents.queryItems?.append(URLQueryItem(name: "name", value: name))
        }
        
//        if let status = status {
//            characterURLComponents?.queryItems?.append(URLQueryItem(name: "status", value: status))
//        }
//
//        if let species = species {
//            characterURLComponents?.queryItems?.append(URLQueryItem(name: "species", value: species))
//        }
//
//        if let type = type {
//            characterURLComponents?.queryItems?.append(URLQueryItem(name: "type", value: type))
//        }
//
//        if let gender = gender {
//            characterURLComponents?.queryItems?.append(URLQueryItem(name: "gender", value: gender))
//        }
        
        guard let endPoint = characterURLComponents.url else { throw ErrorMessage(type: .urlError) }
        do {
            let (data, _) = try await URLSession.shared.data(from: endPoint)
            let resultModel = try JSONDecoder().decode(CharacterResults.self, from: data)
            return resultModel
        } catch {
            throw ErrorMessage(type: .dataError)
        }
    }
    
    func getEpisodesList(page: Int?, name: String?) async throws -> EpisodeResults {
        
        var episodeURLComponents = Endpoint.episode.urlPath
        episodeURLComponents.queryItems = []
        
        if let page = page {
            episodeURLComponents.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        }
        
        if let name = name {
            episodeURLComponents.queryItems?.append(URLQueryItem(name: "name", value: name))
        }
        
        guard let endPoint = episodeURLComponents.url else { throw ErrorMessage(type: .urlError) }
        do {
            let (data, _) = try await URLSession.shared.data(from: endPoint)
            let resultModel = try JSONDecoder().decode(EpisodeResults.self, from: data)
            return resultModel
        } catch {
            throw ErrorMessage(type: .dataError)
        }
    }
    
    func getDetailEpisode(path: String?) async throws -> Episode {
        
        let url = URL(string: path ?? "")
        
        guard let endPoint = url else { throw ErrorMessage(type: .urlError) }
        do {
            let (data, _) = try await URLSession.shared.data(from: endPoint)
            let resultModel = try JSONDecoder().decode(Episode.self, from: data)
            return resultModel
        } catch {
            throw ErrorMessage(type: .dataError)
        }
    }
    
    func getLocationsList(page: Int?, name: String?) async throws -> LocationResults {
        
        var locationURLComponents = Endpoint.location.urlPath
        locationURLComponents.queryItems = []

        if let page = page {
            locationURLComponents.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        }
        
        if let name = name {
            locationURLComponents.queryItems?.append(URLQueryItem(name: "name", value: name))
        }
        
        guard let endPoint = locationURLComponents.url else { throw ErrorMessage(type: .urlError) }
        do {
            let (data, _) = try await URLSession.shared.data(from: endPoint)
            let resultModel = try JSONDecoder().decode(LocationResults.self, from: data)
            return resultModel
        } catch {
            throw ErrorMessage(type: .dataError)
        }
    }

}
