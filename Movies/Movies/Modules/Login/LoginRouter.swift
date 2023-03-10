//
//  LoginRouter.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//  
//

import UIKit

class LoginRouter {
    
    weak var view: UIViewController?
	
    static func createModule() -> UIViewController {
        
        let view = LoginViewController()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}

extension LoginRouter: Login_PresenterToRouterProtocol {
    func goToMoviesList() {
        let movieListViewController = MoviesListRouter.createModule()
        view?.navigationController?.pushViewController(movieListViewController, animated: true)
    }
}
