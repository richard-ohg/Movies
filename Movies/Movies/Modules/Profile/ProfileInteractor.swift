//
//  ProfileInteractor.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//  
//

import Foundation

class ProfileInteractor: Profile_PresenterToInteractorProtocol {
    weak var presenter: Profile_InteractorToPresenterProtocol?
    
    func fetchProfile() {
        guard let user = RequestManager.shared.fetchProfile() else { return }
        presenter?.setProfile(user: user)
    }
}
