//
//  MyListTableViewCell.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 10/02/21.
//

import UIKit

class MyListTableViewCell: UITableViewCell, ViewCode {
    let movieCover: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    let movieName: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 28)
        lbl.textColor = .white
        return lbl
    }()
    
    let movieScore: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 22)
        lbl.textColor = .white
        return lbl
    }()
    
    func setViewHierarchy() {
        addSubview(movieCover)
        movieCover.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieName)
        movieName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(movieScore)
        movieScore.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            movieCover.widthAnchor.constraint(equalToConstant: 76),
            movieCover.heightAnchor.constraint(equalToConstant: 128),
            movieCover.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20),
            movieCover.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            movieCover.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            movieName.leftAnchor.constraint(equalTo: movieCover.rightAnchor, constant: 20),
            movieName.topAnchor.constraint(equalTo: movieCover.topAnchor, constant: 31),
            movieScore.leftAnchor.constraint(equalTo: movieName.leftAnchor),
            movieScore.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 5)
            
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .blackBackground
        setupViewCode()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
