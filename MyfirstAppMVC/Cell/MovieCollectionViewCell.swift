//
//  MovieCollectionViewCell.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/28/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    var membernameLabel : UILabel!
    var movieImageview : UIImageView = {
        var imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setUpCell()
        setUpLabel()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    func setUpCell(){
        membernameLabel = UILabel()
        movieImageview = UIImageView()
        
        contentView.addSubview(movieImageview)
        contentView.addSubview(membernameLabel)
        membernameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieImageview.translatesAutoresizingMaskIntoConstraints = false

        movieImageview.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        movieImageview.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        movieImageview.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant:20).isActive = true
        movieImageview.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -20).isActive = true
        movieImageview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -30).isActive = true

        
        membernameLabel.topAnchor.constraint(equalTo: movieImageview.bottomAnchor).isActive = true
        membernameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        membernameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    
    func setUpLabel(){
        membernameLabel.font = UIFont.systemFont(ofSize: 12)
        membernameLabel.textColor = .black
        membernameLabel.textAlignment = .center
    }
}
