//
//  ProfileViewController.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   view.backgroundColor=UIColor.whiteColor()
        let label=UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 220))
        label.backgroundColor=UIColor.orangeColor()
        view.addSubview(label)
        let btn=UIButton(frame: CGRect(x: 40, y: 100, width: 60, height: 60))
        btn.setBackgroundImage(UIImage(named: "default_head_51x51_@1x.png"), forState: .Normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btn)
        
        let label1=UILabel(frame: CGRect(x: 140, y: 110, width: 100, height: 30))
        label1.text="马上登录"
        label1.textColor=UIColor.whiteColor()
        label1.font=UIFont.systemFontOfSize(16)
        view.addSubview(label1)
        
        //下载
          let btn1=UIButton(frame: CGRect(x: screenWidth-140, y: 100, width: 60, height: 60))
        btn1.setImage(UIImage(named: "detail_cache_30x30_@2x.png"), forState: .Normal)
         btn1.addTarget(self, action: #selector(btn1Click(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btn1)
        
        //分享
        let btn2=UIButton(frame: CGRect(x: screenWidth-70, y: 100, width: 60, height: 60))
        btn2.setImage(UIImage(named: "detail_share_30x30_@2x.png"), forState: .Normal)
        btn2.addTarget(self, action: #selector(btn2Click(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btn2)
   
        let btnNames=["收藏","上传","会员"]
        let btnImage=["ic_my_fav_22x22_@1x.png","ic_my_upload_22x22_@1x.png","ic_my_member_22x22_@2x.png"]
        for i in 0...btnImage.count-1{
            let width=screenWidth/CGFloat(3)
            let btn3=UIButton(frame: CGRect(x: width*CGFloat(i), y: 220, width: screenWidth/3, height: 80))
            btn3.setTitleColor(UIColor.blackColor(), forState: .Normal)
            btn3.setTitle(btnNames[i], forState: .Normal)
            btn3.setImage(UIImage(named: btnImage[i]), forState: .Normal)
            btn3.titleLabel?.textAlignment = .Right
            btn.tag=100+i
            btn.addTarget(self, action: #selector(btn3Click(_:)), forControlEvents: .TouchUpInside)
            view.addSubview(btn3)
        }
        
       
        
        let scrollView=UIScrollView(frame: CGRect(x: 0, y: 300, width: screenWidth, height: 400))
       // scrollView.backgroundColor=UIColor.init(patternImage: UIImage(named: "witch_206x250_@2x.png")!)
        scrollView.contentSize=CGSize(width: screenWidth, height: 650)
        scrollView.pagingEnabled=true
               let image=UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 500))
        image.image=UIImage(named: "witch_206x250_@2x.png")
        view.addSubview(scrollView)
        scrollView.addSubview(image)
        
       
    }
    func btnClick(btn:UIButton){
        
    }
    

    func btn1Click(btn1:UIButton){
        let view1=EnshrineViewController()
        navigationController?.pushViewController(view1, animated: true)

    }

    func btn2Click(btn2:UIButton){
        let view1=EnshrineViewController()
        navigationController?.pushViewController(view1, animated: true)
        
    }
    func btn3Click(btn3:UIButton){
    if btn3.tag == 100{
            let view1=EnshrineViewController()
            navigationController?.pushViewController(view1, animated: true)
      }else if btn3.tag==101{
        let view1=EnshrineViewController()
        navigationController?.pushViewController(view1, animated: true)
      }else if btn3.tag==102{
        let view1=EnshrineViewController()
        navigationController?.pushViewController(view1, animated: true)
        }

        
        
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
