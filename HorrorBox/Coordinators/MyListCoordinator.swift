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
    
    var myListViewController: MyListViewController
    
    init() {
        myListViewController = MyListViewController()
        //myListViewController.coordinator = self
    }
    
}
