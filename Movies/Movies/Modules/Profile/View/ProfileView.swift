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
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.titleLabelProfileFontSize)
        label.textColor = Colors.defaultLabel
        label.text = AppLocalized.profileTitleLabel
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: Images.defaultProfileImage)
        imageView.setHeightConstraint(with: ViewValues.imageProfileHeight)
        imageView.setWidthConstraint(with: ViewValues.imageProfileHeight)
        imageView.setCornerRadius(withValue: ViewValues.imageProfileHeight/2)
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: ViewValues.emailLabelProfileFontSize)
        label.textColor = Colors.defaultLabel
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
            pTop: ViewValues.titleLabelProfileTop,
            pTrailing: ViewValues.titleLabelProfileLeadingTrailing,
            pLeading: ViewValues.titleLabelProfileLeadingTrailing
        )
        
        profileImageView.setConstraints(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            pTop: ViewValues.profileImageTop,
            pLeading: ViewValues.profileImageLeading
        )
        
        emailLabel.setConstraints(
            trailing: trailingAnchor,
            leading: profileImageView.trailingAnchor,
            pTrailing: ViewValues.profileEmailLabelTrailing,
            pLeading: ViewValues.profileEmailLabeleLeading
        )
        emailLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        
        collectionView.setConstraints(
            top: profileImageView.bottomAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            leading: leadingAnchor,
            pTop: ViewValues.profileCollectionViewTop)
    }
    
    func reload() {
        collectionView.reloadData()
    }
    
    func update(user: User) {
        emailLabel.text = user.email
    }
}
