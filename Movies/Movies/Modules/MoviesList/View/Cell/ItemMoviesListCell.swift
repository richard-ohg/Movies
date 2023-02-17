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
        view.backgroundColor = Colors.backgroundMovieContainerCell
        view.setCornerRadius(withValue: ViewValues.containerCornerRadius)
        return view
    }()
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setHeightConstraint(with: ViewValues.movieImageHeight)
        imageView.contentMode = .scaleAspectFill
        imageView.setCornerRadius(withValue: ViewValues.containerCornerRadius)
        return imageView
    }()
    
    private let titleImageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.defaultLabelOfMovies
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.defaultMovieLabelFontSize)
        return label
    }()
    
    private let dateMovieLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.defaultLabelOfMovies
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.defaultMovieLabelFontSize)
        return label
    }()
    
    private let scoreMovieLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.defaultLabelOfMovies
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.defaultMovieLabelFontSize)
        return label
    }()
    
    private let descriptionMovieLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.descriptionLabelOfMovies
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: ViewValues.descriptionMovieLabelFontSize)
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
        add(subviews: mainContainer)
        
        mainContainer.fillSuperView(widthPadding: ViewValues.normalCollectionPadding)
        mainContainer.add(subviews: movieImageView,
                          titleImageLabel,
                          dateMovieLabel,
                          scoreMovieLabel,
                          descriptionMovieLabel)
        
        movieImageView.setConstraints(
            top: mainContainer.topAnchor,
            trailing: mainContainer.trailingAnchor,
            leading: mainContainer.leadingAnchor
        )
            
        titleImageLabel.setConstraints(
            top: movieImageView.bottomAnchor,
            trailing: mainContainer.trailingAnchor,
            leading: mainContainer.leadingAnchor,
            pTop: ViewValues.titleImageLabelPadding,
            pTrailing: ViewValues.titleImageLabelPadding,
            pLeading: ViewValues.titleImageLabelPadding
        )
        
        dateMovieLabel.setConstraints(
            top: titleImageLabel.bottomAnchor,
            leading: mainContainer.leadingAnchor,
            pTop: ViewValues.dateMovieLabelTop,
            pLeading: ViewValues.dateMovieLabelLeading
        )
        
        scoreMovieLabel.setConstraints(
            trailing: mainContainer.trailingAnchor,
            pTrailing: ViewValues.scoreMovieLabelTrailing
        )
        
        scoreMovieLabel.centerYAnchor.constraint(equalTo: dateMovieLabel.centerYAnchor).isActive = true
        scoreMovieLabel.leadingAnchor.constraint(
            greaterThanOrEqualTo: dateMovieLabel.trailingAnchor,
            constant: ViewValues.scoreMovieLabelLeading
        ).isActive = true
        
        descriptionMovieLabel.setConstraints(
            top: dateMovieLabel.bottomAnchor,
            trailing: mainContainer.trailingAnchor,
            bottom: mainContainer.bottomAnchor,
            leading: mainContainer.leadingAnchor,
            pTop: ViewValues.descriptionMovieLabelTopBottom,
            pTrailing: ViewValues.descriptionMovieLabelLeadingTrailing,
            pBottom: ViewValues.descriptionMovieLabelTopBottom,
            pLeading: ViewValues.descriptionMovieLabelLeadingTrailing
        )
    }
    
    func configData() {
        movieImageView.image = UIImage(named: "iconMovieDB")
        titleImageLabel.text = "titulo pelicula"
        dateMovieLabel.text = "25 Junio 2019"
        setScore(score: "5.5")
        descriptionMovieLabel.text = "habia uwrsladhlfhaekHFJKLHKLDSH<,MZHXJ,HFJKScd<nzkjsd<zvghjc,b,sd<hmzbxfv,cmj< absd<kzx,hvb<kjasd<bj jdsbjhzkj, ewkuGADJKHFJKds jaGHJSKDHFJKWEba jkhdakjhjskhjkd bjskdGKCHGJKbnjkn jk<aedhcueSNCKLD"
    }
    
    private func setScore(score: String) {
        scoreMovieLabel.set(text: score, leftIcon: UIImage(systemName: Images.scoreLabel)?.withTintColor(Colors.defaultLabelOfMovies))
    }
    
}

// MARK: - Extensions Here
extension ItemMoviesListCell: Reusable {}
