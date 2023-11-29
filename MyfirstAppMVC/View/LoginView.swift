//
//  LoginView.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit

class LoginView: UIView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("loginview called")
        self.backgroundColor = .white
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
    var emailTextFiled : UITextField = {
        var textFiled = UITextField()
        textFiled.setTextFieldStyle(holdertext: "이메일")
        textFiled.setClearButton(mode: .whileEditing)
        return textFiled
    }()
    var passwordTextField : UITextField = {
        var textFiled = UITextField()
        textFiled.setTextFieldStyle(holdertext: "비밀번호")
        textFiled.setClearButton(mode: .whileEditing)
        return textFiled
    }()
    var loginBtn : UIButton = {
        var btn = UIButton()
        btn.backgroundColor = UIColor(hexCode: "#85A3FF", alpha: 1)
        btn.setTitle("로그인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    var autologinLabel : UILabel = {
        var label = UILabel()
        label.text = "자동로그인"
        label.textColor = .black
        return label
    }()
    var autologinSwitch : UISwitch = {
        var myswitch = UISwitch()
        myswitch.isOn = false
        return myswitch
    }()
    var registerBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle("아직 계정이 없으신가요? 회원가입", for: .normal)
        
        btn.setTitleColor(UIColor(hexCode: "#85A3FF", alpha: 1), for: .normal)
        return btn
    }()
    
    func setup(){
        addSubview(iconImageView)
        addSubview(loginBtn)
        addSubview(autologinLabel)
        addSubview(passwordTextField)
        addSubview(emailTextFiled)
        addSubview(autologinSwitch)
        addSubview(registerBtn)

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 200).isActive = true

        emailTextFiled.translatesAutoresizingMaskIntoConstraints = false
        emailTextFiled.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        emailTextFiled.centerYAnchor.constraint(equalTo: self.iconImageView.bottomAnchor,constant: 40).isActive = true
        emailTextFiled.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 20).isActive = true
        emailTextFiled.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: -20).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: self.emailTextFiled.bottomAnchor,constant: 30).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 20).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: -20).isActive = true
        
        autologinLabel.translatesAutoresizingMaskIntoConstraints = false
        autologinLabel.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15).isActive = true
        autologinLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 30).isActive = true
        
        autologinSwitch.translatesAutoresizingMaskIntoConstraints = false
        autologinSwitch.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15).isActive = true
        autologinSwitch.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: -30).isActive = true
        
        
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.topAnchor.constraint(equalTo: self.autologinSwitch.bottomAnchor,constant: 20).isActive = true
        loginBtn.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: -20).isActive = true
        loginBtn.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 20).isActive = true
        
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        registerBtn.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        registerBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true


    }
}

