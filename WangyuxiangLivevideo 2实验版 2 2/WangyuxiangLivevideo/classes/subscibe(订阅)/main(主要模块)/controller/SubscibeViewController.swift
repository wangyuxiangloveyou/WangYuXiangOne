//
//  SubscibeViewController.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit


class SubscibeViewController: BaseViewController {
     var model:FirstModel?
    var jumpClosure: IngreJumpClosure?

    //滚动视图
    private var scrollView:UIScrollView?
    //firstView视图
    private var firstView:fourImageView?
    //secondView视图
    private var secondView:subscriptionView?
    //thirdView视图
    private var thirdView:subscriptionView?
    
    private var fourView:subscriptionView?
    //导航上面的选择控件
    private var segCtrl:KtcSegCtrl?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.whiteColor()
         automaticallyAdjustsScrollViewInsets=false
         creatHomePage()
         creatNav()
       
    }
    //创建首页视图
    func creatHomePage(){
        scrollView=UIScrollView()
        scrollView!.pagingEnabled=true
        //设置代理
        scrollView?.delegate=self
        
        view.addSubview(scrollView!)
        //约束
        scrollView!.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        }
        //容器视图
        let containerView=UIView.createView()
        scrollView!.addSubview(containerView)
        containerView.snp_makeConstraints { (make) in
            make.edges.equalTo(scrollView!)
            make.height.equalTo(scrollView!)
        }
        //添加子视图
        //1.firstView子视图
        firstView=fourImageView()
        containerView.addSubview(firstView!)
        firstView?.jumpClosure = {
            (str) in
            let web=FourDetailViewController1()
            urlstring=str
            self.navigationController?.pushViewController(web, animated: true)
        }

        firstView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.left.equalTo(containerView)
            make.width.equalTo(screenWidth)
        })
        //2.secondView视图
        secondView=subscriptionView()
        urlone=secondUrl
        secondView?.loadData1()
        containerView.addSubview(secondView!)
        secondView?.jumpClosure = {
            (str) in
            let web=DetailViewController()
            urlstring=str
            self.navigationController?.pushViewController(web, animated: true)
        }

        secondView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(screenWidth)
            make.left.equalTo((firstView?.snp_right)!)
        })
        //3.thirdView视图
         thirdView=subscriptionView()
         urlone=thirdUrl
        thirdView?.loadData1()
        containerView.addSubview(thirdView!)
        thirdView?.jumpClosure = {
            (str) in
            let web=DetailViewController()
            urlstring=str
            self.navigationController?.pushViewController(web, animated: true)
        }

        thirdView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(screenWidth)
            make.left.equalTo((secondView?.snp_right)!)
            
        })
        //第四个视图
        fourView=subscriptionView()
       urlone=firistUrl
        fourView?.loadData1()
         containerView.addSubview(fourView!)
        fourView?.jumpClosure = {
            (str) in
            let web=DetailViewController()
            urlstring=str
            self.navigationController?.pushViewController(web, animated: true)
        }
       
        fourView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(screenWidth)
            make.left.equalTo((thirdView?.snp_right)!)
            
        })

        //修改容器视图大小
        containerView.snp_makeConstraints { (make) in
            make.right.equalTo(fourView!)
        }
        
        
    }
          
    func creatNav(){
        addNavBtn("", target: self, action: #selector(scanAction), isLeft: true)
        
        addNavBtn("button_icon_refresh_landscape@2x", target: self, action: #selector(searchAction), isLeft: false)
        
        //选择控件
        let frame=CGRectMake(80, 0, screenWidth-80*2, 44)
        segCtrl=KtcSegCtrl(frame: frame, titleArray: ["影片","动画","音乐","动漫"])
        segCtrl!.delegate=self
        navigationItem.titleView=segCtrl
    }
    func scanAction(){
        // print("扫一扫")
    }
    func searchAction(){
        //print("搜索")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    

}



//Mark: KtcSegCtrl代理
extension SubscibeViewController:KtcSegCtrlDelegate{
    func segCtrl(segCtrl: KtcSegCtrl, didClickBtnIndex index: Int) {
        scrollView?.setContentOffset(CGPointMake(CGFloat(index)*screenWidth, 0), animated: true)
         //print(index)

    }
}

//Mark: scrollView代理

extension SubscibeViewController:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index=scrollView.contentOffset.x/scrollView.bounds.size.width
        segCtrl?.selectIndex=Int(index)
                 }
}

