//
//  AppDelegate.swift
//  SocketIOChat
//
//  Created by Nguyễn Văn Tú on 11/18/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        SocketIOManager.sharedInstance.connect()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        SocketIOManager.sharedInstance.disconnect()
    }
}

