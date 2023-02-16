//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import XCTest
@testable import Movies

final class MoviesTests: XCTestCase {

    func testBuildValidBaseURL() {
        let builder = URLBuilder()
        XCTAssertEqual(builder.scheme, "https")
        XCTAssertEqual(builder.method, Method.GET)
        XCTAssertEqual(builder.getBaseUrl()!, URL(string: "https://api.themoviedb.org/3")!)
    }
    
    func testBuildInvalidURL() {
        var builder = URLBuilder(baseUrl: "example.com")
        builder.config(path: .custom("//@3`-"))
        XCTAssertNil(builder.getBaseUrl())
    }
    
    func testBuildForceSchemeURL() {
        let builder = URLBuilder(baseUrl: "http://example.com/")
        XCTAssertEqual(builder.getBaseUrl(), URL(string: "https://example.com/3")!)
    }

    func testBuildOverrideSchemeURL() {
        var builder = URLBuilder(baseUrl: "http://example.com/")
        builder.config(scheme: "ftp")
        XCTAssertEqual(builder.getBaseUrl(), URL(string: "ftp://example.com/3")!)
    }
    
    func testBuildWithQueryParams() {
        var builder = URLBuilder()
        builder.config(path: .popularMovies(), queryParams: ["id" : 3])
        XCTAssertEqual(builder.getUrl()!, URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=af1d327389d620e0983e23be3562cc8d&id=3")!)
    }
}
