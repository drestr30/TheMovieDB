//
//  ViewController.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 9/5/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var movieListView: MovieDataListViewProtocol =  MovieCollectionView()
    var movies:[Movie] = []
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let listView = movieListView as! UIView
        listView.backgroundColor = UIColor.white
        
        view.addSubview(listView)
        listView.addConstraints(toFillSuperView: view)
        
        movieListView.movieDataSource = self
        
        RequestMoviesFacade.RequestTopMovies { movies in
            self.movies = movies
            self.movieListView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMovie" {
            let MovieDetailViewController = segue.destination as! MovieDetailViewController
            MovieDetailViewController.movie = selectedMovie
        }
    }
    
}

extension ViewController: MovieDataSourceProtocol {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItemsInSection(at: Int) -> Int {
        return movies.count
    }
    
    func configure(cell: MovieDataCellProtocol, atIndex: IndexPath) {
        
        let boldAttribute = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        
        movies.sort{$0.popularity! > $1.popularity!}
        let movie = movies[atIndex.row]
        
        cell.movieTitleLabel.attributedText = NSAttributedString(string: movie.name!, attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)])
        
        
        let dateLabelTitle = NSMutableAttributedString(string: "Release Date: ",attributes: boldAttribute)
        dateLabelTitle.append(NSAttributedString(string: (movie.year)!))
        cell.movieDateLabel.attributedText = dateLabelTitle
        
        let popularityLabelTitle = NSMutableAttributedString(string: "Popularity: ",attributes: boldAttribute)
        let popularityString = String((movie.popularity)!)
        popularityLabelTitle.append(NSAttributedString(string:popularityString))
        cell.moviePopularityLabel.attributedText = popularityLabelTitle
        
        cell.moviePosterImageView.af_setImage(withURL: (movie.posterURL)!)
    }
    
  
    
    func didSelectRow(atIndex: IndexPath) {
        selectedMovie = movies[atIndex.row]
        performSegue(withIdentifier: "ShowMovie",  sender: selectedMovie)
    }
    
}

extension UIView {
    func addConstraints(toFillSuperView superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(0)-[subview]-(0)-|",
                                                                options: NSLayoutFormatOptions(rawValue:0),
                                                                metrics: nil,
                                                                views: ["subview" : self]))
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[subview]-(0)-|",
                                                                options: NSLayoutFormatOptions(rawValue:0),
                                                                metrics: nil,
                                                                views: ["subview" : self]))
    }
}
