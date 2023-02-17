//
//  GenericMovieResponseEntity.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

struct GenericMovieResponseEntity<T: MovieProtocol>: Decodable {
    let results: [T]
}
