//
//  MovieDetailPresenter.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//  
//

import Foundation

class MovieDetailPresenter: MovieDetail_ViewToPresenterProtocol {
    
    weak var view: MovieDetail_PresenterToViewProtocol?
    var interactor: MovieDetail_PresenterToInteractorProtocol?
    var router: MovieDetail_PresenterToRouterProtocol?
    
    func fetchMovieDetail(with id: Int) {
        interactor?.fetchMovieDetail(with: id)
    }
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension MovieDetailPresenter: MovieDetail_InteractorToPresenterProtocol {

}
