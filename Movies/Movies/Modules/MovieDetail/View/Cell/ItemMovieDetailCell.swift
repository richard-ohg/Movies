//
//  ItemMovieDetailCell.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import UIKit
import Kingfisher

final class ItemMovieDetailCell: UICollectionViewCell {

    // MARK: - Private properties
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.setCornerRadius(withValue: ViewValues.containerCornerRadius)
        return view
    }()
    
    private let categoryMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
        mainContainer.fillSuperView(widthPadding: ViewValues.normalCollectionPadding)
        
        mainContainer.addSubview(categoryMenuImageView)
        categoryMenuImageView.fillSuperView()
        
        configGradientForTitle()

        mainContainer.addSubview(titleCategoryLabel)
        
        titleCategoryLabel.setConstraints(
            trailing: mainContainer.trailingAnchor,
            bottom: mainContainer.bottomAnchor,
            leading: mainContainer.leadingAnchor,
            pTrailing: ViewValues.normalCollectionPadding,
            pBottom: ViewValues.normalCollectionPadding,
            pLeading: ViewValues.normalCollectionPadding
        )
    }
    
    private func configGradientForTitle() {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]
        gradientMaskLayer.locations = [ViewValues.gradientTitleInit, ViewValues.gradientTitleEnd]
        mainContainer.layer.addSublayer(gradientMaskLayer)
    }
    
    func configData(itemData: ProductionCompany) {
        titleCategoryLabel.text = itemData.name
        categoryMenuImageView.kf.setImage(
            with: itemData.imageUrl,
            placeholder: UIImage(named: Images.placeholderMovieImage)
        )
    }
}


// MARK: - Extensions Here
extension ItemMovieDetailCell: Reusable {}
