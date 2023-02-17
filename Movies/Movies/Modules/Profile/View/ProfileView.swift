//
//  ProfileView.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {}

final class ProfileView: UIView {
    
    weak var delegate: (ProfileViewDelegate & UICollectionViewDelegate & UICollectionViewDataSource)?
    
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
        collection.delegate = delegate
        collection.dataSource = delegate
        return collection
    }()
    
    init(delegate: ProfileViewDelegate & UICollectionViewDelegate & UICollectionViewDataSource) {
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
        collectionView.isHidden = true
    }
    
    private func addSubviews() {
        add(subviews: titleLabel, profileImageView, emailLabel, collectionView)
    }
    
    private func addConstraints() {
        titleLabel.setConstraints(
            top: layoutMarginsGuide.topAnchor,
            trailing: trailingAnchor,
            leading: leadingAnchor,
            pTop: 30,
            pTrailing: 20,
            pLeading: 20
        )
        
        profileImageView.setConstraints(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            pTop: 40,
            pLeading: 30
        )
        
        emailLabel.setConstraints(
            trailing: trailingAnchor,
            leading: profileImageView.trailingAnchor,
            pTrailing: 10,
            pLeading: 30
        )
        emailLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        
        collectionView.setConstraints(
            top: profileImageView.bottomAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            leading: leadingAnchor,
            pTop: 40)
    }
    
    func reload() {
        collectionView.reloadData()
    }
}
