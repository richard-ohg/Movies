//
//  Language.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

enum Language: String {
    case es
    case en
    case fr
    case unknown
    
    func getLanguage() -> String {
        switch self {
        case .es:
            return "ESP"
        case .en:
            return "ENG"
        case .fr:
            return "FRA"
        case .unknown:
            return "IDK"
        }
    }
}
