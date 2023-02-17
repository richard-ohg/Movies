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
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        collection.register(ItemMoviesListCell.self, forCellWithReuseIdentifier: ItemMoviesListCell.reuseIdentifier)
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        return collection
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
        
        view.add(subviews: segmentedControl, collectionView)
        segmentedControl.setConstraints(
            top: view.layoutMarginsGuide.topAnchor,
            trailing: view.trailingAnchor,
            leading: view.leadingAnchor,
            pTop: ViewValues.segmentedControlPadding,
            pTrailing: ViewValues.segmentedControlPadding,
            pLeading: ViewValues.segmentedControlPadding)
        
        collectionView.setConstraints(
            top: segmentedControl.bottomAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            leading: view.leadingAnchor,
            pTop: ViewValues.collectionViewTopAnchor)
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
        righButton.frame = CGRect(
            x: ViewValues.righButtonFrameX,
            y: ViewValues.righButtonFrameY,
            width: ViewValues.righButtonFrameWidth,
            height: ViewValues.righButtonFrameWidth)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: righButton)
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
        let layoutHeight = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(
            top: .zero,
            left: ViewValues.normalPadding,
            bottom: .zero,
            right: ViewValues.normalPadding
        )
        return layout
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl) {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension MoviesListViewController: MoviesList_PresenterToViewProtocol {
}

extension MoviesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemMoviesListCell.reuseIdentifier,
            for: indexPath) as? ItemMoviesListCell
        else {
            return UICollectionViewCell()
        }
        cell.configData()
        return cell
    }
}

extension MoviesListViewController: UICollectionViewDelegate {
    
}
