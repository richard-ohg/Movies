//
//  AuthenticationFirebaseService.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import FirebaseAuth

struct AuthenticationFirebaseService: AuthenticationFirebaseServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            let email = (authResult?.user.email).orEmpty
            completion(.success(.init(email: email)))
        }
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else { return nil }
        return .init(email: email)
    }
}

