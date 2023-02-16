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
    
    lazy var loginView = {
        return LoginView(delegate: self)
    }()

    // MARK: Lifecycle
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginViewController: SpinnerDisplayable {}
