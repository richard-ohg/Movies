//
//  ExtensionsTest.swift
//  MoviesTests
//
//  Created by Ricardo Omar Hernández on 16/02/23.
//

import XCTest
@testable import Movies

final class ExtensionsTest: XCTestCase {

    func testStringExtensionIsNotEmpty() {
        let string1 = ""
        let string2 = "Hola"
        XCTAssertFalse(string1.isNotEmpty)
        XCTAssertTrue(string2.isNotEmpty)
    }
    
    func testTransformDate() {
        let oldDate = "2016-08-03"
        let newDate = oldDate.transformDate(fromFormat: "yyyy-MM-dd", toFormat: "MMM dd, yyyy")
        XCTAssertEqual(newDate, "ago 03, 2016")
    }
}
