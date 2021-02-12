//
//  MoviesHomepage.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 03/02/21.
//

import UIKit

class MoviesHomepage: UIView, ViewCode {
    let featuredMoviesBackground: UIView = {
        let view = UIView()
            view.backgroundColor = .grayMovieBackground
        return view
    }()
    
    let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cView.backgroundColor = .clear
        return cView
    }()
    
    func setViewHierarchy() {
        addSubview(moviesCollectionView)
        moviesCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            moviesCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            moviesCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            moviesCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: -50),
            moviesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)

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
