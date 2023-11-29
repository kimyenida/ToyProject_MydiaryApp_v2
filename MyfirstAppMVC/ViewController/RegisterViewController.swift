//
//  RegisterViewController.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    lazy var registerView = RegisterView()
    var people: [NSManagedObject] = []
    let defaults = UserDefaults.standard
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var idvalid:Bool = false
    var pwvalid:Bool = false
    var emailvalid:Bool = false
    
    var coredataMethod = CoreDataMethod()
    
    var idDes : UILabel?
    var emailDes : UILabel?
    var passwordDes : UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("RegisterViewController called")
        
        idDes = registerView.idShouldLabel
        emailDes = registerView.emailShouldLabel
        passwordDes = registerView.passwordShouldLabel
        idDes?.isHidden = true
        emailDes?.isHidden = true
        passwordDes?.isHidden = true
        
        registerView.idTextField.addTarget(self, action: #selector(idTFType), for: .editingDidBegin)
        registerView.idTextField.addTarget(self, action: #selector(idTFType), for: .editingChanged)
        
        registerView.emailTextFiled.addTarget(self, action: #selector(emailTFType), for: .editingChanged)
        registerView.emailTextFiled.addTarget(self, action: #selector(emailTFType), for: .editingDidBegin)

        registerView.passwordTextField.addTarget(self, action: #selector(pwTFType), for: .editingChanged)
        registerView.passwordTextField.addTarget(self, action: #selector(pwTFType), for: .editingDidBegin)
        
        registerView.loginBtn.addTarget(self, action: #selector(goLogin), for: .touchUpInside)
        registerView.registerBtn.addTarget(self, action: #selector(registerClick), for: .touchUpInside)
        

    }
    override func loadView() {
        self.view = registerView
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc fileprivate func goLogin(){
        self.dismiss(animated: true)
    }
    @objc fileprivate func registerClick(){
        if idvalid && emailvalid && pwvalid{
            print("모두 정확한 정보임!")

            coredataMethod.saveRegister(email: registerView.emailTextFiled.text!, id: registerView.idTextField.text!, password: registerView.passwordTextField.text!)
            self.dismiss(animated: true)
            
        } else{
            let alert = UIAlertController(title: "알림", message: "모든 항목을 올바르게 입력해주세요", preferredStyle: .alert)
            let yes = UIAlertAction(title: "Yes", style: .default, handler: nil)
            alert.addAction(yes)
            present(alert, animated: true, completion: nil)
           
        }
    }
    
    @objc func idTFType() {
        idDes?.isHidden = false
        let mincount = 5
        let maxcount = 12
        let count = registerView.idTextField.text!.count
        switch count{
        case 0:
            idDes?.text = TextFieldMethod.init().idshould
            idvalid = false
        case 1..<mincount:
            idDes?.text = TextFieldMethod.init().idtextnumbersUP
            idvalid = false
        case mincount...maxcount:
            let idPattern = TextFieldMethod.init().idPattern!
            let isValidPattern = (registerView.idTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
            if isValidPattern{
                idDes?.text = TextFieldMethod.init().idCorrect
                idDes?.isHidden = true
                idvalid = true
        } else{
            idDes?.text = TextFieldMethod.init().idPatternshould
            idvalid = false
        }
        default:
            idvalid = false
            idDes?.text = TextFieldMethod.init().idtextnumbersDown
    }

    }
    @objc func emailTFType() {
        emailDes?.isHidden = false
        let emailPattern = TextFieldMethod.init().emailPattern!
        let isValidPattern = (registerView.emailTextFiled.text!.range(of: emailPattern, options: .regularExpression) != nil)
            
        if registerView.emailTextFiled.text!.isEmpty{
                emailDes?.text = TextFieldMethod.init().emailshould
                emailvalid = false
            } else if isValidPattern{
                emailDes?.text = TextFieldMethod.init().emailCorrect
                emailDes?.isHidden = true
                emailvalid = true
            } else{
                emailDes?.text = TextFieldMethod.init().emailNotCorrect
                emailvalid = false
            }
            
        }
    @objc func pwTFType() {
        passwordDes?.isHidden = false
            
        let mincount = 8
        let maxcount = 16
        let count = registerView.passwordTextField.text!.count
            
        switch count{
        case 0:
            passwordDes?.text = TextFieldMethod.init().passwordshould
            pwvalid = false
        case 1..<mincount:
            passwordDes?.text = TextFieldMethod.init().passwordtextnumbersUP
            pwvalid = false
        case mincount...maxcount:
            let pwPattern = TextFieldMethod.init().passwordPattern!
            let isValidPattern = (registerView.passwordTextField.text!.range(of: pwPattern, options: .regularExpression) != nil)
            if isValidPattern{
                passwordDes?.text = TextFieldMethod.init().passwordCorrect
                passwordDes?.isHidden = true
                pwvalid = true
            } else{
                passwordDes?.text = TextFieldMethod.init().passwordPatternshould
                pwvalid = false
            }
        default:
            pwvalid = false
            passwordDes?.text = TextFieldMethod.init().passwordtextnumbersDown
        }
        }

}
