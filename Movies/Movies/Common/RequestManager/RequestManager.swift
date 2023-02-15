//
//  RequestManager.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

class RequestManager {
    private let apiClient: ApiClientService = ApiClientService()
    static let shared: RequestManager = RequestManager()
    
    private init() {}
    
    func fetchPopularMovies(withPage page: Int? = nil) async -> Result<PopularMovieResponseEntity, Error> {
        do {
            let urlString = URLBuilder.get(endpoint: .popularMovies(page))
            let url = URL(string: urlString)
            let repositoryResult = try await apiClient.request(url: url, type: PopularMovieResponseEntity.self)
            return .success(repositoryResult)
        } catch {
            return .failure(error)
        }
    }
}
