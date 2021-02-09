//
//  MoviesHomepageViewController.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class MoviesHomepageViewController: UIViewController {
    let movieCollectionViewCellID = "movieCollectionViewCellID"
    var moviesCoordinator: MoviesHomepageCoordinator?
    let movieView = MoviesHomepage()
    var moviesViewModel: MoviesHomepageViewModel {
        return moviesCoordinator!.rootViewModel
    }
    var movies: [Movie]?
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
    
    func presentMovieDetailVC(_ indexPath: IndexPath) {
        let viewController = MovieDetailViewController()
        let movie = movies?[indexPath.row]
        viewController.movieDetailView.movieName.text = movie?.originalTitle
        viewController.movieDetailView.movieScore.text = "Score: " + String(movie?.voteAverage ?? 0)
        moviesViewModel.movieCoverApiRequest(movieURL: movie?.posterPath ?? "", view: viewController.movieDetailView.movieCoverImage)
        viewController.movieDetailView.movieDetailsLabel.text = movie?.overview
        self.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }


}

extension MoviesHomepageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCollectionViewCellID, for: indexPath) as! MovieCollectionViewCell
        let movieURL = movies?[indexPath.row].posterPath ?? ""
        moviesViewModel.movieCoverApiRequest(movieURL: movieURL, view: cell.movieCover)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.2, height: 214)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentMovieDetailVC(indexPath)
    }
    
}
