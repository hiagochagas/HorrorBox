//
//  MoviesHomepageViewController.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class MoviesHomepageViewController: UIViewController {
    let movieCollectionViewCellID = "movieCollectionViewCellID"
    let movieView = MoviesHomepage()
    var moviesViewModel = MoviesHomepageViewModel()
    var movies: [Movie]?
    var movieCovers: [UIImage]?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewEditing()
        collectionViewConfig()
    }
    
    func viewEditing() {
        view = movieView
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Featured"
        self.navigationController?.title = "Movies"
    }
    
    func collectionViewConfig() {
        movieView.moviesCollectionView.delegate = self
        movieView.moviesCollectionView.dataSource = self
        movieView.moviesCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCollectionViewCellID)
        moviesViewModel.moviesVC = self
        moviesViewModel.apiRequest()
    }
    

}

extension MoviesHomepageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCollectionViewCellID, for: indexPath) as! MovieCollectionViewCell
        let movieURL = movies?[indexPath.row].posterPath ?? ""
        moviesViewModel.movieCoverApiRequest(movieURL: movieURL, cell: cell)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.2, height: 214)
    }
    
    
}
