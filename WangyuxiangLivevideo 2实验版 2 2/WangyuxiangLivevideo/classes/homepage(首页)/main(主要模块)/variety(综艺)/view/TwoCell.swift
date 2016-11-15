//
//  TwoCell.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class TwoCell: UITableViewCell {

       
    @IBAction func btnClick(sender: UIButton) {
    }
    var homePageModel5: [Homescardsinf2]? {
        didSet {
            showData()
            //print(homePageModel4)
        }
    }
    
    func showData(){
        
        for i in 0...1{
            
            let imageData=homePageModel5![i]
            let tmpView=contentView.viewWithTag(200+i)
            if tmpView?.isKindOfClass(UIImageView)==true{
                let btn=tmpView as! UIImageView
                let url = NSURL(string:(imageData.image_448_252)!)
               
                btn.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "38bg_failed_black@2x"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                
            }
           // titleName.text=homePageModel4![i].title
        let tmpView1=contentView.viewWithTag(300+i)
            if tmpView1?.isKindOfClass(UILabel)==true{
                let imageTitleLabel=tmpView1 as! UILabel
                imageTitleLabel.text=imageData.image_b_r_title
            }
            
            let tmpView2=contentView.viewWithTag(400+i)
            if tmpView2?.isKindOfClass(UILabel)==true{
                let TitleLabel=tmpView2 as! UILabel
                TitleLabel.text=imageData.title
            }
           
            let tmpView3=contentView.viewWithTag(500+i)
            if tmpView3?.isKindOfClass(UILabel)==true{
                let subTitleLabel=tmpView3 as! UILabel
                subTitleLabel.text=imageData.sub_title
                
            }
            
        }
 
            }
    //创建cell的方法
    class func creatTwoCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,homePageModel5:[Homescardsinf2]?)->TwoCell{
        
        let cellId="twoCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? TwoCell
        if nil == cell {
            
            cell=NSBundle.mainBundle().loadNibNamed("TwoCell", owner: nil, options: nil).last as? TwoCell
            
            
            
        }
        //显示数据
        cell!.homePageModel5=homePageModel5
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
