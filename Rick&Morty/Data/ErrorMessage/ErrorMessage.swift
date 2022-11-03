//
//  ErrorMessage.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

struct ErrorMessage: Error {
    let type: ErrorType
    
    enum ErrorType: String {
        case dataError = "The data recived is invalid."
        case urlError = "There was an error on the url, please check it."
    }
}

