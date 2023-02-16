//
//  LoginViewController+Login_PresenterToViewProtocol.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

// MARK: - P R E S E N T E R · T O · V I E W
extension LoginViewController: Login_PresenterToViewProtocol {
    
    func showLoader() {
        showSpinner()
    }
    
    func hideLoader() {
        hideSpinner()
    }
    
    func showErrorMessage() {
        loginView.configLabel(text: AppLocalized.invalidUserErrorMessage)
    }
}
