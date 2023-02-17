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

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension ProfileViewController: Profile_PresenterToViewProtocol {
}
