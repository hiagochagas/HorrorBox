//
//  MoviesHomepageViewModel.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 04/02/21.
//

import UIKit

class MoviesHomepageViewModel {
    public var moviesVC: MoviesHomepageViewController?
    public static let imageCache = NSCache<NSString, UIImage>()
    let apiRequester = MovieAPIRequest()
    func apiRequest() {
        apiRequester.fetchMovies { [weak self] (movies) in
            DispatchQueue.main.async {
                self?.moviesVC?.movies = movies.results
                self?.moviesVC?.movieView.moviesCollectionView.reloadData()
            }
        }
    }
    func movieCoverApiRequest(movieURL: String, view: UIImageView) {
        apiRequester.downloadImage(imgURL: movieURL) { data in
            DispatchQueue.main.async {
                if let imageFromCache = MoviesHomepageViewModel.imageCache.object(forKey: movieURL as NSString) {
                    view.image = imageFromCache
                    return
                }
                guard let data = data else { return }
                let imageToCache = UIImage(data: data)
                MoviesHomepageViewModel.imageCache.setObject(imageToCache!, forKey: movieURL as NSString)
                view.image = imageToCache
            }
        }
    }
}
