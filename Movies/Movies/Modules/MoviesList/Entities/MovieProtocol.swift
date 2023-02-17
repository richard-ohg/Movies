//
//  MovieProtocol.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

protocol MovieProtocol: Decodable {
    var id: Int { get }
    var title: String { get }
    var overview: String { get }
    var imageUrl: String? { get }
    var votes: Double { get }
    var date: String { get }
}
