//
//  RequestManager.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

class RequestManager {
    private let apiClient: ApiClientServiceProtocol
    private let authFirebaseClient: AuthenticationFirebaseServiceProtocol
    static let shared: RequestManager = RequestManager()
    
    private init(
        apiClient: ApiClientServiceProtocol = ApiClientService(),
        authFirebaseClient: AuthenticationFirebaseServiceProtocol = AuthenticationFirebaseService())
    {
        self.apiClient = apiClient
        self.authFirebaseClient = authFirebaseClient
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        authFirebaseClient.login(email: email, password: password, completion: completion)
    }
    
    func logout() throws {
        try authFirebaseClient.logout()
    }
    
    func fetchProfile() -> User? {
        authFirebaseClient.getCurrentUser()
    }
    
    func fetchPopularMovies(withPage page: Int = 1) async -> Result<GenericMovieResponseEntity<GenericMovieEntity>, Error> {
        do {
            var builder = URLBuilder()
            builder.config(path: .popularMovies, queryParams: ["page" : page])
            let apiClientResult = try await apiClient.request(url: builder.getUrl(), type: GenericMovieResponseEntity<GenericMovieEntity>.self)
            return .success(apiClientResult)
        } catch {
            return .failure(error)
        }
    }
    
    func fetchTopRatedMovies(withPage page: Int = 1) async -> Result<GenericMovieResponseEntity<GenericMovieEntity>, Error> {
        do {
            var builder = URLBuilder()
            builder.config(path: .topRated, queryParams: ["page" : page])
            let apiClientResult = try await apiClient.request(url: builder.getUrl(), type: GenericMovieResponseEntity<GenericMovieEntity>.self)
            return .success(apiClientResult)
        } catch {
            return .failure(error)
        }
    }
    
    func fetchMoviesOnTV(withPage page: Int = 1) async -> Result<GenericMovieResponseEntity<GenericTVMoviesEntity>, Error> {
        do {
            var builder = URLBuilder()
            builder.config(path: .onTV, queryParams: ["page" : page])
            let apiClientResult = try await apiClient.request(url: builder.getUrl(), type: GenericMovieResponseEntity<GenericTVMoviesEntity>.self)
            return .success(apiClientResult)
        } catch {
            return .failure(error)
        }
    }
    
    func fetchMovieDetail(with id: Int) async -> Result<MovieDetailResponseEntity, Error> {
        do {
            var builder = URLBuilder()
            builder.config(path: .movieDetail(id))
            let apiClientResult = try await apiClient.request(url: builder.getUrl(), type: MovieDetailResponseEntity.self)
            return .success(apiClientResult)
        } catch {
            return .failure(error)
        }
    }
}
