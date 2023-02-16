//
//  Path.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

enum Path {
    case custom(String)
    case empty
    case popularMovies
    
    func getString() -> String {
        switch self {
        case .custom(let path):
            return path
        case .empty:
            return "/3"
        case .popularMovies:
            return "/3/movie/popular"
        }
    }
}
