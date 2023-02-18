//
//  SQLTable.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation

protocol SQLTable {
    static var createStatement: String { get }
}
