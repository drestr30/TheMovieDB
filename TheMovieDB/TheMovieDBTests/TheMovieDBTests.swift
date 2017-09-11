//
//  TheMovieDBTests.swift
//  TheMovieDBTests
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import XCTest
import Alamofire
import OHHTTPStubs

@testable import TheMovieDB

class TheMovieDBTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testFacadeResponseOfCorrectType(){
        
        
        let expect = expectation(description: "GET movie")
        RequestMoviesFacade.RequestTopMovies{ response in
            
            if (response as? [Movie]) != nil {
                XCTAssertTrue(true)
            } else {
                XCTAssertTrue(false)
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10 ){ error in
            print (error ?? "0")
        }
    }
    
    func testFacadeCorrectResponse(){
        
        class mockRequesTopMovies: RequestMoviesFacade{
            
            func RequestTopMovies(){
            return
            }
        
        }
    }
    
    
}

