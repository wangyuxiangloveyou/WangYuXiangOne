//
//  NavigationBarProtocol.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zhb. All rights reserved.
//

import Foundation
import Foundation
import UIKit

enum BarButtonPosition {
    case left
    case right
}

protocol navigationprotocol:NSObjectProtocol {
    func addTitle(title:String)
    func addBarButton(title:String?,bgImageName:String?,postion:BarButtonPosition,select:Selector)
}

extension navigationprotocol where Self:UIViewController{
    func addTitle(title:String){
        let label=UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        label.font=UIFont.boldSystemFontOfSize(22)
        label.textColor=UIColor.blackColor()
        label.textAlignment = .Center
        label.text = title
        navigationItem.titleView=label
        navigationController?.navigationBar.setBackgroundImage(UIImage(named:"top-bg.png"), forBarMetrics: .Default)
    }
    
    func addBarButton(title:String?=nil,bgImageName:String?=nil,postion:BarButtonPosition,select:Selector){
        let btn=UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        if title != nil{
            btn.setTitle(title, forState: .Normal)
        }
        if bgImageName != nil{
            btn.setBackgroundImage(UIImage(named:bgImageName!) , forState: .Normal)
        }
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        btn.addTarget(self, action: select, forControlEvents: .TouchUpInside)
        let tabBUttonItem=UIBarButtonItem(customView: btn)
        if postion == .left{
            if (navigationItem.leftBarButtonItems != nil){
                navigationItem.leftBarButtonItems=navigationItem.leftBarButtonItems!+[tabBUttonItem]
            }else{
                navigationItem.leftBarButtonItems=[tabBUttonItem]
            }
        }else{
            if navigationItem.rightBarButtonItems != nil{
                navigationItem.rightBarButtonItems=navigationItem.rightBarButtonItems!+[tabBUttonItem]
                
            }else{
                navigationItem.rightBarButtonItems=[tabBUttonItem]
                
            }
        }
}
}
