//
//  AppDelegate.swift
//  aaa
//
//  Created by my on 2023/7/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: CarListVC())
        
        print("realm url:\(RealmUtil.defalut.fileURL)")
        
        
        return true
    }



}

