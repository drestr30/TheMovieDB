//
//  Movie.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 8/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import UIKit

class Movie: NSObject {
    
    //MARK: Properties
    
    var name: String?
    var originalName: String?
    var year: String?
    var popularity: Float?
    var genresID: [Int]?
    var genres = [String]()
    var overview: String?
    var posterPath: String?
    var posterURL: URL?
    
    //MARK: Initializator
    
    init(dirMovie: [String: Any]){
        
        self.name = dirMovie["title"] as? String
        self.originalName = dirMovie["original_title"] as? String
        self.year = dirMovie["release_date"] as? String
        self.popularity = dirMovie["popularity"] as? Float
        self.overview = dirMovie["overview"] as? String
        self.posterPath = dirMovie["poster_path"] as? String
        self.genresID = dirMovie["genre_ids"] as? [Int]
    }
    
    
}
