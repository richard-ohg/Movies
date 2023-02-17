//
//  MoviesListViewController+CollectionView.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import UIKit

extension MoviesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.itemsCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ItemMoviesListCell.reuseIdentifier,
                for: indexPath) as? ItemMoviesListCell,
            let dataItem = presenter?.getItem(indexPath: indexPath)
        else {
            return UICollectionViewCell()
        }
        cell.configData(itemData: dataItem)
        return cell
    }
}

extension MoviesListViewController: UICollectionViewDelegate {}
