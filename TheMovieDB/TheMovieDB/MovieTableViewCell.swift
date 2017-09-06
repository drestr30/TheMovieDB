//
//  MovieTableViewCell.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 8/29/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell, MovieDataCellProtocol {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
}
