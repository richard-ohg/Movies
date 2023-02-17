//
//  MoviesListInteractor.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//  
//

import Foundation

class MoviesListInteractor: MoviesList_PresenterToInteractorProtocol {
    weak var presenter: MoviesList_InteractorToPresenterProtocol?
    
    func fetchPopularMovies() {
        Task {
            let result = await RequestManager.shared.fetchPopularMovies()
            switch result {
            case .success(let response):
                presenter?.didFetch(result: response)
            case .failure(let error):
                presenter?.showError(error: error)
            }
        }
    }
}
