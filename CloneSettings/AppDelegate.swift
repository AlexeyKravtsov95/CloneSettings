//
//  AppDelegate.swift
//  CloneSettings
//
//  Created by a.kravcov on 26.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        let navigationController = UINavigationController.init(rootViewController: ViewController())
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

