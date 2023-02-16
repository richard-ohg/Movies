//
//  LoginInteractor.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//  
//

import Foundation

class LoginInteractor: Login_PresenterToInteractorProtocol {
    weak var presenter: Login_InteractorToPresenterProtocol?
    
    func login(email: String, password: String) {
        RequestManager.shared.login(
            email: email,
            password: password
        ) { [weak self] result in
            switch result {
            case .success(_):
                self?.presenter?.loginSuccess()
            case .failure(_):
                self?.presenter?.loginError()
            }
        }
    }
}
