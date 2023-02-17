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
    
    let mapper: Mapper = Mapper()
    private var popularMoviesViewModel: [PopularMovieViewModel] = []
    
    var itemsCount: Int {
        popularMoviesViewModel.count
    }
    
    func getItem(indexPath: IndexPath) -> PopularMovieViewModel {
        popularMoviesViewModel[indexPath.row]
    }
    
    func viewDidLoad() {
        view?.showSpinner()
        interactor?.fetchPopularMovies()
    }
    
    func logout() {
        view?.showSpinner()
        interactor?.logout()
    }
    
    func showProfile() {
        router?.goToProfile()
    }
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension MoviesListPresenter: MoviesList_InteractorToPresenterProtocol {

    func didFetch(result: PopularMovieResponseEntity) {
        popularMoviesViewModel = result.results.map(mapper.map(entity:))
        view?.update()
        DispatchQueue.main.async {
            self.view?.hideSpinner()
        }
    }
    
    func showError(error: Error) {
        DispatchQueue.main.async {
            self.view?.hideSpinner()
        }
        view?.showErrorMessage(error: error)
    }
    
    func successLogout() {
        view?.hideSpinner()
        router?.goToLogin()
    }
}
