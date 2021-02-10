//
//  MyListCoordinator.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class MyListCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return myListViewController
    }
    var rootViewModel: MyListViewModel {
        return myListViewModel
    }
    var tabBarCoordinator: TabBarCoordinator?
    var myListViewController: MyListViewController
    var myListViewModel: MyListViewModel
    init() {
        myListViewController = MyListViewController()
        myListViewModel = MyListViewModel()
        myListViewController.coordinator = self
    }
    
}
