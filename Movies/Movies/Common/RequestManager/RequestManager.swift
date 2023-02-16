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
    
    func fetchPopularMovies(withPage page: Int = 1) async -> Result<PopularMovieResponseEntity, Error> {
        do {
            var builder = URLBuilder()
            builder.config(path: .popularMovies, queryParams: ["page" : page])
            let apiClientResult = try await apiClient.request(url: builder.getUrl(), type: PopularMovieResponseEntity.self)
            return .success(apiClientResult)
        } catch {
            return .failure(error)
        }
    }
}
