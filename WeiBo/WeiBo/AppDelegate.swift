//
//  AppDelegate.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/29.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 设置UINavigationBar字体颜色
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        // 设置tabbar字体颜色
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

// MARK: - 打印
func HIELog<T>(message: T, filename: String = #file, methodName: String = #function, lindeNumber: Int = #line) {
    let file = filename as NSString
    let lastFileName = file.lastPathComponent
    
    #if DEBUG
        print("Class:\(lastFileName)\n lineNum:\(lindeNumber)\n message:\(message)\n--------------------------------------")
    #endif
}

