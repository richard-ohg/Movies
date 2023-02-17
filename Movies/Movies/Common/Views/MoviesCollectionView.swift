//
//  MoviesCollectionView.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import UIKit

class MoviesCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
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
        super.init(frame: .zero, collectionViewLayout: layout)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        register(ItemMoviesListCell.self, forCellWithReuseIdentifier: ItemMoviesListCell.reuseIdentifier)
        register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
        backgroundColor = .clear
    }
}
