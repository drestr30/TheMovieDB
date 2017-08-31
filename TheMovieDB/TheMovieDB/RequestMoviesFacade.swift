//
//  RequestMoviesFacade.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 8/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage


class RequestMoviesFacade{
    
    
    static func RequestApiConfiguration (completion: @escaping ([String:Any]) -> Void ){
    
    let ApiUrl = "https://api.themoviedb.org/3/configuration?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
    
        Alamofire.request(ApiUrl).responseJSON { response in
            let object = response.result.value as? [String:Any]
            let imageConfig = object?["images"] as? [String:Any]
            completion(imageConfig!)
        }
    }
    
    
    static func RequestTopMovies(completion: @escaping ([Movie]) -> Void ){
        
        let topMoviesURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1"
        
        Alamofire.request(topMoviesURL).responseJSON { response in
            let json = response.result.value
            let JSON = json as? [String: Any]
            let dirMovies = JSON?["results"] as? [[String: Any]]
            
            var movies = [Movie]()
            
            for dirMovie in dirMovies!{
                let movie = Movie(dirMovie: dirMovie)
                
                let imageBaseUrl = "http://image.tmdb.org/t/p/w92"
                let urlString = imageBaseUrl + movie.posterPath!
                movie.posterURL = NSURL(string: urlString) as URL?
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




