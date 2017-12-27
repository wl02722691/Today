//
//  AppDelegate.swift
//  Today
//
//  Created by 張書涵 on 2017/12/27.
//  Copyright © 2017年 AliceChang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        return true
        //比viewDidLoad還要更早讀取
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
        print("applicationWillTerminate")
        //把App從緩存中刪除的狀況
    }

}

