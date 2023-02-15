//
//  StringExtension.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

extension String {
    static var empty: String {
        return String()
    }
}

extension String? {
    var orEmpty: String {
        self ?? ""
    }
}
