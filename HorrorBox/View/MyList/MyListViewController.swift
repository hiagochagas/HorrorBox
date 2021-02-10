//
//  MyListViewController.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class MyListViewController: UIViewController {
    
    let myListTableViewCellID = "myListTableViewCellID"
    var coordinator: MyListCoordinator?
    let contentView = MyList()
    var myListViewModel: MyListViewModel {
        return coordinator!.rootViewModel
    }
    var movies: [Film] {
        return self.myListViewModel.getMoviesFromCoreData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view = contentView
        contentView.movieTableView.delegate = self
        contentView.movieTableView.dataSource = self
        contentView.movieTableView.register(MyListTableViewCell.self, forCellReuseIdentifier: myListTableViewCellID)
    }
}

extension MyListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myListTableViewCellID) as! MyListTableViewCell
        let movie = movies[indexPath.row]
        cell.movieCover.image = UIImage(data: movie.movieCover!)
        cell.movieName.text = movie.originalTitle
        cell.movieScore.text = String(movie.score)
        return cell
    }
    
    
}
