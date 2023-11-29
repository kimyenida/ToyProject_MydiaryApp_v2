//
//  DetailView.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit

class DetailView: UIView {
    
    var homeBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle(" 이전으로", for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        btn.setImage(UIImage(systemName: "arrow.left.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(hexCode: "#85A3FF", alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.widthAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.width + 10.0 * 3.0).isActive = true
        btn.heightAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.height + 10.0 * 2.0).isActive = true
   
        return btn
    }()
    var contentLabel : UILabel = {
        var label = UILabel()
        label.text = "content label"
        label.textColor = .black
        return label
    }()
    var gptBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle("gpt의 답변듣기", for: .normal)
        btn.setTitle("답변을 기다리는 중", for: .highlighted)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor(hexCode: "#85A3FF", alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.widthAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.width + 10.0 * 3.0).isActive = true
        btn.heightAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.height + 10.0 * 2.0).isActive = true
    
        return btn
    }()
    
    var gptLabel : UILabel = {
        var label = UILabel()
        label.text = ""
        label.textColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor(hexCode: "#85A3FF", alpha: 1)
        label.layer.cornerRadius = 10
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 200).isActive = true

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("DetailView called")
        self.backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    func setup(){
        addSubview(homeBtn)
        addSubview(contentLabel)

        addSubview(gptBtn)
        addSubview(gptLabel)

        
        homeBtn.translatesAutoresizingMaskIntoConstraints = false
        homeBtn.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        homeBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 30).isActive = true
        
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.topAnchor.constraint(equalTo: self.homeBtn.topAnchor, constant: 200).isActive = true
        contentLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        gptBtn.translatesAutoresizingMaskIntoConstraints = false
        gptBtn.topAnchor.constraint(equalTo: self.contentLabel.topAnchor, constant: 100).isActive = true
        gptBtn.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        gptLabel.translatesAutoresizingMaskIntoConstraints = false
        gptLabel.topAnchor.constraint(equalTo: self.gptBtn.topAnchor, constant: 50).isActive = true
        gptLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }


}
