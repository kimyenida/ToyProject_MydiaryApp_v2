//
//  SceneDelegate.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/22/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var appSwitcherModeImageView = UIImageView()
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("SceneDelegate - willConnectTo")

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        if UserDefaults.standard.bool(forKey: "autologin") == true{
            print("이게 뭐시람 true 인가 false인가")
            let data1 = UserDefaults.standard.string(forKey: "email")
            let data2 = UserDefaults.standard.string(forKey: "pwd")
            let data3 = UserDefaults.standard.string(forKey: "id")
            let data4 = UserDefaults.standard.string(forKey: "autologin")
            print(data1,data2,data3)
            if let email = data1, let pwd = data2, let id = data3 {
                print(email)
                print(pwd)
                print(id)
                
                print("자동로그인 성공쓰")
                window.rootViewController = TabBarViewController()
            } else{
                window.rootViewController = LoginViewController()
            }
        }
        else{
            window.rootViewController = TabBarViewController()
        }

        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("SceneDelegate - sceneDidDisconnect")

        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("SceneDelegate - sceneDidBecomeActive")
        appSwitcherModeImageView.removeFromSuperview()

    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("SceneDelegate - sceneWillResignActive")
        setUpAppSwitcherMode()


    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("SceneDelegate - sceneWillEnterForeground")

        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("SceneDelegate - sceneDidEnterBackground")

        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    private func setUpAppSwitcherMode(){
        guard let window = window else{
            return
        }
        appSwitcherModeImageView = UIImageView(frame: window.frame)
        appSwitcherModeImageView.image = UIImage(named: "screen")
        appSwitcherModeImageView.contentMode = .scaleToFill
        appSwitcherModeImageView.backgroundColor = .purple
        window.addSubview(appSwitcherModeImageView)
    }
}

