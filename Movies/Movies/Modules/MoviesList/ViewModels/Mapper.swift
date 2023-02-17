//
//  Mapper.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> PopularMovieViewModel {
        let date = transformDate(date: entity.date, fromFormat: "yyyy-MM-dd", toFormat: "MMM dd, yyyy")
        return PopularMovieViewModel(
            imageUrl: URL(string: "https://image.tmdb.org/t/p/w280/sv1xJUazXeYqALzczSZ3O6nkH75.jpg" + entity.imageUrl.orEmpty),
            title: entity.title,
            date: date,
            score: entity.votes.toString(),
            description: entity.overview)
    }
    
    func transformDate(date dateString: String, fromFormat: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es")
        dateFormatter.dateFormat = fromFormat
        guard let date = dateFormatter.date(from: dateString) else { return .empty }
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: date)
    }
}
