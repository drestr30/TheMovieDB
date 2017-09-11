////
////  MovieNavigationController.swift
////  TheMovieDB
////
////  Created by David Restrepo Rivera on 9/7/17.
////  Copyright © 2017 Globant. All rights reserved.
////
//
//import UIKit
//
//class MovieNavigationController: UIViewController {
//    
//    var movies: [Movie]?
//    var selectedMovie: Movie?
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    init(movies: [Movie]) {
//        self.movies = movies
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowMovie" {
//            let MovieDetailViewController = segue.destination as! MovieDetailViewController
//            MovieDetailViewController.movie = selectedMovie
//        }
//    }
//}
//
//extension MovieNavigationController: MovieDelegateProtocol {
//    
//    
//    func didSelectObject(atIndex: IndexPath) {
//        selectedMovie = movies[atIndex.row]
//        performSegue(withIdentifier: "ShowMovie",  sender: selectedMovie)
//    }
//    
//}
