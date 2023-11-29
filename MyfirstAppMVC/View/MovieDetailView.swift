//
//  MovieDetailView.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/28/23.
//

import UIKit

class MovieDetailView: UIView {
    
    var contentLabel : UILabel = {
       var label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("MovieDetailView called")

        self.backgroundColor = .white
        addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contentLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        contentLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        contentLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
