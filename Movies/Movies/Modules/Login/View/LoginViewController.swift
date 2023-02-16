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
    override func loadView() {
        super.loadView()
        self.view = LoginView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension LoginViewController: Login_PresenterToViewProtocol {
}

extension LoginViewController: LoginViewDelegate {
    func buttonPressed() {
        print("login")
    }
}
