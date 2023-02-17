//
//  DoubleExtension.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import Foundation

extension Double {
    func toString() -> String {
        String(format: "%.1f", self)
    }
}
