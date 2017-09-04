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

    
    var movies:[Movie] = []
    
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
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "MovieCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let boldAttribute = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        
        movies.sort{$0.popularity! > $1.popularity!}
        
        let movie = movies[indexPath.row]
        
        cell.movieTitleLabel.attributedText = NSAttributedString(string: movie.name!, attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)])
        
        let dateLabelTitle = NSMutableAttributedString(string: "Release Date: ",attributes: boldAttribute)
        dateLabelTitle.append(NSAttributedString(string: (movie.year)!))
        cell.movieDateLabel.attributedText = dateLabelTitle
      
        let popularityLabelTitle = NSMutableAttributedString(string: "Popularity: ",attributes: boldAttribute)
        let popularityString = String((movie.popularity)!)
        popularityLabelTitle.append(NSAttributedString(string:popularityString))
        cell.moviePopularityLabel.attributedText = popularityLabelTitle
        
        cell.moviePosterImageView.af_setImage(withURL: (movie.posterURL)!)

        return cell
        
    }
    
    var SelectedMovie: Movie?

     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        SelectedMovie = self.movies[indexPath.row]
        performSegue(withIdentifier: "ShowMovie",  sender: self)
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMovie" {
            let MovieDetailViewController = segue.destination as! MovieDetailViewController
            MovieDetailViewController.movie = self.SelectedMovie

        }
    }
    
}
