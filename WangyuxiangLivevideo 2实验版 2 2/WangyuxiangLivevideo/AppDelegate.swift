//
//  AppDelegate.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import MJRefresh
import SnapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       //let ud = NSUserDefaults.standardUserDefaults()
        window?.rootViewController=GuideViewController()
        
//        let mainctrl=MainTabBarViewController()
//        window?.rootViewController=mainctrl
        return true
    }
//    func createRoot(){
//         let tabBarController=UITabBarController()
//        let namesVC=["WangyuxiangLivevideo.HomePageViewController","WangyuxiangLivevideo.SubscibeViewController","WangyuxiangLivevideo.DiscoverViewController","WangyuxiangLivevideo.ProfileViewController"]
//        let titles=["首页","订阅","发现","我的"]
//        let images=["ic_tab_home_27x27_@2x","ic_tab_discover_27x27_@2x","ic_tab_member_27x27_@2x","ic_tab_my_27x27_@2x"]
//        var viewControllers:[UIViewController]=[]
//        for i in 0..<namesVC.count{
//            let vcClass=NSClassFromString(namesVC[i]) as! UIViewController.Type
//            //用class创建对象
//            let vc=vcClass.init()
//            vc.title=titles[i]
//            let nav=UINavigationController(rootViewController: vc)
//            nav.tabBarItem.image=UIImage(named: images[i])
//            nav.tabBarItem.selectedImage=UIImage(named: "\(images[i])_select")
//            viewControllers.append(nav)
//        }
//        tabBarController.viewControllers=viewControllers
//        window?.rootViewController=tabBarController
//    }
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

