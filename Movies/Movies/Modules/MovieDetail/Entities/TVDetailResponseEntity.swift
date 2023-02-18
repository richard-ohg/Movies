//
//  TVDetailResponseEntity.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

struct TVDetailResponseEntity: Decodable {
    let id: Int
    let isForAdults: Bool
    let genres: [GenresEntity]
    let title: String
    let overview: String
    let imageUrl: String?
    let votes: Double
    let date: String
    let language: String
    let vote_count: Int
    let productionCompanies: [ProductionCompanyEntity]
    let episodes: Int

    enum CodingKeys: String, CodingKey {
        case id, genres, overview, vote_count
        case title = "name"
        case isForAdults = "adult"
        case imageUrl = "poster_path"
        case votes = "vote_average"
        case date = "first_air_date"
        case language = "original_language"
        case productionCompanies = "production_companies"
        case episodes = "number_of_episodes"
    }
}
