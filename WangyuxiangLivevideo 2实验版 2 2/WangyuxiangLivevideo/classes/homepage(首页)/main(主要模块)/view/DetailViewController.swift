//
//  DetailViewController.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIWebViewDelegate {
    var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.automaticallyAdjustsScrollViewInsets=false
        webView=UIWebView(frame: CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height+5))
        //创建一个url（网址）
        let url=NSURL(string:urlstring!)
        //创建一个请求
        let request=NSURLRequest(URL: url!)
        //加载请求
        webView.loadRequest(request)
        webView.delegate=self
       //self.hidesBottomBarWhenPushed=false
        view.addSubview(webView)
        }
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        self.parentViewController?.hidesBottomBarWhenPushed=true
//    }
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//         parentViewController!.hidesBottomBarWhenPushed = true
//    }
//    override func viewDidDisappear(animated: Bool) {
//        super.viewDidDisappear(animated)
//          navigationController?.presentedViewController!.hidesBottomBarWhenPushed = true
//    }
//      override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController!.parentViewController?.hidesBottomBarWhenPushed=true
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
