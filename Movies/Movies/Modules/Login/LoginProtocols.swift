//
//  LoginProtocols.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//  
//

import Foundation

// MARK: VIEW -> PRESENTER
protocol Login_ViewToPresenterProtocol: AnyObject {
	var view: Login_PresenterToViewProtocol? { get set }
	var interactor: Login_PresenterToInteractorProtocol? { get set }
	var router: Login_PresenterToRouterProtocol? { get set }
    
    func login(email: String, password: String)
}

// MARK: PRESENTER -> INTERACTOR
protocol Login_PresenterToInteractorProtocol: AnyObject {
    var presenter: Login_InteractorToPresenterProtocol? { get set }
    
    func login(email: String, password: String)
}

// MARK: INTERACTOR -> PRESENTER
protocol Login_InteractorToPresenterProtocol: AnyObject {
    func loginSuccess()
    func loginError()
}

// MARK: PRESENTER -> VIEW
protocol Login_PresenterToViewProtocol: AnyObject {
    var presenter: Login_ViewToPresenterProtocol? { get set }
    
    func showLoader()
    func hideLoader()
    func showErrorMessage()
}

// MARK: PRESENTER -> ROUTER
protocol Login_PresenterToRouterProtocol: AnyObject {
    
    func goToMoviesList()
}
