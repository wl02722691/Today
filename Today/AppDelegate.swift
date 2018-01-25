//
//  AppDelegate.swift
//  Today
//
//  Created by 張書涵 on 2017/12/27.
//  Copyright © 2017年 AliceChang. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
  
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
            print("applicationDidEnterBackground")
        //切換別的App時 你的App還會在背景運作
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       }

    func applicationDidBecomeActive(_ application: UIApplication) {
      }

   
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }}
    
