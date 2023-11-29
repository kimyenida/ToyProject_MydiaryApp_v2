//
//  TabBarViewController.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/27/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingVC()
        let diaryvc = DiaryViewController()
        let nextvc = MovieViewController()
        
        diaryvc.title = "일기장"
        nextvc.title = "영화"
        
        diaryvc.tabBarItem.image = UIImage.init(systemName: "note.text")
        nextvc.tabBarItem.image = UIImage.init(systemName: "figure.wave")
        
        diaryvc.navigationItem.largeTitleDisplayMode = .always
        nextvc.navigationItem.largeTitleDisplayMode = .always
        //
        viewControllers = [diaryvc,nextvc]
    }
    
    
    func settingVC(){
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        self.tabBar.unselectedItemTintColor = .lightGray
        self.tabBar.layer.borderWidth = 0.4
        self.tabBar.tintColor = .black
    }

}
