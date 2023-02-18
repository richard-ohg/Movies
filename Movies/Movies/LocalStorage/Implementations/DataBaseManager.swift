//
//  DataBaseManager.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import Foundation
import SQLite3

class DataBaseManager: DataBaseManagerProtocol {
    
    var db: SQLiteDatabase?
    
    func openDB(nameDB: String) {
        do {
            let path = try getPath(nameDB: nameDB)
            db = try SQLiteDatabase.open(path: path)
            print("Successfully opened connection to database.")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createTable(object: SQLTable.Type) {
        do {
            try db?.createTable(table: object.self)
        } catch {
            print(db?.errorMessage)
        }
    }
    
    private func getPath(nameDB: String) throws -> String {
        let directory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return directory.appendingPathComponent("\(nameDB).sqlite").relativePath
    }
}
