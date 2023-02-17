//
//  MoviesListViewController+MoviesList_PresenterToViewProtocol.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

// MARK: - P R E S E N T E R · T O · V I E W
extension MoviesListViewController: MoviesList_PresenterToViewProtocol {
    
    func update() {
        DispatchQueue.main.async {
            self.movieListView.reload()
        }
    }
    
    func showErrorMessage(error: Error) {
        print(error.localizedDescription)
//        TODO: missing implementation
    }
}
