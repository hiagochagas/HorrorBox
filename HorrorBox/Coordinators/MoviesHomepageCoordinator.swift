//
//  MoviesHomepageCoordinator.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class MoviesHomepageCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return moviesHomepageViewController
    }
    var rootViewModel: MoviesHomepageViewModel {
        return moviesHomepageViewModel
    }
    var tabBarCoordinator: TabBarCoordinator?
    var moviesHomepageViewController: MoviesHomepageViewController
    var moviesHomepageViewModel: MoviesHomepageViewModel
    init() {
        moviesHomepageViewController = MoviesHomepageViewController()
        moviesHomepageViewModel = MoviesHomepageViewModel()
        moviesHomepageViewController.moviesCoordinator = self
    }
    
}
