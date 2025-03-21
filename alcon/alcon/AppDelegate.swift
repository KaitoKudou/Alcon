//
//  AppDelegate.swift
//  alcon
//
//  Created by 工藤海斗 on 2021/03/25.
//

import FirebaseAuth
import FirebaseCore
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //ナビゲーションバー
        UINavigationBar.appearance().tintColor = UIColor(hex: "73AADD")
        UINavigationBar.appearance().barTintColor = UIColor(hex: "C3E2FF")
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(hex: "73AADD"), NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        //タブバーコントローラー
        UITabBar.appearance().tintColor = UIColor(hex: "73AADD")
        UITabBar.appearance().barTintColor = UIColor(light: .white, dark: UIColor(hex: "242629"))
        UITabBar.appearance().isTranslucent = false
        
        FirebaseApp.configure()
        
        Auth.auth().signInAnonymously { [weak self] (authDataResult, error) in
            guard self != nil else { return }
            if let error = error {
                print("匿名認証に失敗：", error)
                return
            }
            guard let user = authDataResult?.user else { return }
            print("匿名認証成功　user's uid: ", user.uid)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

