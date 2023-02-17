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
    
    func transformDate(fromFormat: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es")
        dateFormatter.dateFormat = fromFormat
        guard let date = dateFormatter.date(from: self) else { return .empty }
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: date)
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
