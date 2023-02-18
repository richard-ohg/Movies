//
//  DBTest.swift
//  MoviesTests
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import XCTest
@testable import Movies

final class DBTest: XCTestCase {
    
    var dbManager: DataBaseManager!
    
    override func setUpWithError() throws {
        dbManager = DataBaseManager()
    }
    
    override func tearDownWithError() throws {
        dbManager = nil
    }

    func testOpenDB() {
        dbManager.openDB(nameDB: "movies")
        XCTAssertNotNil(dbManager.db)
    }
    
    func testCreateTable() {
        
    }
}
