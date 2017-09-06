//
//  DataSourceProtocol.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 9/4/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDataSourceProtocol {
    
    func numberOfSections() -> Int
    
    func numberOfItemsInSection (at: Int) -> Int
    
    func configure(cell:MovieDataCellProtocol, atIndex:IndexPath) -> Void
    
    func didSelectRow(atIndex: IndexPath)
    
}

protocol MovieDataCellProtocol {
    
    var movieTitleLabel: UILabel! {get set}
    var moviePosterImageView: UIImageView! {get set}
    var movieDateLabel: UILabel! {get set}
    var moviePopularityLabel: UILabel! {get set}
    
}

protocol MovieDataListViewProtocol: class {
    
    func reloadData()
    var movieDataSource: MovieDataSourceProtocol? {get set}
}

