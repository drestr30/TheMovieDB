//
//  MovieCollectionView.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 9/5/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class MovieCollectionView: UICollectionView, MovieDataListViewProtocol {

  var movieDataSource: MovieDataSourceProtocol?
    
    func configure(){
        dataSource = self
        let nib = UINib(nibName:"MovieCollectionViewCell", bundle: nil)
        register(nib, forCellWithReuseIdentifier: "Cell")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    init() {
        let defaultLayout = UICollectionViewFlowLayout()
        super.init(frame: CGRect.zero, collectionViewLayout: defaultLayout)
        configure()
    }
    
}

extension MovieCollectionView: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return movieDataSource?.numberOfSections() ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieDataSource?.numberOfItemsInSection(at: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        movieDataSource?.configure(cell: cell as! MovieDataCellProtocol, atIndex: indexPath)
        return cell
    }
}
