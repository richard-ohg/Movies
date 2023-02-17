//
//  MoviesListView.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import UIKit

protocol MoviesListViewDelegate: AnyObject {
    func segmentedValueChanged(newValue: Int)
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
    
    private lazy var collectionView: MoviesCollectionView = {
        let collection = MoviesCollectionView()
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
        backgroundColor = Colors.backgroundDefaultColor
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
    
    func reload() {
        collectionView.reloadData()
    }
    
    @objc func segmentedValueChanged(_ sender: UISegmentedControl) {
        delegate?.segmentedValueChanged(newValue: sender.selectedSegmentIndex)
    }
}
