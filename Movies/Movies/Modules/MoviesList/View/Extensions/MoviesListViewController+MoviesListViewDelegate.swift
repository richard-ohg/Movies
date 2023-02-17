//
//  MoviesListViewController+MoviesListViewDelegate.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

extension MoviesListViewController: MoviesListViewDelegate {
    
    func segmentedValueChanged(newValue: Int) {
        presenter?.segmentedValueChanged(section: newValue)
    }
}
