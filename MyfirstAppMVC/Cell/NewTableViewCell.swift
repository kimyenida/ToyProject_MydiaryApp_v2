//
//  NewTableViewCell.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/23/23.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
//    var myView : UIView = {
//        var view = UIView()
//        return view
//    }()
    func addviews(){
        self.vstackview.addArrangedSubview(idLabel)
        self.vstackview.addArrangedSubview(emailLabel)
        self.hstackview.addArrangedSubview(heartImage)
        self.hstackview.addArrangedSubview(goodImage)
        self.hstackview.addArrangedSubview(shareImage)
        
//        self.addSubview(myView)
        self.contentView.addSubview(vstackview)
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(hstackview)
        self.contentView.addSubview(dateLabel)

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        goodImage.translatesAutoresizingMaskIntoConstraints = false
        shareImage.translatesAutoresizingMaskIntoConstraints = false
        vstackview.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        hstackview.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
//        myView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            iconImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),

            vstackview.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5),
            vstackview.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            vstackview.heightAnchor.constraint(equalTo: iconImageView.heightAnchor),
            
            contentLabel.leadingAnchor.constraint( equalTo: iconImageView.leadingAnchor),
            contentLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor,constant: 8),
            contentLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            hstackview.leadingAnchor.constraint(equalTo: contentLabel.leadingAnchor),
            hstackview.topAnchor.constraint(equalTo: contentLabel.bottomAnchor,constant: 8),
            hstackview.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            heartImage.heightAnchor.constraint(equalToConstant: 40),
            heartImage.widthAnchor.constraint(equalToConstant: 40),
            shareImage.heightAnchor.constraint(equalToConstant: 40),
            shareImage.widthAnchor.constraint(equalToConstant: 40),
            goodImage.heightAnchor.constraint(equalToConstant: 40),
            goodImage.widthAnchor.constraint(equalToConstant: 40),
            
        
            dateLabel.leadingAnchor.constraint(equalTo: hstackview.trailingAnchor, constant: 10),
            dateLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15)
//            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
//            iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
//            iconImageView.heightAnchor.constraint(equalToConstant: 50),
//            iconImageView.widthAnchor.constraint(equalToConstant: 50),
//
//            vstackview.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5),
//            vstackview.topAnchor.constraint(equalTo: iconImageView.topAnchor),
//            vstackview.heightAnchor.constraint(equalTo: iconImageView.heightAnchor),
//            
//            contentLabel.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor),
//            contentLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor,constant: 8),
//            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            
//            hstackview.leadingAnchor.constraint(equalTo: contentLabel.leadingAnchor),
//            hstackview.topAnchor.constraint(equalTo: contentLabel.bottomAnchor,constant: 8),
//            hstackview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
//            heartImage.heightAnchor.constraint(equalToConstant: 70),
//            heartImage.widthAnchor.constraint(equalToConstant: 100),
//            shareImage.heightAnchor.constraint(equalToConstant: 70),
//            shareImage.widthAnchor.constraint(equalToConstant: 100),
//            goodImage.heightAnchor.constraint(equalToConstant: 70),
//            goodImage.widthAnchor.constraint(equalToConstant: 100),
//            
//        
//            dateLabel.leadingAnchor.constraint(equalTo: hstackview.trailingAnchor, constant: 10),
//            dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    var vstackview : UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.spacing = 0
        return stack
    }()
    
    var hstackview : UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = UIStackView.Distribution.fill
        stack.spacing = 15
        return stack
    }()
    
    var iconImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "icon")
        return imageView
    }()
    
    var emailLabel : UILabel = {
        var label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    var idLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    var dateLabel : UILabel = {
        var label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13)

        return label
    }()
    var contentLabel : UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    var heartImage : UIButton = {
        var btn = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15,weight: .bold, scale: .large)
        var myimage = UIImage(systemName: "heart.fill", withConfiguration: largeConfig)
        btn.setImage(myimage, for: .normal)
        btn.tintColor = .white
        return btn
    }()
    var goodImage : UIButton = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15,weight: .bold, scale: .large)
        var myimage = UIImage(systemName: "hand.thumbsup.fill", withConfiguration: largeConfig)
        var btn = UIButton()

        btn.setImage(myimage, for: .normal)
    
        btn.tintColor = .white
        return btn
    }()
    var shareImage : UIButton = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15,weight: .bold, scale: .large)
        var myimage = UIImage(systemName: "arrowshape.turn.up.left.fill", withConfiguration: largeConfig)
        var btn = UIButton()

        btn.setImage(myimage, for: .normal)
 
        btn.tintColor = .white
        return btn
    }()
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: - init함수
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(white: 1, alpha: 0.5)
        addviews()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    
        
        
}
