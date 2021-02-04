//
//  TabBarViewController.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    var TabBarCoordinator: TabBarCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupVc(viewController: UIViewController, image: UIImage, title: String) -> UIViewController {
            viewController.tabBarItem.image = image
            viewController.tabBarItem.selectedImage = image
            viewController.tabBarItem.image?.withRenderingMode(.alwaysOriginal)
            viewController.tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
            viewController.title = title
        return viewController
    }
    
    func setupTabBar() {
        guard var moviesVC = TabBarCoordinator?.moviesHomePageCoordinator.moviesHomepageViewController else { return }
        guard var myListVC = TabBarCoordinator?.myListCoordinator.myListViewController else { return }
        moviesVC = setupVc(viewController: (moviesVC), image: UIImage(systemName: "film.fill")!, title: "Movies") as! MoviesHomepageViewController
        myListVC = setupVc(viewController: (myListVC), image: UIImage(systemName: "list.and.film")!, title: "My List") as! MyListViewController
        viewControllers = [moviesVC, myListVC]
        tabBar.isHidden = false
    }
}

