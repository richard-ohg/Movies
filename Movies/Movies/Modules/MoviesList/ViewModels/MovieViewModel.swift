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
    
    static var test = MovieViewModel(id: 0, imageUrl: nil, title: "titulo", date: "Ago 27, 2016", score: "5.5", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley ")
}
