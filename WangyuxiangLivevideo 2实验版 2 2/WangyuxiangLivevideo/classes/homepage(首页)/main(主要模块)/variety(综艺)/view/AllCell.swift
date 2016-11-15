//
//  AllCell.swift
//  WangyuxiangLivevideo
//
//  Created by qianfeng on 16/10/28.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit


class AllCell: UITableViewCell {
    //点击事件
    var jumpClosure: IngreJumpClosure?
    
    //显示数据
    var homePageModel1: [Homescardsinf2]? {
        didSet {
            showData()
        }
    }

 
    @IBAction func btnClick(sender: UIButton) {
        let index=sender.tag-100
        if ((homePageModel1![index].skip_inf!.skip_url) != nil){
            urlstring = homePageModel1![index].skip_inf!.skip_url
            
        }else if homePageModel1![index].skip_inf?.video_id != nil{
            urlstring="http://www.tudou.com/programs/view/"+homePageModel1![index].skip_inf!.video_id!
        }else{
            urlstring = "http://www.tudou.com/programs/view/S0Ppc63qDg4"
        }
        if jumpClosure != nil{
            jumpClosure!(urlstring!)
            
        }
        
    }
      func  showData(){
        //图片
        for i in 0...2{
            
            let imageData=homePageModel1![i]
            let tmpView=contentView.viewWithTag(500+i)
            if tmpView?.isKindOfClass(UIImageView)==true{
                let btn=tmpView as! UIImageView
                if imageData.image_200_300 != nil{
                    let url = NSURL(string:(imageData.image_200_300)!)
                    btn.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "38bg_failed_black@2x"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
            }
         
            let tmpView1=contentView.viewWithTag(200+i)
            if tmpView1?.isKindOfClass(UILabel)==true{
                let imageTitleLabel=tmpView1 as! UILabel
                if imageData.image_b_r_title != nil{
                    imageTitleLabel.text=imageData.image_b_r_title
                }
            }
            
            let tmpView2=contentView.viewWithTag(300+i)
            if tmpView2?.isKindOfClass(UILabel)==true{
                let TitleLabel=tmpView2 as! UILabel
                if imageData.title != nil{
                    TitleLabel.text=imageData.title
                }
            }
            let tmpView3=contentView.viewWithTag(400+i)
            if tmpView3?.isKindOfClass(UILabel)==true{
                let subTitleLabel=tmpView3 as! UILabel
                if imageData.sub_title != nil{
                    subTitleLabel.text=imageData.sub_title
                }
                }
            }
            
    }
  
    
        
        
    

    //创建cell的方法
    class func creatAllCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,homePageModel1:[Homescardsinf2]?)->AllCell{
        
        let cellId="AllCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? AllCell
        if nil == cell {
            //IngreBannerCell.xib
            cell=NSBundle.mainBundle().loadNibNamed("AllCell", owner: nil, options: nil).last as? AllCell
            
        }
        //显示数据
        cell!.homePageModel1=homePageModel1
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
