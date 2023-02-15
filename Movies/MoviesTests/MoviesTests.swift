//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import XCTest
@testable import Movies

final class MoviesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_URLBuilderWithoutExtraQueryParam() {
        let urlString = URLBuilder.get(endpoint: .popularMovies())
        let url = URL(string: urlString)
        debugPrint(urlString)
        XCTAssertNotNil(url)
    }
    
    func test_URLBuilderWithExtraQueryParam() {
        let urlString = URLBuilder.get(endpoint: .popularMovies(1))
        let url = URL(string: urlString)
        debugPrint(urlString)
        XCTAssertNotNil(url)
    }
}
