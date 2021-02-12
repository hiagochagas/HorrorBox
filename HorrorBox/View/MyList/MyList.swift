//
//  MyList.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class MyList: UIView, ViewCode {
    let movieTableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .none
        return table
    }()
    
    func setViewHierarchy() {
        addSubview(movieTableView)
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            movieTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            movieTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            movieTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            movieTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blackBackground
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
