//
//  MoviesListView.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import UIKit

protocol MoviesListViewDelegate: AnyObject {
    
}

final class MoviesListView: UIView {
    
    weak var delegate: (MoviesListViewDelegate & UICollectionViewDelegate & UICollectionViewDataSource)?
    
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
        collection.delegate = delegate
        collection.dataSource = delegate
        return collection
    }()
    
    init(delegate: MoviesListViewDelegate & UICollectionViewDelegate & UICollectionViewDataSource) {
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        addConstraints()
        setupSegmentedControl()
    }
    
    private func addSubviews() {
        add(subviews: segmentedControl, collectionView)
    }
    
    private func addConstraints() {
        segmentedControl.setConstraints(
            top: layoutMarginsGuide.topAnchor,
            trailing: trailingAnchor,
            leading: leadingAnchor,
            pTop: ViewValues.segmentedControlPadding,
            pTrailing: ViewValues.segmentedControlPadding,
            pLeading: ViewValues.segmentedControlPadding)
        
        collectionView.setConstraints(
            top: segmentedControl.bottomAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            leading: leadingAnchor,
            pTop: ViewValues.collectionViewTopAnchor)
    }
    
    private func setupSegmentedControl() {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = (ViewValues.widthScreen - ViewValues.doubleCollectionPadding) / ViewValues.multiplierTwo
        layout.itemSize = CGSize(width: itemWidth, height: ViewValues.movieItemHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(
            top: .zero,
            left: ViewValues.normalCollectionPadding,
            bottom: .zero,
            right: ViewValues.normalCollectionPadding
        )
        return layout
    }
    
    func reload() {
        collectionView.reloadData()
    }
    
    @objc func segmentedValueChanged(_ sender: UISegmentedControl) {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    }
}
