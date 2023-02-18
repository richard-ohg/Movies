//
//  MovieDetailView.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import UIKit
import Kingfisher

protocol MovieDetailViewDelegate: AnyObject {}

final class MovieDetailView: UIView {
    
    weak var delegate: (MovieDetailViewDelegate & UICollectionViewDelegate & UICollectionViewDataSource)?
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.setHeightConstraint(with: ViewValues.movieDetailImageHeight)
        imageView.setWidthConstraint(with: ViewValues.movieDetailImageWidth)
        imageView.setCornerRadius(withValue: ViewValues.movieDetailImageCornerRadius)
        imageView.image = UIImage(named: Images.placeholderMovieImage)
        return imageView
    }()
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewValues.movieDetailTitleFontSize, weight: .heavy)
        label.textColor = Colors.defaultLabel
        label.numberOfLines = 0
        return label
    }()
    
    private let categoryButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        let button = UIButton()
        button.tintColor = .gray
        button.configuration = configuration
        return button
    }()
    
    private let durationButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        let button = UIButton()
        button.tintColor = .red
        button.configuration = configuration
        return button
    }()
    
    private let languageButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        let button = UIButton()
        button.tintColor = .blue
        button.configuration = configuration
        return button
    }()
    
    private let genresButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        let button = UIButton()
        button.tintColor = .darkGray
        button.configuration = configuration
        return button
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.defaultMovieLabelFontSize)
        label.textAlignment = .center
        return label
    }()
    
    private let scoreMovieLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.defaultMovieLabelFontSize)
        return label
    }()
    
    private let votesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.defaultMovieLabelFontSize)
        return label
    }()
    
    private let collectionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.defaultLabel
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.movieDetailCollectionTitleFontSize)
        label.text = AppLocalized.headerMovieDetailSectionTitle
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
        add(subviews:
            movieImageView,
            movieTitleLabel,
            categoryButton,
            durationButton,
            languageButton,
            genresButton,
            dateLabel,
            scoreMovieLabel,
            votesCountLabel,
            collectionTitleLabel,
            productionCompaniesCollectionView)
    }
    
    private func addConstraints() {
        movieImageView.setConstraints(
            top: layoutMarginsGuide.topAnchor,
            leading: leadingAnchor,
            pTop: ViewValues.movieDetailImageViewTop,
            pLeading: ViewValues.movieDetailImageViewLeading)
        
        movieTitleLabel.setConstraints(
            top: movieImageView.topAnchor,
            trailing: trailingAnchor,
            leading: movieImageView.trailingAnchor,
            pTop: ViewValues.movieDetailTitleLabelTop,
            pTrailing: ViewValues.movieDetailTitleLabelTrailingLeading,
            pLeading: ViewValues.movieDetailTitleLabelTrailingLeading)
        
        categoryButton.setConstraints(
            top: movieTitleLabel.bottomAnchor,
            leading: movieImageView.trailingAnchor,
            pTop: ViewValues.categoryButtonTop,
            pLeading: ViewValues.categoryButtonLeading)
        
        durationButton.setConstraints(
            leading: categoryButton.trailingAnchor,
            pLeading: ViewValues.durationButtonLeading)
        durationButton.centerYAnchor.constraint(equalTo: categoryButton.centerYAnchor).isActive = true
        
        languageButton.setConstraints(
            leading: durationButton.trailingAnchor,
            pLeading: ViewValues.languageButtonLeading)
        languageButton.centerYAnchor.constraint(equalTo: categoryButton.centerYAnchor).isActive = true
        languageButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: ViewValues.languageButtonTrailing).isActive = true
        
        genresButton.setConstraints(
            top: categoryButton.bottomAnchor,
            trailing: trailingAnchor,
            leading: movieImageView.trailingAnchor,
            pTop: ViewValues.genresButtonTop,
            pTrailing: ViewValues.genresButtonTrailingLeading,
            pLeading: ViewValues.genresButtonTrailingLeading)
        
        dateLabel.setConstraints(
            top: genresButton.bottomAnchor,
            trailing: trailingAnchor,
            leading: movieImageView.trailingAnchor,
            pTop: ViewValues.dateLabelTop,
            pTrailing: ViewValues.dateLabelTrailingLeading,
            pLeading: ViewValues.dateLabelTrailingLeading)
        
        scoreMovieLabel.setConstraints(
            top: dateLabel.bottomAnchor,
            leading: movieImageView.trailingAnchor,
            pTop: ViewValues.scoreMovieDetailLabelTop,
            pLeading: ViewValues.scoreMoviedetailLabelLeading)
        
        votesCountLabel.setConstraints(
            leading: scoreMovieLabel.trailingAnchor,
            pLeading: ViewValues.votesCountLabelLeading)
        votesCountLabel.centerYAnchor.constraint(equalTo: scoreMovieLabel.centerYAnchor).isActive = true
        
        collectionTitleLabel.setConstraints(
            top: movieImageView.bottomAnchor,
            leading: leadingAnchor,
            pTop: ViewValues.collectionTitleDetailLabelTop,
            pLeading: ViewValues.collectionTitleDetailLabelLeading)
        
        productionCompaniesCollectionView.setConstraints(
            top: collectionTitleLabel.bottomAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            leading: leadingAnchor,
            pTrailing: ViewValues.productionCompaniesCollectionViewTrailing,
            pBottom: ViewValues.productionCompaniesCollectionViewBottom,
            pLeading: ViewValues.productionCompaniesCollectionViewLeading)
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = ViewValues.widthScreen
        layout.itemSize = CGSize(width: itemWidth, height: ViewValues.movieDetailItemHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.scrollDirection = .horizontal
        return layout
    }
    
    func setInfo(movie: DetailViewModel) {
        movieImageView.kf.setImage(
            with: movie.imageUrl,
            placeholder: UIImage(named: Images.placeholderMovieImage)
        )
        
        movieTitleLabel.text = movie.title
        categoryButton.setTitle(movie.category.rawValue, for: .normal)
        durationButton.setTitle(movie.runningTime, for: .normal)
        languageButton.setTitle(movie.laguage.getLanguage(), for: .normal)
        genresButton.setTitle(movie.genres, for: .normal)
        dateLabel.text = movie.date
        scoreMovieLabel.set(text: movie.score, leftIcon: UIImage(systemName: Images.scoreLabel)?.withTintColor(.white))
        votesCountLabel.text = movie.numberOfVotes
        productionCompaniesCollectionView.reloadData()
        
        productionCompaniesCollectionView.isHidden = movie.productionCompanies.isEmpty
        collectionTitleLabel.isHidden = movie.productionCompanies.isEmpty
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.productionCompaniesCollectionView.reloadData()
        }
    }
}
