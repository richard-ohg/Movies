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
    case movieDetail(Int)
    case tvDetail(Int)
    case topRated
    case onTV
    case airing
    
    func getString() -> String {
        switch self {
        case .custom(let path):
            return path
        case .empty:
            return "/3"
        case .popularMovies:
            return "/3/movie/popular"
        case .movieDetail(let movieId):
            return "/3/movie/\(movieId)"
        case .tvDetail(let tvId):
            return "/3/tv/\(tvId)"
        case .topRated:
            return "/3/movie/top_rated"
        case .onTV:
            return "/3/tv/on_the_air"
        case .airing:
            return "/3/tv/airing_today"
        }
    }
}
