//
//  MainTabBarViewController.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createRoot()
       
    }
    func createRoot(){
        //let tabBarController=UITabBarController()
        let namesVC=["WangyuxiangLivevideo.HomePageViewController","WangyuxiangLivevideo.SubscibeViewController","WangyuxiangLivevideo.DiscoverViewController","WangyuxiangLivevideo.ProfileViewController"]
      let titles=["首页","订阅","收藏","我的"]
        let images=["ic_tab_home_27x27_@2x","ic_tab_discover_27x27_@2x","ic_tab_member_27x27_@2x","ic_tab_my_27x27_@2x"]
        var ctrlArray=[UINavigationController]()
        for i in 0..<namesVC.count{
            let vcClass=NSClassFromString(namesVC[i]) as! UIViewController.Type
            //用class创建对象
            let vc=vcClass.init()
            
           vc.title=titles[i]
            let navCtrl=UINavigationController(rootViewController: vc)
            navCtrl.tabBarItem.image=UIImage(named: images[i])
            navCtrl.tabBarItem.selectedImage=UIImage(named: "\(images[i])_select")
            ctrlArray.append(navCtrl)
            
            //navigationController?.navigationBar.hidden=true
        }
       
        viewControllers=ctrlArray
        //window?.rootViewController=tabBarController
    }
//    //显示tabbar
//    func showTabBar(){
//        
//        UIView.animateWithDuration(0.25) {
//            self.bgView?.hidden = false
//        }
//        
//        
//    }
//    
//    //隐藏tabbar
//    func hideTabBar() {
//        UIView.animateWithDuration(0.25) {
//            self.bgView?.hidden = true
//        }
//        
//    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
