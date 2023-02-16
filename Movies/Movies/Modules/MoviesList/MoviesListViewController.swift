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
        let segControl = UISegmentedControl(items: ["Popular", "Top Rated", "On TV", "Airing Today"])
        segControl.selectedSegmentIndex = 0
        segControl.backgroundColor = UIColor.getColorWith(hex: "#192026")
        segControl.selectedSegmentTintColor = UIColor.getColorWith(hex: "#636366")
        segControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        return segControl
    }()

    var presenter: MoviesList_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.getColorWith(hex: "#0c151a")
        setupUI()
    }
    
    private func setupUI() {
        setupSegmentedControl()
        setupNavigation()
        view.add(subviews: segmentedControl)
        segmentedControl.setConstraints(top: view.layoutMarginsGuide.topAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, pTop: 20, pTrailing: 20, pLeading: 20)
    }
    
    private func setupSegmentedControl() {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    
    private func setupNavigation() {
        navigationController?.view.backgroundColor = UIColor.getColorWith(hex: "#30373a")
        setupNavigationBar()
        setupNavigationItems()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    func setupNavigationItems() {
        navigationItem.title = "TV Shows"
        
        let righButton = UIButton(type: .system)
        righButton.setImage(UIImage(systemName: "line.3.horizontal.circle.fill"), for: .normal)
        righButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: righButton)
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl) {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension MoviesListViewController: MoviesList_PresenterToViewProtocol {
}
