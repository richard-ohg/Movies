//
//  ProfileViewController.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//  
//

import UIKit

class ProfileViewController: UIViewController {

    var presenter: Profile_ViewToPresenterProtocol?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = Colors.defaultLabel
        label.text = "Profile"
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "avatar")
        imageView.setHeightConstraint(with: 150)
        imageView.setWidthConstraint(with: 150)
        imageView.setCornerRadius(withValue: 75)
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.defaultLabel
        label.text = "ricardo@gmail.com"
        return label
    }()
    
    private lazy var collectionView: MoviesCollectionView = {
        let collection = MoviesCollectionView()
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = Colors.backgroundDefaultColor
        view.add(subviews: titleLabel, profileImageView, emailLabel, collectionView)
        
        titleLabel.setConstraints(
            top: view.layoutMarginsGuide.topAnchor,
            trailing: view.trailingAnchor,
            leading: view.leadingAnchor,
            pTop: 30,
            pTrailing: 20,
            pLeading: 20
        )
        
        profileImageView.setConstraints(
            top: titleLabel.bottomAnchor,
            leading: view.leadingAnchor,
            pTop: 40,
            pLeading: 30
        )
        
        emailLabel.setConstraints(
            trailing: view.trailingAnchor,
            leading: profileImageView.trailingAnchor,
            pTrailing: 10,
            pLeading: 30
        )
        emailLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        
        collectionView.setConstraints(
            top: profileImageView.bottomAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            leading: view.leadingAnchor,
            pTop: 40)
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension ProfileViewController: Profile_PresenterToViewProtocol {
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ItemMoviesListCell.reuseIdentifier,
                for: indexPath) as? ItemMoviesListCell
        else {
            return UICollectionViewCell()
        }
        
        cell.configData(itemData: MovieViewModel(imageUrl: URL(string: ""), title: "Pelicula", date: "Ago 27, 2016", score: "5.5", description: "hjahsiodhaiouehuiohshfjahjfhksajhjhfj"))
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard
            kind == UICollectionView.elementKindSectionHeader,
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader
        else {
            return UICollectionReusableView()
        }
        
        sectionHeader.config(
            text: AppLocalized.headerSectionTitle,
            textColor: Colors.defaultLabel)
        return sectionHeader
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}

extension ProfileViewController: UICollectionViewDelegate { }
