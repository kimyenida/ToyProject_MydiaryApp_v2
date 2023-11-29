//
//  DiaryView.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit

class DiaryView: UIView{

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("DiaryView called")
        self.backgroundColor = .white
        self.myTableView.layer.cornerRadius = 30
        self.myTableView.register(NewTableViewCell.self, forCellReuseIdentifier:NewTableViewCell.identifier)
  
        setup()
    }
    var myimageViewgoo : UIImageView = {
        var imageview = UIImageView()
        imageview.image = UIImage(named: "goo")
        
        return imageview
    }()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    var titleLabel : UILabel = {
        var label = UILabel()
        label.text = "나의 하루 일기장"
        label.textColor = .white
        return label
    }()
    var logoutBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle("로그아웃", for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        
        btn.setImage(UIImage(systemName: "escape")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        btn.setTitleColor(.white, for: .normal)
        btn.widthAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.width + 10.0 * 3.0).isActive = true
        btn.heightAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.height + 10.0 * 2.0).isActive = true
   
        return btn
    }()
    var addWriteBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle("일기쓰기", for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        
        btn.setImage(UIImage(systemName: "highlighter")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(hexCode: "#85A3FF", alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.widthAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.width + 10.0 * 3.0).isActive = true
        btn.heightAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.height + 10.0 * 2.0).isActive = true
   
        return btn
    }()
    var myTableView : UITableView = {
       var mytableview = UITableView()
        mytableview.backgroundColor = UIColor.clear
       return mytableview
    }()
    func setup(){
        addSubview(myimageViewgoo)
        addSubview(titleLabel)

        addSubview(logoutBtn)
        addSubview(addWriteBtn)
      
        addSubview(myTableView)

        myimageViewgoo.translatesAutoresizingMaskIntoConstraints = false
        myimageViewgoo.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        myimageViewgoo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        myimageViewgoo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        myimageViewgoo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true

        
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 40).isActive = true
        
        logoutBtn.translatesAutoresizingMaskIntoConstraints = false
        logoutBtn.rightAnchor.constraint(equalTo: self.titleLabel.leftAnchor, constant: -30).isActive = true
        logoutBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 30).isActive = true
        
        
        addWriteBtn.translatesAutoresizingMaskIntoConstraints = false
        addWriteBtn.leftAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: 30).isActive = true
        addWriteBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 30).isActive = true
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20).isActive = true
        myTableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 0).isActive = true
        myTableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: 0).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0).isActive = true
    }
}
