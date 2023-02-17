//
//  MovieDetailInteractor.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//  
//

import Foundation

class MovieDetailInteractor: MovieDetail_PresenterToInteractorProtocol {
    weak var presenter: MovieDetail_InteractorToPresenterProtocol?

    func fetchMovieDetail(with id: Int) {
        Task {
            let result = await RequestManager.shared.fetchMovieDetail(with: id)
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

