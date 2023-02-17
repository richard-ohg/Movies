//
//  MoviesListRouter.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//  
//

import UIKit

class MoviesListRouter {
	
    static func createModule() -> UIViewController {
        
        let view = MoviesListViewController()
        let presenter = MoviesListPresenter()
        let interactor = MoviesListInteractor()
        let router = MoviesListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension MoviesListRouter: MoviesList_PresenterToRouterProtocol {
    func goToLogin() {
//        TODO: missing implementation
        print("goToLogin")
    }
}
