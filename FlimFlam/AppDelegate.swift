//
//  AppDelegate.swift
//  FlimFlam
//
//  Created by Marcy Vernon on 10/31/18.
//  Copyright © 2018 Marcy Vernon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.backgroundColor = UIColor(red: (0/255), green: (134/255) , blue:  (165/255), alpha: 1.0)
        return true
    }
    
//    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//        return [.portraitUpsideDown, .portrait]
//    }

    func applicationWillResignActive   (_ application: UIApplication) {}
    func applicationDidEnterBackground (_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive    (_ application: UIApplication) {}
    func applicationWillTerminate      (_ application: UIApplication) {}
}
