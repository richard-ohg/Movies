//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//  
//

import UIKit

class MoviesListViewController: UIViewController {
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segControl = UISegmentedControl(items: ViewValues.itemsSegmentedControl)
        segControl.selectedSegmentIndex = ViewValues.selectedSegmentIndexSegmentedControl
        segControl.backgroundColor = Colors.backgroundColorSegmentedControl
        segControl.selectedSegmentTintColor = Colors.selectedSegmentTintColorSegmentedControl
        segControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        return segControl
    }()

    var presenter: MoviesList_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.backgroundColorMoviesListView
        
        setupSegmentedControl()
        setupNavigation()
        
        view.add(subviews: segmentedControl)
        segmentedControl.setConstraints(
            top: view.layoutMarginsGuide.topAnchor,
            trailing: view.trailingAnchor,
            leading: view.leadingAnchor,
            pTop: ViewValues.segmentedControlPadding,
            pTrailing: ViewValues.segmentedControlPadding,
            pLeading: ViewValues.segmentedControlPadding)
    }
    
    private func setupSegmentedControl() {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    
    private func setupNavigation() {
        navigationController?.view.backgroundColor = Colors.navigationBackgroundViewColor
        setupNavigationBar()
        setupNavigationItems()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: Colors.navigationTitleColor,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: ViewValues.navigationTitleFontSize)
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    func setupNavigationItems() {
        navigationItem.title = AppLocalized.titleMoviesList
        
        let righButton = UIButton(type: .system)
        righButton.setImage(UIImage(systemName: Images.righButtonNavigationMovieList), for: .normal)
        righButton.frame = CGRect(
            x: ViewValues.righButtonFrameX,
            y: ViewValues.righButtonFrameY,
            width: ViewValues.righButtonFrameWidth,
            height: ViewValues.righButtonFrameWidth)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: righButton)
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl) {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension MoviesListViewController: MoviesList_PresenterToViewProtocol {
}
