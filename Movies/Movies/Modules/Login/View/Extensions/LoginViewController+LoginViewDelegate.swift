//
//  LoginViewController+LoginViewDelegate.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

extension LoginViewController: LoginViewDelegate {
    func buttonPressed(email: String, password: String) {
        presenter?.login(email: email, password: password)
    }
}

