//
//  HiddenTabViewController.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class HiddenTabViewController: BaseViewController {
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
//        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
//        let mainCtrl = appDele.window?.rootViewController as! MainTabBarViewController
        //mainCtrl.hideTabBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
//        let mainCtrl = appDele.window?.rootViewController as! MainTabBarViewController
        //mainCtrl.showTabBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

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
