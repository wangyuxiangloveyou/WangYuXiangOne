//
//  HomePageHotCell.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class HomePageHotCell: UITableViewCell {
    
    var jumpClosure: IngreJumpClosure?
    //显示数据
    var homemodel:[HomePageschannelpagelabels]?{
        didSet{
            //显示数据
            showData()
            
        }
        
    }

    
    @IBAction func btnClick(sender: UIButton) {
       
    }
       //显示数据
    
    func showData(){
        for  i in 0..<(homemodel?.count)!{
        let label=contentView.viewWithTag(200+i)
            if label?.isKindOfClass(UILabel)==true{
                let tmplabel=label as! UILabel
                tmplabel.text=homemodel![i].label_title
                
                
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //创建cell的方法
    class func creathomeCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,homemodel:[HomePageschannelpagelabels]?)->HomePageHotCell{
        
        let cellId="homePageHotCellid"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? HomePageHotCell
        if nil == cell {
           cell=NSBundle.mainBundle().loadNibNamed("HomePageHotCell", owner: nil, options: nil).last as? HomePageHotCell
            
        }
        //显示数据
        
        cell!.homemodel=homemodel
        return cell!
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
