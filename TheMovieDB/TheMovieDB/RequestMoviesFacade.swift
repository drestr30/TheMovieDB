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
    
    
    
    
    static func RequestTopMovies(completion: @escaping ([Movie]) -> Void ){
        
        let topMoviesURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1"
        
        Alamofire.request(topMoviesURL).responseJSON { response in
            let json = response.result.value
            let JSON = json as? [String: Any]
            let dirMovies = JSON?["results"] as? [[String: Any]]
            
            
            var movies = [Movie]()
            
            for dirMovie in dirMovies!{
                let movie = Movie(dirMovie: dirMovie)
                
                let movieImageBaseUrl = "http://image.tmdb.org/t/p/w92"
                let posterURL = movieImageBaseUrl + (movie.posterPath)!
                
                RequestMoviePoster(posterURL: posterURL){poster in
                    movie.poster = poster
                }
                movies.append(movie)
            }
            completion(movies)
        }
    }
    
    
    static func RequestMoviePoster(posterURL: String, completion: @escaping (UIImage?) -> Void){
        
        var imagePoster: UIImage?
        
        Alamofire.request(posterURL).responseData{ response in
            if let posterData = response.result.value{
                imagePoster = UIImage(data: posterData)
            } else { print("Error, no poster available")}
            completion(imagePoster)
        }
    }
}




