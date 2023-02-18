//
//  DetailViewModel.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

struct DetailViewModel {
    let title: String
    let imageUrl: URL?
    let category: Category
    let runningTime: String
    let laguage: Language
    let genres: String
    let score: String
    let numberOfVotes: String
    let productionCompanies: [ProductionCompany]
    let date: String
    
    static let empty = MovieDetailViewModel(title: "", imageUrl: URL(string: ""), category: .A, runningTime: "", laguage: .en, genres: "", score: "", numberOfVotes: "", productionCompanies: [], date: "")
}
