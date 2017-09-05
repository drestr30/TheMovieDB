//
//  MovieTableView.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 9/5/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class MovieTableView: UITableView, MovieDataListViewProtocol {
    
    var movieDataSource: MovieDataSourceProtocol?
    
    func configure(){
        dataSource = self
        let nib = UINib(nibName:"MovieTableViewCell", bundle: nil)
        register(nib, forCellReuseIdentifier: "MovieCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        configure()
    }
    
    init() {
        super.init(frame: CGRect.zero, style: .plain)
        configure()
    }
}

extension MovieTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieDataSource?.numberOfSections() ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataSource?.numberOfItemsInSection(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        movieDataSource?.configure(cell: cell, atIndex: indexPath)
        return cell
    }
    
}
