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
}

// MARK: PRESENTER -> INTERACTOR
protocol Login_PresenterToInteractorProtocol: AnyObject {
    var presenter: Login_InteractorToPresenterProtocol? { get set }
}

// MARK: INTERACTOR -> PRESENTER
protocol Login_InteractorToPresenterProtocol: AnyObject {
}

// MARK: PRESENTER -> VIEW
protocol Login_PresenterToViewProtocol: AnyObject {
    var presenter: Login_ViewToPresenterProtocol? { get set }
}

// MARK: PRESENTER -> ROUTER
protocol Login_PresenterToRouterProtocol: AnyObject {
}
