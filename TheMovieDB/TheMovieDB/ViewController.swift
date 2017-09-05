//
//  ViewController.swift
//  TheMovieDB
//
//  Created by David Restrepo Rivera on 9/5/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var movieTableView: MovieDataListViewProtocol = MovieTableView()
    var movieCollectionView: MovieDataListViewProtocol = MovieCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        let listView = movieTableView as! UIView
        let listView = movieCollectionView as! UIView
        
        view.addSubview(listView)
        
        listView.addConstraints(toFillSuperView: view)
        
        movieTableView.movieDataSource = self
        movieCollectionView.movieDataSource = self

        // Do any additional setup after loading the view.
    }
}

    extension ViewController: MovieDataSourceProtocol {
        
        func numberOfSections() -> Int {
        return 1
        }
        
        func numberOfItemsInSection(at: Int) -> Int {
            return 10
        }
        
        func configure(cell: MovieDataCellProtocol, atIndex: IndexPath) {
            cell.movieTitleLabel.text = String(atIndex.row)
            cell.moviePosterImageView.image = #imageLiteral(resourceName: "defaultPhoto")
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
