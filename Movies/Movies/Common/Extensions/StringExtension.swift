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
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}

extension String? {
    var orEmpty: String {
        self ?? ""
    }
    
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}
