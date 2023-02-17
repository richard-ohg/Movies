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
    
    func viewDidLoad()
}

// MARK: PRESENTER -> INTERACTOR
protocol Profile_PresenterToInteractorProtocol: AnyObject {
    var presenter: Profile_InteractorToPresenterProtocol? { get set }
    
    func fetchProfile()
    func fetchFavoriteMovies()
}

// MARK: INTERACTOR -> PRESENTER
protocol Profile_InteractorToPresenterProtocol: AnyObject {
    
    func setProfile(user: User)
}

// MARK: PRESENTER -> VIEW
protocol Profile_PresenterToViewProtocol: AnyObject {
    var presenter: Profile_ViewToPresenterProtocol? { get set }
    
    func setProfile(user: User)
}

// MARK: PRESENTER -> ROUTER
protocol Profile_PresenterToRouterProtocol: AnyObject {
}
