//
//  MoviesTableViewController.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 8/29/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesTableViewController: UITableViewController {
    
    //MARKS: Properties
    
    var movies:[Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RequestMoviesFacade.RequestTopMovies { movies in
            self.movies = movies
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "MovieCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        movies?.sort{$0.popularity! > $1.popularity!}
        
        let movie = movies?[indexPath.row]
        let populatiry = movie!.popularity!
        
        cell.movieTitleLabel.text = movie?.name
        cell.moviePopularityLabel.text = String(populatiry)
        cell.movieDateLabel.text = movie?.year
        cell.moviePosterImageView.af_setImage(withURL: (movie?.posterURL)!)

        return cell
        
    }
    
}
