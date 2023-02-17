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
    var lastSelectedSegmentedIndex: Int = 0
    private var moviesContainer: MoviesContainer = MoviesContainer()
    
    func getItemsCount() -> Int {
        guard let section = SegmentedSection(rawValue: lastSelectedSegmentedIndex)
        else { return 0 }
        
        switch section {
        case .popularMovies:
            return moviesContainer.popularMoviesViewModel.count
        case .topRated:
            return 1
        case .onTV:
            return 1
        case .airing:
            return 1
        }
    }
    
    func getItem(indexPath: IndexPath) -> MovieViewModel {
        guard let section = SegmentedSection(rawValue: lastSelectedSegmentedIndex)
        else { return .empty }
        
        switch section {
        case .popularMovies:
            return moviesContainer.popularMoviesViewModel[indexPath.row]
        case .topRated:
            break
        case .onTV:
            break
        case .airing:
            break
        }
        return moviesContainer.popularMoviesViewModel[indexPath.row]
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
    
    func didSelectItem(with indexPath: IndexPath) {
        guard let section = SegmentedSection(rawValue: lastSelectedSegmentedIndex)
        else { return }
        
        var movieId: Int = 0
        
        switch section {
        case .popularMovies:
            movieId = moviesContainer.popularMoviesViewModel[indexPath.row].id
        case .topRated:
            break
        case .onTV:
            break
        case .airing:
            break
        }
        
        router?.goToMovieDetail(with: movieId)
    }
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension MoviesListPresenter: MoviesList_InteractorToPresenterProtocol {

    func didFetchPopularMovies(result: GenericMovieResponseEntity<GenericMovieEntity>) {
        moviesContainer.popularMoviesViewModel = result.results.map(mapper.map(entity:))
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
