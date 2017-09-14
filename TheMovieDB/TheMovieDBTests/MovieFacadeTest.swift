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

class MovieFacadeTest: XCTestCase {
    
    var moviesFacade: RequestMoviesFacade!
    
    override func setUp() {
        super.setUp()
        moviesFacade = RequestMoviesFacade()
        
        
        stub(condition: isHost("david.com")){ request in
            let obj = ["key1":"value1", "key2":["value2A","value2B"]] as [String : Any]
//            let stubData = responseText.data(using: String.Encoding.utf8)
            return OHHTTPStubsResponse(jsonObject: obj, statusCode:200, headers:nil)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNotInternetConectionResponse(){
        stub(condition: isHost(TheMovieDBService.host)){ _ in
        return OHHTTPStubsResponse(error: NSError(domain: NSURLErrorDomain,
                                                code: NSURLErrorNotConnectedToInternet))
        }
        let expect = expectation(description: "Wait for popular movies")
        moviesFacade.RequestTopMovies{ response in
           if case .noInternetConection == response 
            
        
        
    }
}


