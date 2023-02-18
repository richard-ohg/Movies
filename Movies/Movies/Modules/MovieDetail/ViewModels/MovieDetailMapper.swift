//
//  MovieDetailMapper.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

struct MovieDetailMapper {
    func map(entity: MovieDetailResponseEntity) -> DetailViewModel {
        let date = entity.date.transformDate(fromFormat: "yyyy-MM-dd", toFormat: "MMM dd, yyyy").capitalized
        let category: Category = entity.isForAdults ? .C : .A
        let language = Language(rawValue: entity.language) ?? .unknown
        let productionCompanies = entity.productionCompanies.map(mapProductionCompany(entity:))
        
        return DetailViewModel(
            title: entity.title,
            imageUrl: URL(string: URLBuilder.baseUrlToGetImage + entity.imageUrl.orEmpty),
            category: category,
            runningTime: entity.runtime.orZero.toString() + " min",
            laguage: language,
            genres: getGenres(genresList: entity.genres),
            score: entity.votes.toString(),
            numberOfVotes: entity.vote_count.toString() + " votes",
            productionCompanies: productionCompanies,
            date: date
        )
    }
    
    func map(entity: TVDetailResponseEntity) -> DetailViewModel {
        let date = entity.date.transformDate(fromFormat: "yyyy-MM-dd", toFormat: "MMM dd, yyyy").capitalized
        let category: Category = entity.isForAdults ? .C : .A
        let language = Language(rawValue: entity.language) ?? .unknown
        let productionCompanies = entity.productionCompanies.map(mapProductionCompany(entity:))
        
        return DetailViewModel(
            title: entity.title,
            imageUrl: URL(string: URLBuilder.baseUrlToGetImage + entity.imageUrl.orEmpty),
            category: category,
            runningTime: entity.episodes.toString() + " epi",
            laguage: language,
            genres: getGenres(genresList: entity.genres),
            score: entity.votes.toString(),
            numberOfVotes: entity.vote_count.toString() + " votes",
            productionCompanies: productionCompanies,
            date: date
        )
    }
    
    func mapProductionCompany(entity: ProductionCompanyEntity) -> ProductionCompany {
        ProductionCompany(
            name: entity.companyName,
            imageUrl: URL(string: URLBuilder.baseUrlToGetImage + entity.imageUrl.orEmpty)
        )
    }
    
    private func getGenres(genresList: [GenresEntity]) -> String {
        let genresList: [String] = genresList.map(\.name)
        return genresList.joined(separator: ", ")
    }
}
