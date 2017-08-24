//
//  RequestMoviesFacade.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 8/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import Alamofire


class RequestMoviesFacade{
    
    
  static func RequestTopMovies(){
    
        Alamofire.request("https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1").responseJSON { response in
            let json = response.result.value
            let JSON = json as? [String: Any]
            let dirMovies = JSON?["results"] as? [[String: Any]]
        
            var movies = [Movie]()
            
            for dirMovie in dirMovies!{
                let movie = Movie(dirMovie: dirMovie)
                movies.append(movie!)
            }
            print(movies[1].name!)
        }
        
    }
    
}
