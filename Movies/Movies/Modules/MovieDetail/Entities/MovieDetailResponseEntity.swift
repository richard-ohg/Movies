//
//  MovieDetailResponseEntity.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

struct MovieDetailResponseEntity: Decodable {
    let id: Int
    let isForAdults: Bool
    let genres: [GenresEntity]
    let title: String
    let overview: String
    let imageUrl: String?
    let votes: Double
    let date: String
    let language: String
    let runtime: Int?
    let vote_count: Int
    let productionCompanies: [ProductionCompanyEntity]

    enum CodingKeys: String, CodingKey {
        case id, genres, title, overview, runtime, vote_count
        case isForAdults = "adult"
        case imageUrl = "poster_path"
        case votes = "vote_average"
        case date = "release_date"
        case language = "original_language"
        case productionCompanies = "production_companies"
    }
}
