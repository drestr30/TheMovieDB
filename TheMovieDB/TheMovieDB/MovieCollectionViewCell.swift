//
//  MovieCollectionViewCell.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 9/5/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, MovieDataCellProtocol {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
}
