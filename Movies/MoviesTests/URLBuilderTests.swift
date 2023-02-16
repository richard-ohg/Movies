//
//  URLBuilderTests.swift
//  MoviesTests
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import XCTest
import FirebaseAuth
@testable import Movies

final class URLBuilderTests: XCTestCase {

    func testBuildValidBaseURL() {
        let builder = URLBuilder()
        XCTAssertEqual(builder.scheme, "https")
        XCTAssertEqual(builder.method, Method.GET)
        XCTAssertEqual(builder.getUrl(), URL(string: "https://api.themoviedb.org/3"))
    }
    
    func testBuildInvalidURL() {
        var builder = URLBuilder(baseUrl: "example.com")
        builder.config(path: .custom("//@3`-"))
        XCTAssertNil(builder.getUrl())
    }
    
    func testBuildForceSchemeURL() {
        let builder = URLBuilder(baseUrl: "http://example.com/")
        XCTAssertEqual(builder.getUrl(), URL(string: "https://example.com/3"))
    }

    func testBuildOverrideSchemeURL() {
        var builder = URLBuilder(baseUrl: "http://example.com/")
        builder.config(scheme: "ftp")
        XCTAssertEqual(builder.getUrl(), URL(string: "ftp://example.com/3"))
    }
    
    func testBuildWithQueryParams() {
        var builder = URLBuilder()
        builder.config(path: .popularMovies, queryParams: ["id" : 3])
        XCTAssertEqual(builder.getUrl(), URL(string: "https://api.themoviedb.org/3/movie/popular?id=3"))
    }
    
    func testBuildPostUrlRequest() {
        var builder = URLBuilder()
        builder.config(path: .popularMovies)
        builder.method = .POST
        XCTAssertEqual(builder.method.rawValue, "POST")
        XCTAssertEqual(builder.getUrl(), URL(string: "https://api.themoviedb.org/3/movie/popular"))
    }
}
