//
//  MoviesHomepageViewModel.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 04/02/21.
//

import UIKit

class MoviesHomepageViewModel {
    private var movies: [Movie]?
    public var moviesVC: MoviesHomepageViewController?
    public static let imageCache = NSCache<NSString, UIImage>()
    let apiRequester = MovieAPIRequest()
    func apiRequest() {
        apiRequester.fetchMovies { (movies) in
            DispatchQueue.main.async {
                self.moviesVC?.movies = movies.results
                self.moviesVC?.movieView.moviesCollectionView.reloadData()
            }
        }
    }
    func movieCoverApiRequest(movieURL: String, cell: MovieCollectionViewCell) {
        apiRequester.downloadImage(imgURL: movieURL) { data in
            DispatchQueue.main.async {
                if let imageFromCache = MoviesHomepageViewModel.imageCache.object(forKey: movieURL as NSString) {
                    cell.movieCover.image = imageFromCache
                    return
                }
                guard let data = data else { return }
                let imageToCache = UIImage(data: data)
                MoviesHomepageViewModel.imageCache.setObject(imageToCache!, forKey: movieURL as NSString)
                cell.movieCover.image = imageToCache
            }
        }
    }
}
