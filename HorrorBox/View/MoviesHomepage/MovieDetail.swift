//
//  MovieDetail.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 09/02/21.
//

import UIKit

class MovieDetail: UIView, ViewCode {

    let featuredMoviesBackground: UIView = {
        let view = UIView()
            view.backgroundColor = .grayMovieBackground
        return view
    }()
    
    let movieCoverImage: UIImageView = {
       let img = UIImageView()
        img.widthAnchor.constraint(equalToConstant: 126*1.3).isActive = true
        img.heightAnchor.constraint(equalToConstant: 214*1.3).isActive = true
        img.backgroundColor = .none
       return img
    }()
    
    let movieName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Movie name"
        lbl.font = .systemFont(ofSize: 28)
        lbl.textColor = .white
        return lbl
    }()
    
    let movieScore: UILabel = {
        let lbl = UILabel()
        lbl.text = "Score"
        lbl.font = .systemFont(ofSize: 22)
        return lbl
    }()
    
    let saveButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        btn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btn.tintColor = .white
        return btn
    }()
    let overviewLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Overview:"
        lbl.font = UIFont.systemFont(ofSize: 28)
        lbl.textColor = .white
        return lbl
    }()
    let movieDetailsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "lorem lorem"
        lbl.font = UIFont.systemFont(ofSize: 22)
        lbl.textColor = .white
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blackBackground
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchy() {
        addSubview(featuredMoviesBackground)
        featuredMoviesBackground.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieCoverImage)
        movieCoverImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieName)
        movieName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieScore)
        movieScore.translatesAutoresizingMaskIntoConstraints = false
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieDetailsLabel)
        movieDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            featuredMoviesBackground.leftAnchor.constraint(equalTo: leftAnchor),
            featuredMoviesBackground.topAnchor.constraint(equalTo: topAnchor),
            featuredMoviesBackground.rightAnchor.constraint(equalTo: rightAnchor),
            featuredMoviesBackground.heightAnchor.constraint(equalToConstant: 414),
            movieCoverImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            movieCoverImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            movieName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            movieName.topAnchor.constraint(equalTo: movieCoverImage.bottomAnchor, constant: 8),
            movieScore.leftAnchor.constraint(equalTo: movieName.leftAnchor, constant: 12),
            movieScore.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 6),
            saveButton.centerYAnchor.constraint(equalTo: movieScore.centerYAnchor),
            saveButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            overviewLabel.topAnchor.constraint(equalTo: featuredMoviesBackground.bottomAnchor, constant: 20),
            overviewLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            movieDetailsLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 6),
            movieDetailsLabel.leftAnchor.constraint(equalTo: overviewLabel.leftAnchor, constant: 12),
            movieDetailsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32)
            
            
        ])
    }
    
}
