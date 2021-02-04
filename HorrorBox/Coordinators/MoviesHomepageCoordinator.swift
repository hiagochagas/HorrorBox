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
    
    var moviesHomepageViewController: MoviesHomepageViewController
    
    init() {
        moviesHomepageViewController = MoviesHomepageViewController()
        //myListViewController.coordinator = self
    }
    
}
