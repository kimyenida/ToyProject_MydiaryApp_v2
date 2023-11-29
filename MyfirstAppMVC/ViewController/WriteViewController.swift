//
//  WriteViewController.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit

protocol SendDiaryProtocol{
    func sendDiary(title:String, content:String)
}

class WriteViewController: UIViewController,UITextViewDelegate {
    var diaryDelegate : SendDiaryProtocol?
    lazy var writeView = WriteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("WriteViewController called")
        writeView.contentTextView.delegate = self

        writeView.homeBtn.addTarget(self, action: #selector(gohome), for: .touchUpInside)
        writeView.saveWriteBtn.addTarget(self, action: #selector(saveWrite), for: .touchUpInside)


    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.writeView.contentTextView.text.isEmpty{
            self.writeView.contentTextView.text = "내용을 입력하세요"
            self.writeView.contentTextView.textColor = .lightGray
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.writeView.contentTextView.textColor == UIColor.lightGray{
            self.writeView.contentTextView.text = nil
            self.writeView.contentTextView.textColor = .black
        }
    }
    override func loadView() {
        self.view = writeView
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc fileprivate func gohome(){
        self.dismiss(animated: true)
    }
    
    @objc fileprivate func saveWrite(){
        if self.writeView.titleTextField.text == nil || self.writeView.titleTextField.text == "" || self.writeView.contentTextView.text == nil || self.writeView.contentTextView.text.isEmpty || self.writeView.contentTextView.textColor == UIColor.lightGray{
            print("nono data")
            return
        }
        diaryDelegate?.sendDiary(title: self.writeView.titleTextField.text!, content: self.writeView.contentTextView.text)
        self.dismiss(animated: true)
    }


}
