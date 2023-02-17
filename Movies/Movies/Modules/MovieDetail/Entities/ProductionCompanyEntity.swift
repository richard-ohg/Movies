//
//  ProductionCompanyEntity.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

struct ProductionCompanyEntity: Decodable {
    let id: Int
    let companyName: String
    let imageUrl: String?
    let origin: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case companyName = "name"
        case imageUrl = "logo_path"
        case origin = "origin_country"
    }
}
