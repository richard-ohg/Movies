//
//  MoviesListPresenter.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//  
//

import Foundation

class MoviesListPresenter: MoviesList_ViewToPresenterProtocol {
    
    weak var view: MoviesList_PresenterToViewProtocol?
    var interactor: MoviesList_PresenterToInteractorProtocol?
    var router: MoviesList_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension MoviesListPresenter: MoviesList_InteractorToPresenterProtocol {

}
