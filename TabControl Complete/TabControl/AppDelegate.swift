//
//  AppDelegate.swift
//  TabControl
//
//  Created by Milan Kamilya on 21/06/16.
//  Copyright © 2016 innofied. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let arrayOfImages = [ "Home", "Chats", "Contacts", "Settings", "Search"]
    let arrayOfColors = [ UIColor.orangeColor(), UIColor.brownColor(), UIColor.greenColor(), UIColor.redColor(), UIColor.blueColor()]


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabBar = TCTabBarController()
        tabBar.viewControllers = self.getArrayOfViewController()
        self.customiseTabItems(tabBar.tabBar)
        
        self.window?.rootViewController = tabBar
        self.window?.makeKeyAndVisible()
        
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

    
    func getArrayOfViewController() -> [ViewController] {
        
        var arrayOfVC = [ViewController]()
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
        
        for i in 0..<5 {
            let vc = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            
            vc.textForTitle = arrayOfImages[i]
            vc.view.backgroundColor = arrayOfColors[i]
            
            arrayOfVC.append(vc)
        }
        
        return arrayOfVC
    }
    
    func customiseTabItems(tabBar: UITabBar) {
        
        for item in tabBar.items! {
            item.image = UIImage(named: arrayOfImages[tabBar.items!.indexOf(item)!])
            item.title = arrayOfImages[tabBar.items!.indexOf(item)!]
        }
        
    }
    
    
    
}

