//
//  OnTVMoviesEntity.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

struct OnTVMoviesEntity: MovieProtocol {
    var id: Int
    var title: String
    var overview: String
    var imageUrl: String?
    var votes: Double
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case id, overview
        case title = "name"
        case imageUrl = "poster_path"
        case votes = "vote_average"
        case date = "first_air_date"
    }
}
