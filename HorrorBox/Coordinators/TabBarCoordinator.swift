//
//  TabBarCoordinator.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class TabBarCoordinator: NSObject, Coordinator {
    var rootViewController: UIViewController {
        return tabBarController
    }
    let tabBarController: TabBarViewController
    let moviesHomePageCoordinator: MoviesHomepageCoordinator
    let myListCoordinator: MyListCoordinator
    
    override init() {
        tabBarController = TabBarViewController()
        moviesHomePageCoordinator = MoviesHomepageCoordinator()
        myListCoordinator = MyListCoordinator()
        super.init()
        tabBarController.TabBarCoordinator = self
        tabBarController.setupTabBar()
    }
}
