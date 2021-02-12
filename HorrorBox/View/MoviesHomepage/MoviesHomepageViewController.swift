//
//  MoviesHomepageViewController.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class MoviesHomepageViewController: UIViewController {
    let movieCollectionViewCellID = "movieCollectionViewCellID"
    let movieCollectionViewHeaderID = "movieCollectionViewHeaderID"

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
        navigationController?.navigationBar.isHidden = true
        self.navigationController?.title = "Movies"
    }
    
    func collectionViewConfig() {
        movieView.moviesCollectionView.delegate = self
        movieView.moviesCollectionView.dataSource = self
        movieView.moviesCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCollectionViewCellID)
        movieView.moviesCollectionView.register(MovieHomepageHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: movieCollectionViewHeaderID)
        moviesViewModel.moviesVC = self
        moviesViewModel.apiRequest()
    }
    
    func presentMovieDetailVC(_ indexPath: IndexPath) {
        let viewController = MovieDetailViewController()
        let movie = movies?[indexPath.row]
        viewController.movie = movie
        viewController.upperVC = self
        self.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    func saveMovie(movie: Movie, movieCover: UIImage) {
        moviesCoordinator?.tabBarCoordinator?.myListCoordinator.myListViewModel.addMovie(movie: movie, movieCover: movieCover)
        moviesCoordinator?.tabBarCoordinator?.myListCoordinator.myListViewController.contentView.movieTableView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: movieCollectionViewHeaderID, for: indexPath) as! MovieHomepageHeaderCollectionReusableView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 454)
    }
    
}
