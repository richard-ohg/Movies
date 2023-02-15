//
//  ApiClientServiceProtocol.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

protocol ApiClientServiceProtocol {
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}
