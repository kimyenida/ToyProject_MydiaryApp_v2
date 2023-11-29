//
//  LoginViewController.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit
import CoreData
class LoginViewController: UIViewController {
    lazy var loginview = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController called")
        loginview.registerBtn.addTarget(self, action: #selector(goRegister), for: .touchUpInside)
        loginview.loginBtn.addTarget(self, action: #selector(loginBtnclick), for: .touchUpInside)
        loginview.autologinSwitch.addTarget(self, action: #selector(autologinSwichClick), for: .valueChanged)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        loginview.autologinSwitch.isOn = UserDefaults.standard.bool(forKey: "autologin")
    }
    override func loadView() {
        self.view = loginview
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @objc fileprivate func goRegister(){
        let registerViewController = RegisterViewController()
        registerViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(registerViewController, animated: true)
    }
    
    @objc fileprivate func loginBtnclick(){
        var uemail:String = ""
        var upassword:String = ""
        var uid:String = ""
        
        // 텍스트필드에 적힌 이메일과 비번
        guard let validationEmail = loginview.emailTextFiled.text, let validationPWD = loginview.passwordTextField.text else{
            return}
       
        if validationPWD == "" && validationEmail == ""{
            let alerts = UIAlertController(title: "로그인 실패", message: "이메일 혹은 비밀번호를 모두 입력하세요", preferredStyle: .alert)
            let actions = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerts.addAction(actions)
            present(alerts, animated: true, completion: nil)
            return
        }
        guard let appDelegate:AppDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Info")
        let predicate = NSPredicate(format: "email == %@", validationEmail)
        fetchRequest.predicate = predicate
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result {
                uemail = data.value(forKey: "email") as! String
                upassword = data.value(forKey: "password") as! String
                uid = data.value(forKey: "id") as! String
                print("----------------")
                print(uemail)
                print(upassword)
                print(uid)
                print("----------------")
            }
        } catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        if validationEmail == uemail && validationPWD == upassword{
            print("로그인성공 다 들어맞음")
//            if autologinSwitch.isOn{
                UserDefaults.standard.setValue(uid, forKey: "id")
                UserDefaults.standard.setValue(uemail, forKey: "email")
                UserDefaults.standard.setValue(upassword, forKey: "pwd")
                let diaryVC = DiaryViewController()
                diaryVC.modalPresentationStyle = .fullScreen
                self.present(diaryVC, animated: true)
//            }
            
        }
        else{
            //실패
            let alert = UIAlertController(title: "로그인 실패", message: "이메일 혹은 비밀번호가 틀립니다", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func autologinSwichClick(){
        if loginview.autologinSwitch.isOn{
            print("자동로그인 설정합니다!")
            UserDefaults.standard.setValue(true, forKey: "autologin")

        } else{
            print("자동로그인 해제")
            UserDefaults.standard.setValue(false, forKey: "autologin")

        }
    }
}
