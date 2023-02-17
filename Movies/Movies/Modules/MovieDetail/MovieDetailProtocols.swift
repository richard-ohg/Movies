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

    func fetchMovieDetail(with id: Int)
}

// MARK: PRESENTER -> INTERACTOR
protocol MovieDetail_PresenterToInteractorProtocol: AnyObject {
    var presenter: MovieDetail_InteractorToPresenterProtocol? { get set }

    func fetchMovieDetail(with id: Int)
}

// MARK: INTERACTOR -> PRESENTER
protocol MovieDetail_InteractorToPresenterProtocol: AnyObject {
}

// MARK: PRESENTER -> VIEW
protocol MovieDetail_PresenterToViewProtocol: AnyObject {
    var presenter: MovieDetail_ViewToPresenterProtocol? { get set }
}

// MARK: PRESENTER -> ROUTER
protocol MovieDetail_PresenterToRouterProtocol: AnyObject {
}
