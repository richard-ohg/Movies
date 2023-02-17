//
//  Mapper.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> PopularMovieViewModel {
        let date = entity.date.transformDate(fromFormat: "yyyy-MM-dd", toFormat: "MMM dd, yyyy")
        
        return PopularMovieViewModel(
            imageUrl: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageUrl.orEmpty),
            title: entity.title,
            date: date,
            score: entity.votes.toString(),
            description: entity.overview)
    }
}
