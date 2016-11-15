//
//  HeaderReusableView.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/9.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    //点击事件
    var jumpClosure: IngreJumpClosure?
    //var allModel:HomePageschannelpagemodules?
    //数据
    var  FourDataHeaderModel:dataArray? {
        didSet {
            configText((FourDataHeaderModel?.weekday)!)
            
        }
    }
    
    private var imageView:UIImageView?
    //文字
    private var titleLabel
    : UILabel?
    private var  iconW:CGFloat=44
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        //白色背景
        let bgView = UIView.createView()
        //bgView.backgroundColor = UIColor.grayColor()
        bgView.frame = CGRectMake(0, 10, bounds.size.width, 44)
        addSubview(bgView)
        titleLabel=UILabel(frame: CGRect(x: 0, y: 10, width: screenWidth, height: 44))
        titleLabel!.textAlignment = .Center
        titleLabel!.textColor=UIColor.redColor()
        titleLabel!.font=UIFont.boldSystemFontOfSize(7)
        titleLabel!.font=UIFont.systemFontOfSize(19)
        addSubview(titleLabel!)
        
        //图片
        let image=UIImage(named: "more_icon")
        imageView=UIImageView(image:image)
        bgView.addSubview(imageView!)
        
        
    }
    private func configText(text: String) {
        titleLabel?.text=("发布:")+(FourDataHeaderModel?.weekday)!+("     时间:")+(FourDataHeaderModel?.week)!
        
        //修改位置
        titleLabel?.frame=CGRectMake(60, 10, 200, 44)
        imageView?.frame=CGRectMake(titleLabel!.frame.origin.x-50, 0, iconW, iconW)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
