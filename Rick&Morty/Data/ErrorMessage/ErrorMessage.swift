//
//  ErrorMessage.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import Foundation

enum ErrorMessage: String, Error {
    case dataError = "The data recived is invalid."
    case urlError = "There was an error on the url, please check it."
}
