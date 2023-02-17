//
//  MovieDetailProtocols.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//  
//

import Foundation

// MARK: VIEW -> PRESENTER
protocol MovieDetail_ViewToPresenterProtocol: AnyObject {
	var view: MovieDetail_PresenterToViewProtocol? { get set }
	var interactor: MovieDetail_PresenterToInteractorProtocol? { get set }
	var router: MovieDetail_PresenterToRouterProtocol? { get set }
    
    var productionCompaniesItemsCount: Int { get }

    func getItem(indexPath: IndexPath) -> ProductionCompany
    func viewDidLoad()
}

// MARK: PRESENTER -> INTERACTOR
protocol MovieDetail_PresenterToInteractorProtocol: AnyObject {
    var presenter: MovieDetail_InteractorToPresenterProtocol? { get set }

    func fetchMovieDetail(with id: Int)
}

// MARK: INTERACTOR -> PRESENTER
protocol MovieDetail_InteractorToPresenterProtocol: AnyObject {
    
    func didFetchMovieDetail(entity: MovieDetailResponseEntity)
    func showError(error: Error)
}

// MARK: PRESENTER -> VIEW
protocol MovieDetail_PresenterToViewProtocol: SpinnerDisplayable, AnyObject {
    var presenter: MovieDetail_ViewToPresenterProtocol? { get set }
    
    func update(movieDetailViewModel: MovieDetailViewModel)
    func showErrorMessage(error: Error)
}

// MARK: PRESENTER -> ROUTER
protocol MovieDetail_PresenterToRouterProtocol: AnyObject {
}
