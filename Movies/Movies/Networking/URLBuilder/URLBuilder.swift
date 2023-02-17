//
//  URLBuilder.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

struct URLBuilder {
    private static let baseUrlDefault = "https://api.themoviedb.org"
    private static let apiKey = "af1d327389d620e0983e23be3562cc8d"
    static let baseUrlToGetImage = "https://image.tmdb.org/t/p/w200"
    
    let urlComponents: URLComponents?
    var scheme: String = "https"
    var method: Method = .GET
    var path: Path = .empty
    var queryParams: [String: Any] = [:]
    var body: Data?
    var headers: [String: String]?
    var contentMode: ContentMode = .jsonApp
    
    init(baseUrl: String = URLBuilder.baseUrlDefault) {
        self.urlComponents = URLComponents(string: baseUrl)
    }
    
    mutating func config(
        scheme: String = "https",
        method: Method = .GET,
        path: Path = .empty,
        queryParams: [String: Any] = [:])
    {
        self.scheme = scheme
        self.method = method
        self.path = path
        self.queryParams = queryParams
    }
    
    func getUrl() -> URL? {
        var components = self.urlComponents
        components?.scheme = scheme
        components?.path = path.getString()
        components?.queryItems = buildQuery()
        return components?.url
    }
    
    func getUrlRequest() -> URLRequest? {
        guard let url = getUrl() else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.addValue(contentMode.accept(), forHTTPHeaderField: "Accept")
        request.addValue(contentMode.contentType(), forHTTPHeaderField: "Content-Type")
        if let headers = self.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
    
    private func buildQuery() -> [URLQueryItem]? {
        var query = [URLQueryItem(name: "api_key", value: URLBuilder.apiKey)]
        
#if DEBUG
        query = []
#endif
        queryParams.forEach { (key: String, value: Any) in
            query.append(URLQueryItem(name: key, value: String(describing: value)))
        }
        return query.isEmpty ? nil : query
    }
}
