//
//  ContentMode.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

enum ContentMode {
    case jsonApp

    func accept() -> String {
        switch self {
        case .jsonApp:
            return "application/json"
        }
    }

    func contentType() -> String {
        switch self {
        case .jsonApp:
            return "application/json"
        }
    }
}
