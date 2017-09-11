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
        delegate = self
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
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing =  CGFloat(1.0)
        flowLayout.minimumLineSpacing =  CGFloat(2.0)
        
        let windowWidth = CGFloat(UIScreen.main.bounds.width)
        let windowHeight = CGFloat(UIScreen.main.bounds.height)
        let navigationControlerHeight = CGFloat(44.0)
        
        flowLayout.itemSize = CGSize(width: ((windowWidth)/2), height: ((windowHeight - navigationControlerHeight)/2-11))

        super.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        configure()
    }
    
    static func configureLayout(){
        let flowLayout = UICollectionViewFlowLayout()

        flowLayout.minimumInteritemSpacing =  CGFloat(1.0)
        flowLayout.minimumLineSpacing =  CGFloat(2.0)
        
        let windowWidth = CGFloat(UIScreen.main.bounds.width)
        let windowHeight = CGFloat(UIScreen.main.bounds.height)
        let navigationControlerHeight = CGFloat(44.0)
        
        flowLayout.itemSize = CGSize(width: ((windowWidth)/2), height: ((windowHeight - navigationControlerHeight)/2-11))
    }
}

extension MovieCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieDataSource?.didSelectItem(atIndex: indexPath)
    }
    
}
