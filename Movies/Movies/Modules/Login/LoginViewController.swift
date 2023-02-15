//
//  LoginViewController.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//  
//

import UIKit

class LoginViewController: UIViewController {

    var presenter: Login_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension LoginViewController: Login_PresenterToViewProtocol {
}
