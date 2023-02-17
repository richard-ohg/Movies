//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//  
//

import UIKit

class MoviesListViewController: UIViewController {

    var presenter: MoviesList_ViewToPresenterProtocol?
    
    lazy var movieListView = {
        return MoviesListView(delegate: self)
    }()

    // MARK: Lifecycle
    override func loadView() {
        super.loadView()
        self.view = movieListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.backgroundColorMoviesListView
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.view.backgroundColor = Colors.navigationBackgroundViewColor
        setupNavigationBar()
        setupNavigationItems()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: Colors.navigationTitleColor,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: ViewValues.navigationTitleFontSize)
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    private func setupNavigationItems() {
        navigationItem.title = AppLocalized.titleMoviesList
        
        let righButton = UIButton(type: .system)
        righButton.setImage(UIImage(systemName: Images.righButtonNavigationMovieList), for: .normal)
        righButton.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        righButton.frame = CGRect(
            x: ViewValues.righButtonFrameX,
            y: ViewValues.righButtonFrameY,
            width: ViewValues.righButtonFrameWidth,
            height: ViewValues.righButtonFrameWidth)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: righButton)
    }
    
    @objc func showMenu() {
        let profileAction = UIAlertAction(title: AppLocalized.profileActionTitle, style: .default)
        let logoutAction = UIAlertAction(title: AppLocalized.logoutActionTitle, style: .destructive)
        let cancelAction = UIAlertAction(title: AppLocalized.cancelActionTitle, style: .cancel)
        
        presentCustomAlert(
            title: nil,
            message: AppLocalized.menuAlertMessage,
            customActions: [profileAction, logoutAction, cancelAction],
            style: .actionSheet)
    }
}

extension MoviesListViewController: MessageDisplayable {}
