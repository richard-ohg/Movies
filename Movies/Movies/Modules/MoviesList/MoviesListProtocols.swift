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
    
    var itemsCount: Int { get }
    
    func viewDidLoad()
    func getItem(indexPath: IndexPath) -> PopularMovieViewModel
}

// MARK: PRESENTER -> INTERACTOR
protocol MoviesList_PresenterToInteractorProtocol: AnyObject {
    var presenter: MoviesList_InteractorToPresenterProtocol? { get set }
    
    func fetchPopularMovies()
}

// MARK: INTERACTOR -> PRESENTER
protocol MoviesList_InteractorToPresenterProtocol: AnyObject {
    
    func didFetch(result: PopularMovieResponseEntity)
    func showError(error: Error)
}

// MARK: PRESENTER -> VIEW
protocol MoviesList_PresenterToViewProtocol: SpinnerDisplayable, AnyObject {
    var presenter: MoviesList_ViewToPresenterProtocol? { get set }
    
    func update()
    func showErrorMessage(error: Error)
}

// MARK: PRESENTER -> ROUTER
protocol MoviesList_PresenterToRouterProtocol: AnyObject {
}
