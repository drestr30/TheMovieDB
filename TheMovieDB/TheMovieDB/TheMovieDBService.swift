//
//  TheMovieDBService.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 9/12/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Alamofire
import Foundation

struct TheMovieDBService {
    
    static let host = "https://api.themoviedb.org/3"
    static let imgBaseURL =  "https://image.tmdb.org/t/p/w500"
    static let apiKey = "1f4d7de5836b788bdfd897c3e0d0a24b"
    
    
    let moviesFacade = RequestMoviesFacade()
    
    static func handleResponse(response: Alamofire.DataResponse<Any>) -> TheMovieDBResponse {
        
        guard let value = response.result.value as? NSDictionary
            else {
                if let error = response.result.error as? NSError, error.code == NSURLErrorNotConnectedToInternet {
                    return (.noInternetConnection)
                } else {
                    return (.failure("Error"))
                }
        }
        
        let dirMovies = value["results"] as? [[String: Any]]
        
        var movies = [Movie]()
        for dirMovie in dirMovies!{
            let movie = Movie(dirMovie: dirMovie)
            movies.append(movie)
        }
        return .success(movies)
    }
    
    static func setGenre(genresList: [[String:Any]], movie: Movie){
        
        genresList.forEach{ genre in
            movie.genresID?.forEach{ id in
                if genre["id"] as! Int == id {
                    movie.genres.append((genre["name"] as! String))
                }
            }
        }
    }
}



