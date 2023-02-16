//
//  LoginRouter.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//  
//

import UIKit

class LoginRouter {
	
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
        
        return view
    }
}

extension LoginRouter: Login_PresenterToRouterProtocol {
    func goToMoviesList() {
        print("goToMoviesList")
    }
}
