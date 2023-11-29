//
//  RegisterView.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import Foundation
import UIKit

class RegisterView: UIView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("RegisterView called")
        self.backgroundColor = .white
        self.stackview.addArrangedSubview(emailLabel)
        self.stackview.addArrangedSubview(emailTextFiled)
        self.stackview.addArrangedSubview(emailShouldLabel)
        self.stackview.addArrangedSubview(idLabel)
        self.stackview.addArrangedSubview(idTextField)
        self.stackview.addArrangedSubview(idShouldLabel)
        self.stackview.addArrangedSubview(passwordLabel)
        self.stackview.addArrangedSubview(passwordTextField)
        self.stackview.addArrangedSubview(passwordShouldLabel)

        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    var iconImageView : UIImageView={
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        var img = UIImage(named: "click")
        imageView.heightAnchor.constraint(equalToConstant: (img?.size.height)!/2+30).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: (img?.size.width)!/2+30).isActive = true

        imageView.image = img
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    //MARK: 텍스트필드
    var emailTextFiled : UITextField = {
        var textFiled = UITextField()
        textFiled.setTextFieldStyle(holdertext: "이메일을 입력하세요")
        textFiled.setClearButton(mode: .whileEditing)
        return textFiled
    }()
    var passwordTextField : UITextField = {
        var textFiled = UITextField()
        textFiled.setTextFieldStyle(holdertext: "비밀번호를 입력하세요")
        textFiled.setClearButton(mode: .whileEditing)
        return textFiled
    }()
    
    var idTextField : UITextField = {
        var textFiled = UITextField()
        textFiled.setTextFieldStyle(holdertext: "아이디를 입력하세요")
        textFiled.setClearButton(mode: .whileEditing)
        return textFiled
    }()
    
    

    //MARK: 이메일, 비밀번호, 아이디 제목 라벨
    var emailLabel : UILabel = {
        var label = UILabel()
        label.text = "이메일"
        label.textColor = .black
        return label
    }()
    var passwordLabel : UILabel = {
        var label = UILabel()
        label.text = "비밀번호"
        label.textColor = .black
        return label
    }()
    var idLabel : UILabel = {
        var label = UILabel()
        label.text = "아이디"
        label.textColor = .black
        return label
    }()
    
    //MARK: 이메일, 비밀번호, 아이디 텍스트필드 제한 라벨
    var emailShouldLabel : UILabel = {
        var label = UILabel()
        label.text = "올바른 이메일"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    var passwordShouldLabel : UILabel = {
        var label = UILabel()
        label.text = "올바른 비밀번호"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    var idShouldLabel : UILabel = {
        var label = UILabel()
        label.text = "올바른 아이디"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .red
        return label
    }()
    
    // 회원가입 버튼
    var registerBtn : UIButton = {
        var btn = UIButton()
        btn.backgroundColor = UIColor(hexCode: "#85A3FF", alpha: 1)
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    // 로그인 버튼
    var loginBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle("아직 계정이 없으신가요? 회원가입", for: .normal)
        btn.setTitleColor(UIColor(hexCode: "#85A3FF", alpha: 1), for: .normal)
        return btn
    }()
    
    //MARK: 세로 스택뷰
    var stackview : UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = UIStackView.Distribution.equalSpacing
        stack.spacing = 10
        return stack
    }()
    
    //MARK: UI 세팅함수
    func setup(){
        addSubview(iconImageView)
        addSubview(loginBtn)
      
        addSubview(registerBtn)
        addSubview(stackview)

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 100).isActive = true
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.topAnchor.constraint(equalTo: self.iconImageView.bottomAnchor, constant: 30).isActive = true
        stackview.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 20).isActive = true
        stackview.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: -20).isActive = true
        
        
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        registerBtn.topAnchor.constraint(equalTo: self.stackview.bottomAnchor,constant: 20).isActive = true
        registerBtn.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: -20).isActive = true
        registerBtn.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 20).isActive = true
        
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        loginBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
}

