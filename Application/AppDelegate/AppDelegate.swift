//
//  AppDelegate.swift
//  Application
//
//  Created by Alok Singh on 4/17/20.
//  Copyright © 2020 Alok Singh. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Utility.setupApp(launchOptions: launchOptions)
        Utility.setupCommonAppearance()
        return true
    }

}

 
