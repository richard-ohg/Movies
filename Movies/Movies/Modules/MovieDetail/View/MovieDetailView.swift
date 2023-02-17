//
//  MovieDetailView.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import UIKit

protocol MovieDetailViewDelegate: AnyObject {}

final class MovieDetailView: UIView {
    
    weak var delegate: (MovieDetailViewDelegate & UICollectionViewDelegate & UICollectionViewDataSource)?
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.setHeightConstraint(with: 250)
        imageView.setWidthConstraint(with: 150)
        imageView.setCornerRadius(withValue: 10)
        imageView.image = UIImage(named: Images.placeholderMovieImage)
        return imageView
    }()
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = Colors.defaultLabel
        label.numberOfLines = 0
        label.text = "Black Panther"
        return label
    }()
    
    private let categoryButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "B"
        let button = UIButton()
        button.tintColor = .gray
        button.configuration = configuration
        return button
    }()
    
    private let durationButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "125 min"
        let button = UIButton()
        button.tintColor = .red
        button.configuration = configuration
        return button
    }()
    
    private let languageButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "ESP"
        let button = UIButton()
        button.tintColor = .blue
        button.configuration = configuration
        return button
    }()
    
    private let genresButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Aventura, ciencia ficción, aventura"
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let button = UIButton()
        button.tintColor = .darkGray
        button.configuration = configuration
        return button
    }()
    
    private let scoreMovieLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.defaultMovieLabelFontSize)
        label.set(text: "5.5", leftIcon: UIImage(systemName: Images.scoreLabel)?.withTintColor(.white))
        return label
    }()
    
    private let votesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.defaultMovieLabelFontSize)
        label.text = "12455 votes"
        return label
    }()
    
    lazy var productionCompaniesCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.makeLayout())
        collection.delegate = delegate
        collection.dataSource = delegate
        collection.register(ItemMovieDetailCell.self, forCellWithReuseIdentifier: ItemMovieDetailCell.reuseIdentifier)
        collection.backgroundColor = .clear
        return collection
    }()
    
    init(delegate: MovieDetailViewDelegate & UICollectionViewDelegate & UICollectionViewDataSource) {
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
    }
    
    private func addSubviews() {
        add(subviews: movieImageView, movieTitleLabel, categoryButton, durationButton, languageButton, genresButton, scoreMovieLabel, votesCountLabel, productionCompaniesCollectionView)
    }
    
    private func addConstraints() {
        movieImageView.setConstraints(
            top: layoutMarginsGuide.topAnchor,
            leading: leadingAnchor,
            pTop: 30,
            pLeading: 20)
        
        movieTitleLabel.setConstraints(
            top: movieImageView.topAnchor,
            trailing: trailingAnchor,
            leading: movieImageView.trailingAnchor,
            pTop: 10,
            pTrailing: 20,
            pLeading: 20)
        
        categoryButton.setConstraints(
            top: movieTitleLabel.bottomAnchor,
            leading: movieImageView.trailingAnchor,
            pTop: 10,
            pLeading: 20)
        
        durationButton.setConstraints(
            leading: categoryButton.trailingAnchor,
            pLeading: 5)
        durationButton.centerYAnchor.constraint(equalTo: categoryButton.centerYAnchor).isActive = true
        
        languageButton.setConstraints(
            leading: durationButton.trailingAnchor,
            pLeading: 5)
        languageButton.centerYAnchor.constraint(equalTo: categoryButton.centerYAnchor).isActive = true
        languageButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -5).isActive = true
        
        genresButton.setConstraints(
            top: categoryButton.bottomAnchor,
            trailing: trailingAnchor,
            leading: movieImageView.trailingAnchor,
            pTop: 10,
            pTrailing: 10,
            pLeading: 10)
        
        scoreMovieLabel.setConstraints(
            top: genresButton.bottomAnchor,
            leading: movieImageView.trailingAnchor,
            pTop: 20,
            pLeading: 20)
        
        votesCountLabel.setConstraints(
            leading: scoreMovieLabel.trailingAnchor,
            pLeading: 20)
        votesCountLabel.centerYAnchor.constraint(equalTo: scoreMovieLabel.centerYAnchor).isActive = true
        
        productionCompaniesCollectionView.setConstraints(
            top: movieImageView.bottomAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            leading: leadingAnchor,
            pTop: 30,
            pTrailing: 10,
            pBottom: 20,
            pLeading: 10)
        
        
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = ViewValues.widthScreen
        layout.itemSize = CGSize(width: itemWidth, height: ViewValues.movieItemHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(
            top: .zero,
            left: ViewValues.normalCollectionPadding,
            bottom: .zero,
            right: ViewValues.normalCollectionPadding
        )
        return layout
    }
}
