//
//  IntExtension.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

extension Int {
    func toString() -> String {
        String(format: "%d", self)
    }
}

extension Int? {
    var orZero: Int {
        self ?? 0
    }
}
