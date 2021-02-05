//
//  MovieCollectionViewCell.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 04/02/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, ViewCode {
    let movieCover: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .yellow
        return img
    }()
    
    func setViewHierarchy() {
        addSubview(movieCover)
        movieCover.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            movieCover.widthAnchor.constraint(equalToConstant: 126),
            movieCover.heightAnchor.constraint(equalToConstant: 214),

            movieCover.leftAnchor.constraint(equalTo: leftAnchor),
//            movieCover.rightAnchor.constraint(equalTo: rightAnchor),
            movieCover.topAnchor.constraint(equalTo: topAnchor),
//            movieCover.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
