//
//  MovieDetailRouter.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//  
//

import UIKit

class MovieDetailRouter {
	
    static func createModule(movieId: Int) -> UIViewController {
        
        let view = MovieDetailViewController()
        let presenter = MovieDetailPresenter(movieId: movieId)
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension MovieDetailRouter: MovieDetail_PresenterToRouterProtocol {
    
}
