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
        XCTAssertFalse(string1.notIsEmpty)
        XCTAssertTrue(string2.notIsEmpty)
    }
}
