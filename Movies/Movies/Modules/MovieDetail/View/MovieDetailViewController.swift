//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//  
//

import UIKit

class MovieDetailViewController: UIViewController {

    var presenter: MovieDetail_ViewToPresenterProtocol?
    
    lazy var movieDetailView = {
        return MovieDetailView(delegate: self)
    }()

    // MARK: Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = movieDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension MovieDetailViewController: MovieDetailViewDelegate {}
extension MovieDetailViewController: UICollectionViewDelegate {}
extension MovieDetailViewController: MessageDisplayable {}

extension MovieDetailViewController: MovieDetail_PresenterToViewProtocol {
    
    func update(movieDetailViewModel: DetailViewModel) {
        movieDetailView.setInfo(movie: movieDetailViewModel)
    }
    
    func showErrorMessage(error: Error) {
        presentSimpleAlert(title: AppLocalized.errorTitle, message: error.localizedDescription)
    }
}

extension MovieDetailViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        (presenter?.productionCompaniesItemsCount).orZero
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ItemMovieDetailCell.reuseIdentifier,
                for: indexPath) as? ItemMovieDetailCell,
            let productionCompanyItem = presenter?.getItem(indexPath: indexPath)
        else {
            return UICollectionViewCell()
        }
        cell.configData(itemData: productionCompanyItem)
        return cell
    }
}
