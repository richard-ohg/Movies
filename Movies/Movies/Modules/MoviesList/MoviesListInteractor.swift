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
                presenter?.didFetchPopularMovies(result: response)
            case .failure(let error):
                presenter?.showError(error: error)
            }
        }
    }
    
    func fetchTopRatedMovies() {
        Task {
            let result = await RequestManager.shared.fetchTopRatedMovies()
            switch result {
            case .success(let response):
                presenter?.didFetchTopRatedMovies(result: response)
            case .failure(let error):
                presenter?.showError(error: error)
            }
        }
    }
    
    func fetchOnTVMovies() {
        Task {
            let result = await RequestManager.shared.fetchMoviesOnTV()
            switch result {
            case .success(let response):
                presenter?.didFetchOnTVMovies(result: response)
            case .failure(let error):
                presenter?.showError(error: error)
            }
        }
    }
    
    func fetchAiringMovies() {
        Task {
            let result = await RequestManager.shared.fetchAiringMovies()
            switch result {
            case .success(let response):
                presenter?.didFetchAiringMovies(result: response)
            case .failure(let error):
                presenter?.showError(error: error)
            }
        }
    }
    
    func logout() {
        do {
            try RequestManager.shared.logout()
            presenter?.successLogout()
        } catch  {
            presenter?.showError(error: error)
        }
    }
}
