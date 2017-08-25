//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        RequestMoviesFacade.RequestTopMovies { movies in
//            print(movies[0].name!)
            self.movies = movies
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

