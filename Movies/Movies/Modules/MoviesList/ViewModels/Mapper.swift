//
//  Mapper.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> MovieViewModel {
        let date = entity.date.transformDate(fromFormat: "yyyy-MM-dd", toFormat: "MMM dd, yyyy")
        
        return MovieViewModel(
            id: entity.id,
            imageUrl: URL(string: URLBuilder.baseUrlToGetImage + entity.imageUrl.orEmpty),
            title: entity.title,
            date: date,
            score: entity.votes.toString(),
            description: entity.overview)
    }
}
