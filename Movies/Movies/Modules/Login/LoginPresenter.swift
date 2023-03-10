//
//  LoginPresenter.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//  
//

import Foundation

class LoginPresenter: Login_ViewToPresenterProtocol {
    
    weak var view: Login_PresenterToViewProtocol?
    var interactor: Login_PresenterToInteractorProtocol?
    var router: Login_PresenterToRouterProtocol?
    
    func login(email: String, password: String) {
        view?.showSpinner()
        interactor?.login(email: email, password: password)
    }
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension LoginPresenter: Login_InteractorToPresenterProtocol {
    
    func loginSuccess() {
        DispatchQueue.main.async {
            self.view?.hideSpinner()
        }
        view?.clearView()
        router?.goToMoviesList()
    }
    
    func loginError() {
        DispatchQueue.main.async {
            self.view?.hideSpinner()
        }
        view?.showErrorMessage()
    }
}
