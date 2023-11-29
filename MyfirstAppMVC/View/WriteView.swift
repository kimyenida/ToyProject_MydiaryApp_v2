//
//  WriteView.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit

class WriteView: UIView {

    
    var titleLabel : UILabel = {
        var label = UILabel()
        label.text = "나의 하루 쓰기"
        label.textColor = .black
        return label
    }()
    
    var titleTextField : UITextField = {
        var textFiled = UITextField()
        textFiled.borderStyle = .roundedRect
        textFiled.textColor = .black
        textFiled.text = ""
        textFiled.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textFiled.attributedPlaceholder = NSAttributedString(string: "제목을 입력하세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, .font:UIFont.systemFont(ofSize: 13)])
        return textFiled
    }()
    var contentTextView : UITextView = {
       var textView = UITextView()
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.text = "내용을 입력하세요"
        textView.font = UIFont.systemFont(ofSize: 13)
        textView.textColor = UIColor.lightGray
        textView.layer.borderWidth = 0.2
        textView.layer.borderColor = UIColor.black.cgColor
        return textView
    }()
    
    var homeBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle("닫기", for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        
        btn.setImage(UIImage(systemName: "x.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        btn.setTitleColor(.white, for: .normal)
        btn.widthAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.width + 10.0 * 3.0).isActive = true
        btn.heightAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.height + 10.0 * 2.0).isActive = true
   
        return btn
    }()
    var saveWriteBtn : UIButton = {
        var btn = UIButton()
        btn.setTitle("저장하기", for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        
        btn.setImage(UIImage(systemName: "square.and.arrow.down.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(hexCode: "#85A3FF", alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.widthAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.width + 10.0 * 3.0).isActive = true
        btn.heightAnchor.constraint(equalToConstant: btn.titleLabel!.intrinsicContentSize.height + 10.0 * 2.0).isActive = true
   
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("WriteView called")
        self.backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    func setup(){
        addSubview(titleLabel)
        addSubview(homeBtn)
        addSubview(saveWriteBtn)
        addSubview(titleTextField)
        addSubview(contentTextView)


        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 40).isActive = true
        
        homeBtn.translatesAutoresizingMaskIntoConstraints = false
        homeBtn.rightAnchor.constraint(equalTo: self.titleLabel.leftAnchor, constant: -70).isActive = true
        homeBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 30).isActive = true
        
        
        saveWriteBtn.translatesAutoresizingMaskIntoConstraints = false
        saveWriteBtn.leftAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: 30).isActive = true
        saveWriteBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 30).isActive = true
        
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        titleTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 30).isActive = true
        
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        contentTextView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        contentTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true

        contentTextView.topAnchor.constraint(equalTo: self.titleTextField.bottomAnchor, constant: 0).isActive = true
    }
    

}
