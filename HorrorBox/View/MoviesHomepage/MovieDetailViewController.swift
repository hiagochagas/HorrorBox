//
//  MovieDetailViewController.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 09/02/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieDetailView = MovieDetail()
    var movie: Movie?
    var upperVC: MoviesHomepageViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        configMovie()
        movieDetailView.saveButton.addTarget(self, action: #selector(saveMovie), for: .touchUpInside)
        self.view = movieDetailView
    }
    
    func configMovie() {
        movieDetailView.movieName.text = movie?.originalTitle
        movieDetailView.movieScore.text = "Score: " + String(movie?.voteAverage ?? 0)
        upperVC?.moviesViewModel.movieCoverApiRequest(movieURL: movie?.posterPath ?? "", view: movieDetailView.movieCoverImage)
        movieDetailView.movieDetailsLabel.text = movie?.overview
    }
    
    @objc func saveMovie() {
        upperVC?.saveMovie(movie: movie!, movieCover: movieDetailView.movieCoverImage.image!)
    }
    

   

}
