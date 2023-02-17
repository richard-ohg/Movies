//
//  ItemMoviesListCell.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import UIKit

final class ItemMoviesListCell: UICollectionViewCell {
    // MARK: - Public properties
    
    // MARK: - Private properties
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let categoryMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wallpaper")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configUI() {
        addSubview(mainContainer)
        mainContainer.fillSuperView(widthPadding: ViewValues.normalPadding)
        
        mainContainer.addSubview(categoryMenuImageView)
        categoryMenuImageView.fillSuperView()
        
        configGradientForTitle()

        mainContainer.addSubview(titleCategoryLabel)
        titleCategoryLabel.setConstraints(
            trailing: mainContainer.trailingAnchor,
            bottom: mainContainer.bottomAnchor,
            leading: mainContainer.leadingAnchor,
            pTrailing: ViewValues.normalPadding,
            pBottom: ViewValues.normalPadding,
            pLeading: ViewValues.normalPadding
        )
    }
    
    private func configGradientForTitle() {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]
        gradientMaskLayer.locations = [0.6, 0.9]
        mainContainer.layer.addSublayer(gradientMaskLayer)
    }
    
    func configData() {
        titleCategoryLabel.text = "titulo"
        categoryMenuImageView.image = UIImage(named: "iconMovieDB")
    }
    
    // MARK: - Actions
}


// MARK: - Extensions Here
extension ItemMoviesListCell: Reusable {}
