//
//  MovieDetailViewController.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 09/02/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieDetailView = MovieDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = movieDetailView
    }
    

   

}
