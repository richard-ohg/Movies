//
//  Endpoint.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

enum Endpoint {
    case popularMovies(Int? = nil)
    
    func getString() -> String {
        switch self {
        case .popularMovies:
            return "/movie/popular"
        }
    }
    
    func getQueryParam() -> String {
        switch self {
        case .popularMovies(let page):
            guard let page = page else { return .empty }
            return "&page=\(page)"
        }
    }
}
