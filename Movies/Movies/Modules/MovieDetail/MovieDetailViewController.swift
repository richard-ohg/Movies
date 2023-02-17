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

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        presenter?.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension MovieDetailViewController: MovieDetail_PresenterToViewProtocol {
}
