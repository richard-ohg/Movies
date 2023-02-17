//
//  ProfileProtocols.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//  
//

import Foundation

// MARK: VIEW -> PRESENTER
protocol Profile_ViewToPresenterProtocol: AnyObject {
	var view: Profile_PresenterToViewProtocol? { get set }
	var interactor: Profile_PresenterToInteractorProtocol? { get set }
	var router: Profile_PresenterToRouterProtocol? { get set }
}

// MARK: PRESENTER -> INTERACTOR
protocol Profile_PresenterToInteractorProtocol: AnyObject {
    var presenter: Profile_InteractorToPresenterProtocol? { get set }
}

// MARK: INTERACTOR -> PRESENTER
protocol Profile_InteractorToPresenterProtocol: AnyObject {
}

// MARK: PRESENTER -> VIEW
protocol Profile_PresenterToViewProtocol: AnyObject {
    var presenter: Profile_ViewToPresenterProtocol? { get set }
}

// MARK: PRESENTER -> ROUTER
protocol Profile_PresenterToRouterProtocol: AnyObject {
}
