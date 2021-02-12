//
//  MovieHomepageHeaderCollectionReusableView.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 10/02/21.
//

import UIKit

class MovieHomepageHeaderCollectionReusableView: UICollectionReusableView, ViewCode {
    func setViewHierarchy() {
        addSubview(featuredMoviesBackground)
        featuredMoviesBackground.translatesAutoresizingMaskIntoConstraints = false
        addSubview(featuredLabel)
        featuredLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            featuredMoviesBackground.leftAnchor.constraint(equalTo: leftAnchor, constant: -5),
            featuredMoviesBackground.topAnchor.constraint(equalTo: topAnchor),
            featuredMoviesBackground.rightAnchor.constraint(equalTo: rightAnchor, constant: 5),
            featuredMoviesBackground.heightAnchor.constraint(equalToConstant: 414),
            featuredLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 14),
            featuredLabel.topAnchor.constraint(equalTo: topAnchor, constant: 91)
        ])
    }
    
    let featuredMoviesBackground: UIView = {
        let view = UIView()
            view.backgroundColor = .grayMovieBackground
        return view
    }()
    
    let featuredLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Featured"
        lbl.font = .systemFont(ofSize: 34, weight: .bold)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
