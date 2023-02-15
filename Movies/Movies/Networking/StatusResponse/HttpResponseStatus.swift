//
//  HttpResponseStatus.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

enum HttpResponseStatus {
    static let ok = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}
