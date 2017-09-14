//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {
    
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOriginalNameLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieGenresLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    var movie: Movie!
    var movieFacade = RequestMoviesFacade()
    var genresList:[[String:Any]] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        movieFacade.RequestMovieGenres{ genres in
            self.genresList = genres!
            self.configureView()
        }
    }
    
    
    func configureView(){
        
        let boldAttribute = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        
        movieNameLabel.attributedText = NSAttributedString(string: (movie?.name)!, attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 22)])
        
        let originalNameLabelTitle = NSMutableAttributedString(string: "Original name: ",attributes: boldAttribute)
        originalNameLabelTitle.append(NSAttributedString(string: (movie.originalName)!))
        movieOriginalNameLabel.attributedText = originalNameLabelTitle
        
        let dateLabelTitle = NSMutableAttributedString(string: "Release Date: ",attributes: boldAttribute)
        dateLabelTitle.append(NSAttributedString(string: (movie.year)!))
        movieDateLabel.attributedText = dateLabelTitle
        
        let genresLabelTitle = NSMutableAttributedString(string: "Genres: ",attributes: boldAttribute)
        TheMovieDBService.setGenre(genresList: genresList, movie: movie)
        movie.genres.forEach{ genre in
            genresLabelTitle.append(NSAttributedString(string: (genre + " ")))}
        movieGenresLabel.attributedText = genresLabelTitle
        
        let popularityLabelTitle = NSMutableAttributedString(string: "Popularity: ",attributes: boldAttribute)
        let popularityString = String((movie.popularity)!)
        popularityLabelTitle.append(NSAttributedString(string:popularityString))
        moviePopularityLabel.attributedText = popularityLabelTitle
        
        let movieURL = NSURL(string:TheMovieDBService.imgBaseURL + (movie.posterPath)!)
        moviePosterImageView.af_setImage(withURL: (movieURL as! URL))
        
        let overviewLabelTitle = NSMutableAttributedString(string: "Overview: ",attributes: boldAttribute)
        overviewLabelTitle.append(NSAttributedString(string: (movie.overview)!))
        movieOverviewLabel.attributedText = overviewLabelTitle
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

