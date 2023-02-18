//
//  DBTest.swift
//  MoviesTests
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import XCTest
@testable import Movies

final class DBTest: XCTestCase {

    func testOpenDB() {
        
        let db = DataBaseManager(nameDB: "movies")
        XCTAssertNotNil(db)
    }
}
