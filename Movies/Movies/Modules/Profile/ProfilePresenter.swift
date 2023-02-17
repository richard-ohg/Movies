//
//  ProfilePresenter.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//  
//

import Foundation

class ProfilePresenter: Profile_ViewToPresenterProtocol {
    
    weak var view: Profile_PresenterToViewProtocol?
    var interactor: Profile_PresenterToInteractorProtocol?
    var router: Profile_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension ProfilePresenter: Profile_InteractorToPresenterProtocol {

}
