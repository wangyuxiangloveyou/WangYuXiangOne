//
//  FourLabelCell.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class FourLabelCell: UITableViewCell {
    
    var jumpClosure: IngreJumpClosure?

    @IBAction func btnClick(sender: UIButton) {
    }
    
    
    //显示数据
    var homemodel1:[HomePageschannelpagelabels]?{
        didSet{
            //显示数据
           // print(homemodel1)
            showData()
            
        }
        
    }
    func showData(){
        for  i in 0...3{
            let label=contentView.viewWithTag(200+i)
            if label?.isKindOfClass(UILabel)==true{
                let tmplabel=label as! UILabel
                tmplabel.text=homemodel1![i].label_title
              // print(homemodel1![i].label_title)
                
            }
        }
    }
    //创建cell的方法
    class func creatFourLabelCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,homemodel1:[HomePageschannelpagelabels]?)->FourLabelCell{
        
        let cellId="fourLabelCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? FourLabelCell
        if nil == cell {
           
            cell=NSBundle.mainBundle().loadNibNamed("FourLabelCell", owner: nil, options: nil).last as? FourLabelCell
            
        }
        //显示数据
        
        cell!.homemodel1=homemodel1
        return cell!
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
