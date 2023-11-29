//
//  DetailViewController.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit
import SwiftOpenAI
import OpenAI

class DetailViewController: ExtensionViewController {
  
    lazy var detailView = DetailView()
    var data : String = ""
   
    let openAI = SwiftOpenAI(apiKey: Bundle.main.gpt_apikey)
    weak var sv:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailViewController called")
        detailView.contentLabel.text = data
        detailView.homeBtn.addTarget(self, action: #selector(goLogin), for: .touchUpInside)
        detailView.gptBtn.addTarget(self, action: #selector(goGpt), for: .touchUpInside)
        
    }
    override func loadView() {
        self.view = detailView
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc fileprivate func goLogin(){
        self.dismiss(animated: true)
    }
    
    
    //gpt버튼 눌렀을 때 함수
    @objc fileprivate func goGpt(){
        print("goGpt function called")
        
        //로딩창 실행
        sv = UIViewController.displaySpinner(onView: self.detailView)
        
        //Task는 비동기 context, 이 안에서 비동기 함수 호출가능(앞에 awite붙여서), Task안에서는 순차적으로 실행된다. 
        Task{
            @MainActor in
            do {
                let prompt = "사용자가 작성한 일기에 대해서 200자 이내로 위로 혹은 격려 혹은 칭찬과 같은 긍정적인 답변을 해줘. 사용자의 일기 : \(detailView.contentLabel.text)"
                let result = try await openAI.createChatCompletions(model: .gpt3_5(.gpt_3_5_turbo_1106), messages: [.init(text: prompt, role: .user)])
                print(result?.choices.first?.message.content ?? "GPT가 답변을 받지 못하였음")
                detailView.gptLabel.text = result?.choices.first?.message.content ?? "GPT가 답변을 받지 못하였음"
                UIViewController.removeSpinner(spinner: sv)
                self.detailView.gptBtn.isEnabled = false
                self.detailView.gptBtn.setTitle("답변완료", for: .normal)
            }catch{
                self.detailView.gptLabel.text = "GPT가 답변을 받지 못했습니다. 다시 시도해주세요"
                print(error)
            }
        }
        
    }
   
    

}
