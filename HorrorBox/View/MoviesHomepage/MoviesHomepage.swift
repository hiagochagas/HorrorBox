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
        addSubview(featuredMoviesBackground)
        featuredMoviesBackground.translatesAutoresizingMaskIntoConstraints = false
        addSubview(moviesCollectionView)
        moviesCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            featuredMoviesBackground.leftAnchor.constraint(equalTo: leftAnchor),
            featuredMoviesBackground.topAnchor.constraint(equalTo: topAnchor),
            featuredMoviesBackground.rightAnchor.constraint(equalTo: rightAnchor),
            featuredMoviesBackground.heightAnchor.constraint(equalToConstant: 414),
            moviesCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            moviesCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            moviesCollectionView.topAnchor.constraint(equalTo: featuredMoviesBackground.bottomAnchor, constant: 80),
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
