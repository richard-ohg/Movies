//
//  Reusable.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

protocol Reusable {}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self) }
}
