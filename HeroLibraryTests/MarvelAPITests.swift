//
//  MarvelAPITests.swift
//  HeroLibraryTests
//
//  Created by Foliveira on 13/09/20.
//  Copyright © 2020 filipero.dev. All rights reserved.
//

import XCTest
@testable import HeroLibrary

class MarvelAPITests: XCTestCase {
    
    var marvelAPI: MarvelAPI!
    
    override func setUp() {
        super.setUp()
        marvelAPI = MarvelAPI()
    }
    
    override func tearDown() {
        super.tearDown()
        marvelAPI = nil
    }
    
    func test_valid_call_does_get_characters() {
        marvelAPI.getCharacters(offset: 0, limit: 1, completion: { characters in
            XCTAssertNotNil(characters)
        })
    }
    
    func test_invalid_offset_fails() {
        marvelAPI.getCharacters(offset: -1, limit: 1, completion: { characters in
            XCTAssertNil(characters)
        })
    }
    
    func test_invalid_limit_fails() {
        marvelAPI.getCharacters(offset: 0, limit: -1, completion: { characters in
            XCTAssertNil(characters)
        })
    }
    
}
