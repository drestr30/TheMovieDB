////
////  TheMovieDBResponse.swift
////  TheMovieDB
////
////  Created by David Restrepo Rivera on 9/13/17.
////  Copyright © 2017 Globant. All rights reserved.
////
//
import Foundation

enum TheMovieDBResponse {
    case noInternetConnection
    case failure(String)
    case success([Movie])
}
