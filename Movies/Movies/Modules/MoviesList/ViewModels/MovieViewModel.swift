//
//  MovieViewModel.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

struct MovieViewModel {
    let id: Int
    let imageUrl: URL?
    let title: String
    let date: String
    let score: String
    let description: String
    
    static var empty = MovieViewModel(id: 0, imageUrl: nil, title: .empty, date: .empty, score: .empty, description: .empty)
}
