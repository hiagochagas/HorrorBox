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
    
    func setupVc(rootViewController: UIViewController, image: UIImage, title: String) -> UINavigationController{
            rootViewController.title = title
            let viewController = UINavigationController(rootViewController: rootViewController)
                viewController.tabBarItem.image = image
                viewController.tabBarItem.selectedImage = image
                viewController.tabBarItem.image?.withRenderingMode(.alwaysOriginal)
                viewController.tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
                viewController.title = title
            return viewController
           }
    
    func setupTabBar() {
        guard let moviesVC = TabBarCoordinator?.moviesHomePageCoordinator.moviesHomepageViewController else { return }
        guard let myListVC = TabBarCoordinator?.myListCoordinator.myListViewController else { return }
        let moviesNavController = setupVc(rootViewController: (moviesVC), image: UIImage(systemName: "film.fill")!, title: "Movies")
        let myListNavController = setupVc(rootViewController: (myListVC), image: UIImage(systemName: "list.and.film")!, title: "My List")
        viewControllers = [moviesNavController, myListNavController]
        tabBar.isHidden = false
        tabBar.tintColor = .white
    }
}

