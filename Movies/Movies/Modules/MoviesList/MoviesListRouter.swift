//
//  MoviesListRouter.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//  
//

import UIKit

class MoviesListRouter {
    
    weak var view: UIViewController?
	
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
        router.view = view
        
        return view
    }
}

extension MoviesListRouter: MoviesList_PresenterToRouterProtocol {
    func goToLogin() {
        let vc = view?.navigationController?.popViewController(animated: true)
        if vc == nil {
            let loginVC = LoginRouter.createModule()
            view?.navigationController?.viewControllers.insert(loginVC, at: 0)
            view?.navigationController?.popViewController(animated: true)
        }
    }
    
    func goToProfile() {
        let profileViewController = ProfileRouter.createModule()
        view?.present(profileViewController, animated: true)
    }
    
    func goToMovieDetail(with id: Int) {
        let profileViewController = MovieDetailRouter.createModule(movieId: id)
        view?.present(profileViewController, animated: true)
    }
}
