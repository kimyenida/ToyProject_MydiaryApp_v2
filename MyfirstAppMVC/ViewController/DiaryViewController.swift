//
//  DiaryViewController.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit
import CoreData
class DiaryViewController: UIViewController,SendDiaryProtocol {
    //프로토콜 메서드 정의
    func sendDiary(title: String, content: String) {
        print("title: \(title), content: \(content)")
        self.saves(board: title, memo: content)
        self.diaryView.myTableView.reloadData()
    }
    
    let coredataMethod = CoreDataMethod()
    let uemail : String = UserDefaults.standard.string(forKey: "email") ?? "" //이메일
    let uid : String = UserDefaults.standard.string(forKey: "id") ?? "" //아이디

    lazy var diaryView = DiaryView()
    var people: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DiaryViewController called")
        diaryView.myTableView.delegate = self
        diaryView.myTableView.dataSource = self
        diaryView.myTableView.register(NewTableViewCell.self, forCellReuseIdentifier: "cellid")
        
        diaryView.myTableView.estimatedRowHeight = 120
        diaryView.myTableView.rowHeight = UITableView.automaticDimension

        diaryView.logoutBtn.addTarget(self, action: #selector(goLogin), for: .touchUpInside)
        diaryView.addWriteBtn.addTarget(self, action: #selector(goWrite), for: .touchUpInside)


    }
    override func loadView() {
        self.view = diaryView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        people = coredataMethod.fetchItemsDiary(uemail: uemail)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc fileprivate func goLogin(){
        print("로그아웃 버튼 clicked")
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "pwd")
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.setValue(false, forKey: "autologin")
        
        //self.dismiss(animated: true)
        if self.presentingViewController == nil{
            print("루트 뷰가 현재 다이어리 컨트롤러 뷰임")
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true)
        }else{
            print("루트 뷰가 로그인 컨트롤러 뷰임")
            self.dismiss(animated: true)
        }
    }

    
    @objc fileprivate func goWrite(){
        let writeviewcontroller = WriteViewController()
        writeviewcontroller.diaryDelegate = self
        writeviewcontroller.modalPresentationStyle = .fullScreen
        self.present(writeviewcontroller, animated: true, completion: nil)
    }
    deinit{
        print("DiaryViewController - deinit 메모리에서 해제!")
    }
    func saves(board:String, memo: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Diary", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        person.setValue(memo, forKey: "content")
        person.setValue(board, forKey: "title")
        person.setValue(uemail, forKey: "email")
        let datetoday = Date()
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분 ss초"
        let result = dataFormatter.string(from: datetoday)
        
        person.setValue(result, forKey: "date")
        do{
            try managedContext.save()
            people.append(person)
        } catch let error as NSError{
            print("could not save. \(error), \(error.userInfo)")
        }
    }
}
extension DiaryViewController:UITableViewDelegate{
   
    
}
extension DiaryViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailviewcontroller = DetailViewController()
        
        let person:NSManagedObject = people[indexPath.row]
        detailviewcontroller.data = person.value(forKey: "content") as? String ?? "데이터없음"

        detailviewcontroller.modalPresentationStyle = .fullScreen
        self.present(detailviewcontroller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let deleteAction = UIContextualAction(style: .destructive, title: "delete", handler: {(ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            context.delete(self.people[indexPath.row])
            self.people.remove(at: indexPath.row)
            do{
                try context.save()
            }catch{
                print("error saving context \(error)")
            }
            self.diaryView.myTableView.reloadData()
            
            success(true)
        })
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //테이블 뷰의 셀 갯수
        //return self.contentArray.count
        return people.count
        
    }
    
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = diaryView.myTableView.dequeueReusableCell(withIdentifier: NewTableViewCell.identifier, for: indexPath) as! NewTableViewCell

        cell.heartImage.tag = indexPath.row
        cell.heartImage.addTarget(self, action: #selector(self.iconBtnclick(sender:)), for: .touchUpInside)
        cell.goodImage.tag = indexPath.row
        cell.goodImage.addTarget(self, action: #selector(self.iconBtnclick(sender:)), for: .touchUpInside)
        cell.shareImage.tag = indexPath.row
        cell.shareImage.addTarget(self, action: #selector(self.iconBtnclick(sender:)), for: .touchUpInside)

        let person:NSManagedObject = people[indexPath.row]
        cell.contentLabel.text = person.value(forKey: "title") as? String
        cell.dateLabel.text = person.value(forKey: "date") as? String
        cell.emailLabel.text = uemail
        cell.idLabel.text = uid
        return cell
    }
    
    @objc func iconBtnclick(sender: UIButton){
        if sender.tintColor == .white{
            
            sender.tintColor = .red
        }
        else{
            sender.tintColor = .white
        }
    }

    
}
