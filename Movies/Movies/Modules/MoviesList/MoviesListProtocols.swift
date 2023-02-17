//
//  MoviesListProtocols.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//  
//

import Foundation

// MARK: VIEW -> PRESENTER
protocol MoviesList_ViewToPresenterProtocol: AnyObject {
	var view: MoviesList_PresenterToViewProtocol? { get set }
	var interactor: MoviesList_PresenterToInteractorProtocol? { get set }
	var router: MoviesList_PresenterToRouterProtocol? { get set }
    
    func viewDidLoad()
    func getItemsCount() -> Int
    func getItem(indexPath: IndexPath) -> MovieViewModel
    func logout()
    func showProfile()
    func didSelectItem(with indexPath: IndexPath)
    func segmentedValueChanged(section: Int)
}

// MARK: PRESENTER -> INTERACTOR
protocol MoviesList_PresenterToInteractorProtocol: AnyObject {
    var presenter: MoviesList_InteractorToPresenterProtocol? { get set }
    
    func fetchPopularMovies()
    func fetchTopRatedMovies()
    func fetchOnTVMovies()
//    func fetchAiringMovies()
    func logout()
}

// MARK: INTERACTOR -> PRESENTER
protocol MoviesList_InteractorToPresenterProtocol: AnyObject {
    
    func didFetchPopularMovies(result: GenericMovieResponseEntity<GenericMovieEntity>)
    func didFetchTopRatedMovies(result: GenericMovieResponseEntity<GenericMovieEntity>)
    func didFetchOnTVMovies(result: GenericMovieResponseEntity<OnTVMoviesEntity>)
//    func didFetchAiringMovies(result: GenericMovieResponseEntity<GenericMovieEntity>)
    func showError(error: Error)
    func successLogout()
}

// MARK: PRESENTER -> VIEW
protocol MoviesList_PresenterToViewProtocol: SpinnerDisplayable, AnyObject {
    var presenter: MoviesList_ViewToPresenterProtocol? { get set }
    
    func update()
    func showErrorMessage(error: Error)
}

// MARK: PRESENTER -> ROUTER
protocol MoviesList_PresenterToRouterProtocol: AnyObject {
    func goToLogin()
    func goToProfile()
    func goToMovieDetail(with id: Int)
}
