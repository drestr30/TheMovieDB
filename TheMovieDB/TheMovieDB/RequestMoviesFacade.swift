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
    
    let topMovies = "/movie/top_rated"
    let genres = "/genre/movie/list"
    
    
    func RequestTopMovies(completion: @escaping ([Movie]) -> Void ){
        let topMoviesURL = TheMovieDBService.host + self.topMovies
        Alamofire.request(topMoviesURL,
                          parameters: ["api_key":TheMovieDBService.apiKey])
            .responseJSON { response in
               let requestResponse = TheMovieDBService.handleResponse(response: response)
                
                switch requestResponse {
                case .success(let movies) :
                    completion (movies)
                case .failure:
                    break
                case .noInternetConnection:
                    break
                    
                }
                
        }
    }
    
    func RequestMovieGenres(completion: @escaping ([[String:Any]]?) -> Void) {
        let genresDicURL = TheMovieDBService.host + self.genres
        Alamofire.request(genresDicURL,
                          parameters: ["api_key":TheMovieDBService.apiKey]).responseJSON{ response in
                            let data = response.result.value as? [String:Any]
                            let genres = data?["genres"] as? [[String:Any]]
                            completion(genres)
        }
    }
}





