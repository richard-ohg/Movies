//
//  AuthenticationFirebaseServiceProtocol.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

protocol AuthenticationFirebaseServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}
