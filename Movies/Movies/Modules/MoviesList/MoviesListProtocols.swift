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
}

// MARK: PRESENTER -> INTERACTOR
protocol MoviesList_PresenterToInteractorProtocol: AnyObject {
    var presenter: MoviesList_InteractorToPresenterProtocol? { get set }
}

// MARK: INTERACTOR -> PRESENTER
protocol MoviesList_InteractorToPresenterProtocol: AnyObject {
}

// MARK: PRESENTER -> VIEW
protocol MoviesList_PresenterToViewProtocol: AnyObject {
    var presenter: MoviesList_ViewToPresenterProtocol? { get set }
}

// MARK: PRESENTER -> ROUTER
protocol MoviesList_PresenterToRouterProtocol: AnyObject {
}
