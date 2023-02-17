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
    
    lazy var profileView = {
        return ProfileView(delegate: self)
    }()

    // MARK: Lifecycle
    override func loadView() {
        super.loadView()
        self.view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension ProfileViewController: Profile_PresenterToViewProtocol {
    
    func setProfile(user: User) {
        profileView.update(user: user)
    }
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
        
        cell.configData(itemData: .test)
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
extension ProfileViewController: ProfileViewDelegate { }
