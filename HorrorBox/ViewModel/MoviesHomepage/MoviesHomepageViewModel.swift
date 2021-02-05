//
//  MoviesHomepageViewModel.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 04/02/21.
//

import Foundation

class MoviesHomepageViewModel {
    private var movies: [Movie]?
    public var moviesVC: MoviesHomepageViewController?
    func apiRequest(){
        let apiRequest = MovieAPIRequest()
        apiRequest.fetchMovies { (movies) in
            DispatchQueue.main.async {
                self.moviesVC?.movies = movies.results
                self.moviesVC?.movieView.moviesCollectionView.reloadData()
            }
        }
    }
}
