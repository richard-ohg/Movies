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
    
    let mapper: MovieDetailMapper = MovieDetailMapper()
    private var movieDetailViewModel: MovieDetailViewModel = .empty
    private let movieId: Int
    
    var productionCompaniesItemsCount: Int {
        movieDetailViewModel.productionCompanies.count
    }
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func getItem(indexPath: IndexPath) -> ProductionCompany {
        movieDetailViewModel.productionCompanies[indexPath.row]
    }
    
    func viewDidLoad() {
        view?.showSpinner()
        interactor?.fetchMovieDetail(with: movieId)
    }
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension MovieDetailPresenter: MovieDetail_InteractorToPresenterProtocol {
    
    func didFetchMovieDetail(entity: MovieDetailResponseEntity) {
        movieDetailViewModel = mapper.map(entity: entity)
        DispatchQueue.main.async {
            self.view?.update(movieDetailViewModel: self.movieDetailViewModel)
            self.view?.hideSpinner()
        }
    }
    
    func showError(error: Error) {
        DispatchQueue.main.async {
            self.view?.hideSpinner()
        }
        view?.showErrorMessage(error: error)
    }
}
