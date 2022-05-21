//
//  AppDelegate.swift
//  Daily-Bill
//
//  Created by Jackey on 2022/05/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        DispatchQueue.main.async {
            let sqlManager: SqlManager = SqlManager.shareInstance
            let result1: Bool = sqlManager.tallylist_create()
            let result2: Bool = sqlManager.summary_create()
            let result3: Bool = sqlManager.consumetype_create()
            if result1 && result2 && result3{
                print("TallyListTBcreate success")
            }else{
                print("TallyListTBcreate fail")

            }
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

