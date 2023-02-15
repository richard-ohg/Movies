//
//  URLBuilder.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

struct URLBuilder {
    private static let baseUrl = "https://api.themoviedb.org/3"
    private static let apiKey = "af1d327389d620e0983e23be3562cc8d"
    
    static func get(endpoint: Endpoint) -> String {
        let endpointString = endpoint.getString()
        let queryParams = getFullQueryParams(queryParam: endpoint.getQueryParam())
        return buildURL(endpoint: endpointString, query: queryParams)
    }
    
    private static func getFullQueryParams(queryParam: String) -> String {
        "?api_key=\(apiKey)" + queryParam
    }
    
    private static func buildURL(endpoint: String, query: String) -> String {
        baseUrl + endpoint + query
    }
}
