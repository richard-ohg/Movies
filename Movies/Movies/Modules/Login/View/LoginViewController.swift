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

extension LoginViewController: SpinnerDisplayable {}
